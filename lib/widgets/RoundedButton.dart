
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final String title;
  final Color color;
  final VoidCallback? onPressed;

  const RoundedButton({required this.title,required this.color,this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color),
        height: 40,
        width: 40,
        child: Center(child: Text(title,style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
      )
      ),
    );
  }
}
