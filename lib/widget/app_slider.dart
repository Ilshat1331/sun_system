import 'package:flutter/material.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({
    super.key,
    required this.label,
    required this.value,
    required Function(double)? this.onChanged,
    required this.min,
    required this.max,
  });

  final double value;
  final String label;
  final double min;
  final double max;

  final void Function(double)? onChanged;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(widget.label),
        ),
        Slider(
          divisions: 10,
          min: widget.min,
          max: widget.max,
          value: widget.value,
          label: widget.value.round().toString(),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
