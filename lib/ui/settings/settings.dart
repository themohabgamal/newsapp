import 'package:flutter/material.dart';
import 'package:news_app/Provider/SettingsProvider.dart';
import 'package:news_app/ui/settings/SettingsBottomSheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class settings extends StatefulWidget {
  static const routeName = 'settings';

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    var sp = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: null,
      body: Container(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Theme',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                 setState(() {
                   showThemeBottomSheet();
                 });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Text(sp.currentTheme==ThemeMode.light?'Light':'Dark',style: Theme.of(context).textTheme.headline5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              Expanded(child: Image.asset('assets/images/settings.png'))
            ],
          ),
        ),
      ),
    );
  }
  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SettingsBottomSheet();
      },
    );
  }
}
