// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import '../../app_router.dart';
import '../../main_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const IncreasingNumber(
            value: 1000,
            duration: 1000,
            step: 5,
          ),
          ElevatedButton(
            onPressed: () => AppRouter.pushNamed(MainRouter.gamePath),
            child: const Text("Play"),
          ),
        ],
      ),
    );
  }
}

class IncreasingNumber extends StatefulWidget {
  const IncreasingNumber({
    Key? key,
    required this.value,
    required this.duration,
    required this.step,
  }) : super(key: key);

  final double value;
  final int duration;
  final int step;

  @override
  State<IncreasingNumber> createState() => _IncreasingNumberState();
}

class _IncreasingNumberState extends State<IncreasingNumber> {
  double currentValue = 0;

  @override
  void initState() {
    final valuePerStep = widget.value / widget.step;
    Timer.periodic(
      Duration(milliseconds: (widget.duration / widget.step).floor()),
      (timer) {
        final nextValue = currentValue + valuePerStep;
        if (nextValue <= widget.value) {
          setState(() => currentValue += valuePerStep.floor());
        } else {
          setState(() => currentValue = widget.value);
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(currentValue.toString());
  }
}
