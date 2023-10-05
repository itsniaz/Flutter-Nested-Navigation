import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Card(child: Center(child: Text("Screen B",style: TextStyle(fontSize: 22,),))),
    );
  }
}
