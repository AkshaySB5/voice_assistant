import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_assistant/featurebox.dart';
import 'package:voice_assistant/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';
  @override
  void initState() {
    super.initState();
    initSpeechtoText();
  }

  Future<void> initSpeechtoText() async {
    await speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Voice Assistant'),
          leading: const Icon(Icons.menu),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                        height: 120,
                        width: 120,
                        margin: const EdgeInsets.only(top: 4),
                        decoration: const BoxDecoration(
                          color: Pallete.assistantCircleColor,
                          shape: BoxShape.circle,
                        )),
                  ),
                  Container(
                    height: 125,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/virtualAssistant.png')),
                    ),
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 40)
                    .copyWith(top: 30),
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Pallete.whiteColor,
                    borderRadius: BorderRadius.circular(20)
                        .copyWith(topLeft: Radius.zero)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Good Morning, What task can i do for you?',
                    style: TextStyle(
                        fontSize: 25,
                        color: Pallete.mainFontColor,
                        fontFamily: 'Cera Pro'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, left: 23),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Here are a few features',
                  style: TextStyle(
                      fontFamily: 'Cera Pro',
                      color: Pallete.mainFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Column(
                children: [
                  FeatureBox(
                      colour: Pallete.firstSuggestionBoxColor,
                      htext: 'ChatGPT',
                      description:
                          'A smarter way to stay organized and informed with ChatGPT'),
                  FeatureBox(
                      colour: Pallete.secondSuggestionBoxColor,
                      htext: 'Dall-E',
                      description:
                          'Get inspired and stay creative with your personal assistant powered by Dall-E'),
                  FeatureBox(
                      colour: Pallete.thirdSuggestionBoxColor,
                      htext: 'Smart Voice Assistant',
                      description:
                          'Get the best of both the worlds with a voie assistant powered by Dall-E and ChatGPT ')
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Pallete.firstSuggestionBoxColor,
            onPressed: () {},
            child: const Icon(Icons.mic)));
  }
}
