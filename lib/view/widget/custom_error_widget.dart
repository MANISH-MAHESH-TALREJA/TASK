import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget
{
  final String msg;
  CustomErrorWidget(this.msg);

  @override
  Widget build(BuildContext context)
  {
    return Center(child: Text(msg));
  }
}