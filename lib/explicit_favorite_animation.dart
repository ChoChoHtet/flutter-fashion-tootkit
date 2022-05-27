import 'package:flutter/material.dart';

const kAnimationFav = Duration(seconds: 1);
class ExplicitFavoriteAnimation extends StatefulWidget{
  const ExplicitFavoriteAnimation({Key? key}) : super(key: key);

  @override
  State<ExplicitFavoriteAnimation> createState() => _ExplicitFavoriteAnimationState();
}

class _ExplicitFavoriteAnimationState extends State<ExplicitFavoriteAnimation> with TickerProviderStateMixin {
  bool isAnimationComplete = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: kAnimationFav, vsync: this);
    _colorAnimation = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_controller.view);


    _rotateAnimation = Tween<double>(begin: 0,end: 1).animate(_controller.view);

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
            if (isAnimationComplete) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
            //_controller.repeat();
          },
          icon: Icon(
            Icons.favorite_border_outlined,
            size: 30,
            color: _colorAnimation.value,
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