

import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {

  final String text;
  final Color color;

  const RoutePage({required this.text,required this.color,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: color,
        child: Center(child: Text(text,style: const TextStyle(fontSize: 36,fontWeight: FontWeight.w700,color: Colors.white),))
      ),
    );
  }
}
