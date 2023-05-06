import 'package:flutter/material.dart';

class App_Tab extends StatelessWidget {
  final String text;
  final Color color;
  const App_Tab({required this.text, required this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width:120,
        height: 50,
        child:Text(text,style: TextStyle(fontSize: 18),),
        alignment: Alignment.center,
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
            boxShadow:[ BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                offset:Offset (0,0)
            )]
        )
    );
  }
}
