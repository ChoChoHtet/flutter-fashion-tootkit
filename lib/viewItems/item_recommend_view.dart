import 'package:flutter/material.dart';

class ItemRecommendView extends StatelessWidget{
  const ItemRecommendView({Key? key,
    required this.name,
    required this.imgPath,
    required this.color,
    required this.textColor,
  }) : super(key: key);
  final String name;
  final String imgPath;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          Image.asset(imgPath,width: 100,height: 100,fit: BoxFit.cover,),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 10),
             child: Text(
              name,
              style:  TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
          ),
           ),
        ],
      ),
    );
  }
  
}