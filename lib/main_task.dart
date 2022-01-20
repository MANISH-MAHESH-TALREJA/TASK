import 'package:flutter/material.dart';
import 'app_config.dart';
import 'main_common.dart';

void main()
{
  var configuredApp = AppConfig(appDisplayName: "TASK", appColor: Colors.pink, appInternalId: 1, child: const MyApp());
  mainCommon();
  runApp(configuredApp);
}