import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer; //late는 당장 property를 초기화하지 않는다.

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros++;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onStartPressed() {
    //타이머는 Dart 표준 라이브러리에 포함되어 있다.
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    ); //periodic은 주기적으로 함수를 실행한다.
    //함수에 괄호는 넣지 않는다. 그것은 함수를 지금 실행하는것을 의미한다(?)
    //함수는 timer 스스로를 인자로 가지고 간다.

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();

    setState(() {
      totalSeconds = twentyFiveMinutes;
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(
      seconds: seconds,
    );
    // print(duration); //길게 알려줌 (0:21:21.000000)
    // print(duration.inMinutes); //소수점도 없고 그냥 대충 몇분인지 알려주는듯
    // print(duration.inSeconds); //1308 처럼 값이 나옴
    // print(duration.toString().split('.').first);
    // print(duration.toString().split('.').first.split(':'));        //I/flutter ( 3146): [0, 19, 28]
    // print(duration.toString().split('.').first.substring(2, 7));   //I/flutter ( 3146): 19:22
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: isRunning
                        ? const Icon(Icons.pause_circle_outline_outlined)
                        : const Icon(Icons.play_circle_outline),
                  ),
                  IconButton(
                    iconSize: 30,
                    color: Theme.of(context).cardColor,
                    onPressed: onResetPressed,
                    icon: const Icon(Icons.restore_outlined),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,

                        //border Radius 방법
                        // borderRadius: BorderRadius.circular(50),
                        // borderRadius: const BorderRadius.only(
                        //   topLeft: Radius.circular(50),
                        //   topRight: Radius.circular(50),
                        // ),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(40),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodors',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
