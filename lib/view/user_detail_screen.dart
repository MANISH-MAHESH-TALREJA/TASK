import 'package:flutter/material.dart';
import 'package:task/view/widget/custom_text_view.dart';
import 'package:task/resources/app_context.dart';
import '../../models/users_model.dart';
import '../app_config.dart';

class UserDetailsScreen extends StatelessWidget
{
  final UserModel? userData;
  UserDetailsScreen(this.userData);

  @override
  Widget build(BuildContext context)
  {
    var config = AppConfig.of(context);
    final _inputController = TextEditingController();
    _inputController.text = userData!.name!;
    return Scaffold(
      appBar: AppBar(title: Text(context.resources.strings.userDetailScreen), centerTitle: true, backgroundColor: config?.appColor),
      body: Container(
        color: context.resources.color.colorWhite,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.00, vertical: 15.00),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Image.asset('assets/emoji.png',
                      errorBuilder: (context, error, stackTrace)
                      {
                        return Image.asset('assets/emoji.png');
                      },
                      fit: BoxFit.fill,
                      height: 200, width: 200,
                    ),
                  ),
                ),
                inputFields(userData!.name!, Icons.person, 'NAME'),
                inputFields(userData!.company!.name!, Icons.apartment_outlined, 'COMPANY NAME'),
                inputFields(userData!.email!, Icons.email, 'EMAIL'),
                inputFields(userData!.phone!, Icons.phone, 'PHONE'),
                inputFields(userData!.address!.city!, Icons.location_city_outlined, 'CITY'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputFields(String text, IconData icon, String title, )
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 12.0),
      child: TextFormField(
        initialValue: text,
        enabled: false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          disabledBorder: const OutlineInputBorder(),
          labelText: title,
          labelStyle: const TextStyle(color: Colors.blueAccent),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, size: 25, color: Colors.red,),
          ),
          contentPadding: const EdgeInsets.only(right: 0, left: 10, top: 5, bottom: 5),
        ),
      ),
    );
  }
}
