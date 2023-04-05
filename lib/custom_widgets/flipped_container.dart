import 'dart:async';

import 'package:flutter/material.dart';

class FlipContainer extends StatefulWidget {
  final Widget child;
  final ValueChanged<bool> onSwipe;
  FlipContainer({required this.child, required this.onSwipe});

  @override
  _FlipContainerState createState() => _FlipContainerState();
}

class _FlipContainerState extends State<FlipContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isFrontVisible = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHorizontalDrag(DragUpdateDetails details) {
    // Update the animation value based on the horizontal drag delta
    _animationController.value += details.delta.dx / (context.size!.width) / 2;
    if (details.delta.dx < 0) {
      // Flip to the back side
      _animationController.forward();
      _isFrontVisible = !false;
      if (mounted) setState(() {});
      Timer(const Duration(milliseconds: 60), () {
        _animationController.reverse();
        setState(() {
          _isFrontVisible = true;
        });
        widget.onSwipe(true);
      });
    } else {
      _animationController.value -= details.delta.dx / context.size!.width;
      widget.onSwipe(false);
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _handleHorizontalDrag,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final matrix = Matrix4.identity();
          // Apply horizontal flip effect
          matrix.setEntry(3, 2, 0.002);
          matrix.rotateY(_animation.value * 3.14);
          return Transform(
            transform: matrix,
            alignment: Alignment.center,
            child: widget.child,
          );
        },
      ),
    );
  }
}
