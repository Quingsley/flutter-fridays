import 'package:countdown_challenge/model/ktimer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/challenges_provider.dart';
import 'components/card.dart';
import 'components/kbutton.dart';
import 'components/tiles.dart';
import 'components/time_text.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _timer;
  int _days = 0;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  bool _isStarted = false;

  void startTimer() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      _isStarted = true;
      setState(() {
        if (_seconds < 59) {
          _seconds++;
        } else {
          _seconds = 0;
          if (_minutes < 59) {
            _minutes++;
          } else {
            _minutes = 0;
            if (_hours < 23) {
              _hours++;
            } else {
              _hours = 0;
              _days++;
            }
          }
        }
      });
    });
  }

  void stopTimer() {
    _timer!.cancel();
    Provider.of<WonChallenges>(context, listen: false).addWonChallenge(
      KTimer(
        date: DateTime.now(),
        days: _days,
        hours: _hours,
        minutes: _minutes,
        seconds: _seconds,
      ),
    );
    setState(() {
      _isStarted = false;
      _days = 0;
      _hours = 0;
      _minutes = 0;
      _seconds = 0;
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green.shade800,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 36,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_drop_down_circle_outlined),
            onPressed: () {},
            iconSize: 36,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            color: Colors.green.shade800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MCard(text: _days.toString().padLeft(2, '0')),
                    MCard(text: _hours.toString().padLeft(2, '0')),
                    MCard(text: _minutes.toString().padLeft(2, '0')),
                    MCard(text: _seconds.toString().padLeft(2, '0')),
                  ],
                ),
                const SizedBox(height: 20),
                const TimeText(),
                const SizedBox(height: 20),
                KButton(
                  text: !_isStarted ? 'Start' : 'Stop',
                  startTimer: !_isStarted ? startTimer : stopTimer,
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.485,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF343a40),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Challenges That You won :',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Consumer<WonChallenges>(
                      builder: (context, wonChallenges, child) {
                    if (wonChallenges.wonChallenges.isEmpty) {
                      return const Center(
                        child: Text(
                          'No Challenges Won Yet',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: wonChallenges.wonChallenges.length,
                        itemBuilder: (context, index) {
                          return Tile(
                            date:
                                '${wonChallenges.wonChallenges[index].date.year}-${wonChallenges.wonChallenges[index].date.month}-${wonChallenges.wonChallenges[index].date.day}',
                            day: wonChallenges.wonChallenges[index].days!,
                            hour: wonChallenges.wonChallenges[index].hours!,
                            minute: wonChallenges.wonChallenges[index].minutes!,
                            second: wonChallenges.wonChallenges[index].seconds!,
                          );
                        });
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
