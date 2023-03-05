import 'package:flutter/foundation.dart';
import '../model/ktimer.dart';

class WonChallenges extends ChangeNotifier {
  final List<KTimer> _wonChallenges = [];

  List<KTimer> get wonChallenges => _wonChallenges;

  void addWonChallenge(KTimer timer) {
    _wonChallenges.add(timer);
    notifyListeners();
  }
}
