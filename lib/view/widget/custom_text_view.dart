import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget
{
  final label;
  final Color color;
  final double fontSize;
  CustomTextView(this.label,this.color,this.fontSize);
  @override
  Widget build(BuildContext context)
  {
    return Text(label, style: TextStyle(color: color, fontSize: fontSize));
  }
}
