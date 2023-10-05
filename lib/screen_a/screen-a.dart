

import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Card(child: Center(child: Text("Screen A",style: TextStyle(fontSize: 22,),))),
    );
  }
}
