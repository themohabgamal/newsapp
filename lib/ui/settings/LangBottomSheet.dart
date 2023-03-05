import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Provider/SettingsProvider.dart';
import 'package:news_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LangBottomSheet extends StatefulWidget {

  @override
  State<LangBottomSheet> createState() => _LangBottomSheetState();
}

class _LangBottomSheetState extends State<LangBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var sp=Provider.of<SettingsProvider>(context);
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 30,horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap:() {
              setState(() {
                sp.setLang('en');
              });
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              child: Text(AppLocalizations.of(context)!.english,style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(height: 1,thickness: 1,color: myTheme.teal,),
          ),
          InkWell(
            onTap:() {
              setState(() {
                sp.setLang('fr');
              });
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Text('French',style: Theme.of(context).textTheme.headline5),
            ),
          ),

        ],
      ),
    );
  }
}
