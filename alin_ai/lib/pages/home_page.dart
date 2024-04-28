import "package:alin_ai/components/drawer.dart";
import "package:alin_ai/pages/message_widget.dart";
import "package:flutter/material.dart";
import "package:google_generative_ai/google_generative_ai.dart";
import "package:speech_to_text/speech_to_text.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GenerativeModel _model;
  late final ChatSession _chatSession;
  final FocusNode _textFieldFocus = FocusNode();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  // ignore: unused_field
  bool _loading = false;
  SpeechToText speech = SpeechToText();
  var isListening = false;

  void checkMic() async {
    bool micAvailable = await speech.initialize();
    if (micAvailable) {
      // ignore: avoid_print
      print('Microphone Available');
    } else {
      // ignore: avoid_print
      print('User Denied the use of speech micro');
    }
  }

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
        model: 'gemini-pro', apiKey: const String.fromEnvironment('apiKey'));
    _chatSession = _model.startChat();
    checkMic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'lib/images/ALIN_Logo_second.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _chatSession.history.length,
                    itemBuilder: (context, index) {
                      final Content content =
                          _chatSession.history.toList()[index];
                      final text = content.parts
                          .whereType<TextPart>()
                          .map<String>((e) => e.text)
                          .join('');
                      return MessageWidget(
                        text: text,
                        isFromUser: content.role == 'user',
                      );
                    })),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 15,
              ),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    autocorrect: true,
                    focusNode: _textFieldFocus,
                    decoration: _textFieldDecoration(),
                    controller: _textController,
                    onSubmitted: _sendChatMessage,
                  )),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _textFieldDecoration() {
    return InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Message ALIN...',
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(14),
            ),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary)),
        suffixIcon: GestureDetector(
          onTap: () async {
            if (!isListening) {
              bool micAvailable = await speech.initialize();
              if (micAvailable) {
                setState(() {
                  isListening = true;
                });

                speech.listen(
                    listenFor: const Duration(seconds: 20),
                    onResult: (result) {
                      setState(() {
                        _textController.text = result.recognizedWords;
                      });
                    });
              }
            } else {
              setState(() {
                isListening = false;

                speech.stop();
              });
            }
          },
          child: isListening
              ? const Icon(Icons.record_voice_over)
              : const Icon(Icons.mic),
        ));
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await _chatSession.sendMessage(
        Content.text(message),
      );
      final text = response.text;
      if (text == null) {
        _showError('No response from API.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void _showError(String message) {
    showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Something went wrong'),
            content: SingleChildScrollView(
              child: SelectableText(message),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            ],
          );
        });
  }
}
