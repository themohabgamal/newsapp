import 'package:flutter/material.dart';
import 'package:news_app/theme.dart';
import 'package:provider/provider.dart';

import '../../Provider/SettingsProvider.dart';

class SettingsBottomSheet extends StatefulWidget {

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var sp = Provider.of<SettingsProvider>(context);
    String currentTheme;
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap:() {
              setState(() {
                sp.setTheme(ThemeMode.light);
                currentTheme='light';
              });
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              child: Text('Light',style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Divider(height: 1,thickness: 1,color: myTheme.teal,),
          InkWell(
            onTap:() {
              setState(() {
                sp.setTheme(ThemeMode.dark);
                currentTheme='dark';
              });
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Text('Dark',style: Theme.of(context).textTheme.headline5),
            ),
          ),
        ],
      ),
    );
  }
}
