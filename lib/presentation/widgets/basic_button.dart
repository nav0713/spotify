import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final Function()  onPressed;
  final String title;
  final double? height;
  const BasicAppButton({super.key,required this.onPressed,required this.title,this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??60,
      width: 200,
      child: ElevatedButton(
        
        onPressed: onPressed, child: Text(title,style: const TextStyle(color: Colors.white))),
    );
  }
}