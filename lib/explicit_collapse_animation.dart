import 'package:flutter/material.dart';

const kAnimationCollapse = Duration(seconds: 1);
class ExplicitCollapseAnimation extends StatefulWidget{
  const ExplicitCollapseAnimation({Key? key, required this.onTapCollapse}) : super(key: key);
  final VoidCallback onTapCollapse ;

  @override
  State<ExplicitCollapseAnimation> createState() => _ExplicitCollapseAnimationState();
}

class _ExplicitCollapseAnimationState extends State<ExplicitCollapseAnimation> with TickerProviderStateMixin {
  bool isAnimationComplete = false;
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  bool collapseText =  false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: kAnimationCollapse, vsync: this);

    _rotateAnimation = Tween<double>(begin: 0,end: 0.5).animate(_controller.view);

    _controller.addStatusListener((status) {
      isAnimationComplete = (AnimationStatus.completed == status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, _) => RotationTransition(
        turns: _rotateAnimation,
        child: IconButton(
          onPressed: () {
            widget.onTapCollapse() ;
            if (isAnimationComplete) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          icon: const Icon(
            Icons.arrow_drop_up_outlined,
            size: 30,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}