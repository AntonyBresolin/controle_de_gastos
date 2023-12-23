import 'package:flutter/material.dart';

class SliderAmount extends StatefulWidget {
  const SliderAmount({super.key});

  @override
  State<SliderAmount> createState() => _SliderAmountState();
}

class _SliderAmountState extends State<SliderAmount> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 1000,
      divisions: 1000,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
