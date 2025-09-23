
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPickerDemo extends StatefulWidget {
  const TimerPickerDemo({super.key});

  @override
  State<TimerPickerDemo> createState() => _TimerPickerDemoState();
}

class _TimerPickerDemoState extends State<TimerPickerDemo> {
  Duration _duration = const Duration(hours: 0, minutes: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Timer Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected duration: ${_duration.inHours}h ${_duration.inMinutes % 60}m',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hm, // Hours & Minutes
                initialTimerDuration: _duration,
                minuteInterval: 5, // تظهر كل 5 دقائق
                secondInterval: 1,
                onTimerDurationChanged: (Duration newDuration) {
                  setState(() {
                    _duration = newDuration;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
