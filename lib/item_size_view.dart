import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 500);
class ItemSizeView extends StatelessWidget {
  final String label;
  final bool changeBackground;
  final VoidCallback onTapSize;

  const ItemSizeView({
    Key? key,
    required this.label,
    required this.changeBackground,
    required this.onTapSize
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapSize,
      child:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: AnimatedContainer(
          duration: kAnimationDuration,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: changeBackground ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
              child: Text(
                label,
                style:  TextStyle(
                  color: changeBackground ? Colors.white : Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )),
        ),
      ),
    );
  }
}
