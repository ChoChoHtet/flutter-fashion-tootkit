import 'package:flutter/material.dart';

class RecommendItemView extends StatelessWidget{
  const RecommendItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.pinkAccent[200],
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          Image.asset("assets/images/high_heels.png",width: 100,height: 100,fit: BoxFit.cover,),
          const Text(
            "shoes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
  
}