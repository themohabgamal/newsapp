import 'package:flutter/material.dart';
import 'package:news_app/Provider/SettingsProvider.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/settings/LangBottomSheet.dart';
import 'package:news_app/ui/settings/SettingsBottomSheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.theme,
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
                  child: Text(sp.currentTheme==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,style: Theme.of(context).textTheme.headline5),
                  decoration: BoxDecoration(
                    color: myTheme.teal,
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  setState(() {
                    showLangBottomSheet();
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Text(sp.currentLang=='en'?'English':'French',style: Theme.of(context).textTheme.headline5),
                  decoration: BoxDecoration(
                    color: myTheme.teal,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              Expanded(child: SvgPicture.asset('assets/images/settingss.svg')),
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
  }  void showLangBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LangBottomSheet();
      },
    );
  }

}
