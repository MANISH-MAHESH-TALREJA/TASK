import 'package:flutter/material.dart';
import '../../resources/colors/base_colors.dart';

class AppColors implements BaseColors
{
  @override
  Color get colorAccent => Colors.amber;

  @override
  Color get colorPrimary => const Color(0xff49ABFF);

  @override
  Color get colorPrimaryText => const Color(0xff49ABFF);

  @override
  Color get colorSecondaryText => const Color(0xff3593FF);

  @override
  Color get colorWhite => const Color(0xffffffff);

  @override
  Color get colorBlack => const Color(0xff000000);
}