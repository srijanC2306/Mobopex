import 'dart:async';
import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterWidget extends StatefulWidget {
  final DateTime endTime;

  const CounterWidget({
    required this.endTime,
    super.key,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late Timer _timer;
  Duration _timeUntilEnd = const Duration();

  @override
  void initState() {
    super.initState();
    _calculateTimeUntilEnd();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Always cancel the timer when disposing the widget
    super.dispose();
  }

  void _calculateTimeUntilEnd() {
    DateTime now = DateTime.now();
    if (now.isBefore(widget.endTime)) {
      _timeUntilEnd = widget.endTime.difference(now);
    } else {
      _timeUntilEnd = Duration.zero;
      _timer.cancel(); // Cancel the timer if the end time has passed
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _calculateTimeUntilEnd();
        // You can remove the print statement when you're done debugging
        print('Remaining Time: $_timeUntilEnd');
        if (_timeUntilEnd == Duration.zero) {
          _timer.cancel(); // Stop the timer when it reaches zero
        }
      });
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitsHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitsSeconds = twoDigits(duration.inSeconds.remainder(60));
    return """
${twoDigits(duration.inDays)}:$twoDigitsHours:$twoDigitsMinutes:$twoDigitsSeconds""";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context) ;
    List<String> timeParts = formatDuration(_timeUntilEnd).split(":");
    return Row(
      children: [
      const   Text("Ending in:  ",
          style: BaseTextStyle(
              fontSize: 15 ,
              fontWeight: FontWeight.w400 ,
              color: ColorConstants.textColor
          ),),
        ...timeParts.map((part) => _buildTimeBox(part ,theme )).toList(),
        ]
    );
  }

  Widget _buildTimeBox(String timePart , ThemeData theme) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 2),
      padding:  EdgeInsets.symmetric(vertical: 4, horizontal:8 ),
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor.withOpacity(0.23),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Text(
        timePart,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
