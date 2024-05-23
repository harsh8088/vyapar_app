import 'package:flutter/material.dart';

class ExpandingWidget extends StatefulWidget {
  final Widget child;
  final bool initiallyVisible;
  final Duration duration;
  final VoidCallback? onToggle;

  const ExpandingWidget({
    Key? key,
    required this.child,
    this.initiallyVisible = false,
    this.duration = const Duration(milliseconds: 300),
    this.onToggle,
  }) : super(key: key);

  @override
  State<ExpandingWidget> createState() => _ExpandingWidgetState();
}

class _ExpandingWidgetState extends State<ExpandingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _heightAnimation = Tween<double>(begin: 0, end: 0.5)
        .animate(_controller)
      ..addListener(() => setState(() {}));
    if (widget.initiallyVisible) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    final isExpanded = _controller.value == 1;
    if (isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    widget.onToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: widget.duration,
          height: MediaQuery.of(context).size.height * _heightAnimation.value,
          child: widget.child,
        ),
        Expanded(
          child: GestureDetector(
            onTap: _toggle,
            child: Container(
              color: Colors.grey.withOpacity(0.2), // Optional background color
            ),
          ),
        ),
      ],
    );
  }
}