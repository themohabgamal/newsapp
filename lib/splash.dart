import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/onboard_screen.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/Home/home_screen.dart';

class splashScreen extends StatelessWidget {
static final String routeName='splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.mainColor,
      body: OnBoardScreen(),
    );
  }
}
