import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Provider/SettingsProvider.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/Categories/Categories.dart';
import 'package:news_app/ui/Home/home_page.dart';
import 'package:news_app/ui/settings/settings.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var screen=0;
  @override
  Widget build(BuildContext context) {
    var sp=Provider.of<SettingsProvider>(context);
    return Scaffold(

       bottomNavigationBar: Padding(
         padding: EdgeInsets.all(7),
        child:Material(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(50)),
          //   color: sp.currentTheme==ThemeMode.light?myTheme.mainColor:Colors.black,
          // ),
          // padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
          // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          // width: 80,
          color:sp.currentTheme==ThemeMode.light?myTheme.mainColor:myTheme.mainDarker,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Container(
            height: 70,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        screen=0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8.0),
                      child: ImageIcon(AssetImage("assets/images/house.png"),color: Colors.grey,size: 20,),
                    )),
                InkWell(
                    onTap: () {
                      setState(() {
                        screen=1;
                      });
                    },
                    child: ImageIcon(AssetImage("assets/images/list.png"),color: Colors.grey,size: 20,)),
                InkWell(
                    onTap: () {
                      setState(() {
                        screen=2;
                      });
                    },
                    child: ImageIcon(AssetImage("assets/images/settings.png"),color: Colors.grey,size: 25,)),
              ],
            ),
          ),
        ),
      ),
      body: screens[screen],
    );
  }
  List<Widget>screens=[homePage(),Categories(),settings()];
}
