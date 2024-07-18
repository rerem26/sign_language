import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice to Sign Language',
      home: Voice_To_Sign(),
    );
  }
}

class Voice_To_Sign extends StatefulWidget {
  @override
  _VoiceToSignPageState createState() => _VoiceToSignPageState();
}

class _VoiceToSignPageState extends State<Voice_To_Sign> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// Initialize the speech to text instance
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Start listening for speech input
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Stop listening for speech input
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// Callback when speech recognition results are available
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice to Sign Language'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  // Display recognized words if listening is active
                  _speechToText.isListening
                      ? '$_lastWords'
                  // Display instructions to start listening if not active
                      : _speechEnabled
                      ? 'Tap the microphone to start listening...'
                  // Display message if speech recognition is not available
                      : 'Speech not available',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
        _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(
            _speechToText.isNotListening ? Icons.mic : Icons.mic_off),
      ),
    );
  }
}
