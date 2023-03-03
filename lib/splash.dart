import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/Home/home_screen.dart';

class splashScreen extends StatelessWidget {
static final String routeName='splash';
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 2),() {
        Navigator.of(context).pushReplacementNamed(homeScreen.routeName);
      },
    );
    return Scaffold(
      backgroundColor: myTheme.mainColor,
      body: Center(child: Image.asset("assets/images/news.png",width: 280,),),
    );
  }
}
