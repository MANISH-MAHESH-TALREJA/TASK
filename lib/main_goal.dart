import 'package:flutter/material.dart';
import 'app_config.dart';
import 'main_common.dart';

void main()
{
  var configuredApp = AppConfig(appColor: Colors.green, appDisplayName: "GOAL", appInternalId: 2, child: const MyApp());
  mainCommon();
  runApp(configuredApp);
}