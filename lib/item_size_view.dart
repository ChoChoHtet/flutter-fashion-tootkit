import 'package:flutter/material.dart';

class ItemSizeView extends StatelessWidget {
  final String label;
  final Color backgroundColor;

  const ItemSizeView({
    Key? key,
    required this.label,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )
        ),
      ),
    );
  }
}
