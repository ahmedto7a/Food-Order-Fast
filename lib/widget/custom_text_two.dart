import 'package:flutter/material.dart';

class CustomTextt extends StatelessWidget {
  //const CustomText({Key? key}) : super(key: key);

  final Color color;
  final String text;
  final double size;
  final  Alignment alignment ;
  final FontWeight fontWeight;
  final double hight;
  final overFlow;

  CustomTextt({
    this.size = 18,
    this.color = Colors.black,
    this.text = "",
    this.alignment =Alignment.topLeft,
    this.fontWeight=FontWeight.normal,
    this.hight=1,
    this.overFlow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        overflow:overFlow ,
        style: TextStyle(color: color, fontSize: size,fontWeight: FontWeight.bold,height: hight),
      ),
    );
  }
}
