import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({
    super.key,
    required this.remote,
    required this.duration,
    required this.radius,
    required this.color,
    required this.sunSize,
  });

  final double sunSize;
  final double remote;
  final int duration;
  final double radius;
  final Color color;

  @override
  State<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _angle = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.duration),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 2 * math.pi).animate(_controller)
      ..addListener(() {
        setState(() {
          _angle = _animation.value;
        });
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        math.cos(_angle) * widget.remote + widget.sunSize / 2 - widget.radius / 2,
        math.sin(_angle) * widget.remote + widget.sunSize / 2 - widget.radius / 2,
      ), // Вычисляем новое положение виджета
      child: Icon(
        Icons.language,
        size: widget.radius,
        color: widget.color,
      ),
    );
  }
}
