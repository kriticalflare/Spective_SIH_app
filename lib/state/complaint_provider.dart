import 'package:flutter/material.dart';
import 'package:spective_sih/models/complaint.dart';
import 'package:spective_sih/network/network_helper.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ComplaintsProvider with ChangeNotifier {
  NetworkHelper _networkHelper;
  TextEditingController _editingController;
  SpeechToText speech;
  bool _isListening;

  bool get isListening => _isListening;

  ComplaintsProvider(this._editingController) {
    _networkHelper = NetworkHelper();
    _editingController.text = '';
    _isListening = false;
  }

  void startListening() async {
    speech = SpeechToText();
    bool available = await speech.initialize(
        onStatus: statusListener, onError: onErrorListener);
    if (available) {
      _isListening = true;
      notifyListeners();
      speech.listen(onResult: resultListener, listenFor: Duration(seconds: 10));
    } else {
      _isListening = false;
      print("The user has denied the use of speech recognition.");
    }
  }

  void resultListener(SpeechRecognitionResult result) {
//    _editingController.text = _editingController.text + result.recognizedWords;
    notifyListeners();
    if (result.finalResult) {
      _editingController.text = _editingController.text + result.recognizedWords + ' ';
      _isListening = false;
      speech.stop();
      notifyListeners();
    }
  }

  void onErrorListener(SpeechRecognitionError error) {
    if (error.permanent) {
      _isListening = false;
      speech.stop();
      notifyListeners();
    }
  }

  void statusListener(String status) {
    if (status == 'listening') {
      _isListening = true;
      notifyListeners();
    } else if (status == 'notListening') {
      _isListening = false;
      notifyListeners();
    } else {
      print('Statusss $status');
    }
  }

  Future<void> postComplaint() async {
    await _networkHelper.postComplaint(Complaint(complaint: _editingController.text));
  }
}
