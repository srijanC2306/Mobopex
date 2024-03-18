import 'dart:async';

import 'package:flutter/material.dart';
class CounterWidget extends StatefulWidget {
  final DateTime endTime ;
  const CounterWidget({
    required this.endTime ,
    super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late Timer timer ;
  Duration _timeUntilEnd = const Duration();

  @override
  void initState() {
    super.initState();
    _calculateTimeUntilEnd();
    _startTimer();
  }


  @override
  void dispose() {
    super.dispose();
  }

  _calculateTimeUntilEnd(){
    DateTime now = DateTime.now() ;
    if(now.isBefore(widget.endTime)){
      _timeUntilEnd = widget.endTime.difference(now);
    }else {
      _timeUntilEnd = Duration.zero ;
    }
  }

  void _startTimer(){
    Future.delayed(const Duration(seconds: 1) , (){
      setState(() {
        _calculateTimeUntilEnd();
        print('Remaining Time: $_timeUntilEnd'); // Debug output
      });

    });
  }

  String formatDuration(Duration duration){
      String twoDigit(int n) => n.toString().padLeft(2, '0');
      String twoDigitInMinute = twoDigit(duration.inMinutes.remainder(60));
      String twoDigitInSecond = twoDigit(duration.inSeconds.remainder(60));
      return "${twoDigit(duration.inDays)} ${twoDigit(duration.inHours)} $twoDigitInMinute $twoDigitInSecond";

  }
  @override
  Widget build(BuildContext context) {
    return Text("Ending in: ${formatDuration(_timeUntilEnd)}");
  }
}
