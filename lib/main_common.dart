import 'package:flutter/material.dart';
import 'package:task/view/home_screen.dart';
import 'package:task/resources/app_context.dart';
import 'app_config.dart';

void mainCommon()
{

}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    var config = AppConfig.of(context);
    return _buildApp(context, config!.appDisplayName);
  }

  Widget _buildApp(BuildContext context, String appName)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primaryColor: context.resources.color.colorPrimary,
      ),
      home: const HomeScreen()
    );
  }
}
