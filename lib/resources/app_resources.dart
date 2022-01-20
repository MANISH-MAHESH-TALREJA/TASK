import 'package:flutter/cupertino.dart';
import 'package:task/resources/colors/app_colors.dart';
import 'package:task/resources/dimensions/app_dimensions.dart';
import 'package:task/resources/strings/hindi_strings.dart';
import 'package:task/resources/strings/base_strings.dart';

import 'strings/english_strings.dart';

class Resources
{
  final BuildContext _context;
  Resources(this._context);

  Strings get strings
  {
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode)
    {
      case 'hi':
        return HindiStrings();
      default:
        return EnglishStrings();
    }
  }

  AppColors get color
  {
    return AppColors();
  }
  AppDimension get dimension
  {
    return AppDimension();
  }
  static Resources of(BuildContext context)
  {
    return Resources(context);
  }
}