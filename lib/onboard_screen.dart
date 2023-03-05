import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/Home/home_page.dart';
import 'package:news_app/ui/Home/home_screen.dart';

class OnBoardScreen extends StatelessWidget {
  static final String routeName = 'board';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 150,bottom: 30),
      child: IntroductionScreen(
        pages: [
          PageViewModel(
              title: "Welcome to Live news",
              body:
                  "Newspaper is one of the most popular assets of our daily lives. We developed this app to deliver all news to your phone.",
              image: Center(
                child: SvgPicture.asset('assets/images/welcome.svg'),
              ),
              decoration: PageDecoration(
                titleTextStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                titlePadding: EdgeInsets.all(10),
                bodyPadding: EdgeInsets.all(20),
                imagePadding: EdgeInsets.all(20),
                pageColor: Colors.white,
              )),
          PageViewModel(
              title: "User Interface",
              body:
                  "We provide interactive, visual and architectural designs. Easy to use",
              image: Center(
                child: SvgPicture.asset('assets/images/ui.svg'),
              ),
              decoration: PageDecoration(
                titleTextStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                titlePadding: EdgeInsets.all(10),
                bodyPadding: EdgeInsets.all(20),
                imagePadding: EdgeInsets.all(20),
                pageColor: Colors.white,
              )),
          PageViewModel(
              title: "Filter content",
              body:
                  "We provide the option of filtering the content based on different category so, you can look for special news based on your taste",
              image: Center(
                child: SvgPicture.asset('assets/images/filter.svg'),
              ),
              decoration: PageDecoration(
                titleTextStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                titlePadding: EdgeInsets.all(10),
                bodyPadding: EdgeInsets.all(20),
                imagePadding: EdgeInsets.all(20),
                pageColor: Colors.white,
              )),
          PageViewModel(
              title: "Languages",
              body:
                  "The app provides English and French localization where you can get news based on language you select as  its area of interest",
              image: Center(
                child: SvgPicture.asset('assets/images/language.svg'),
              ),
              decoration: PageDecoration(
                titleTextStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                titlePadding: EdgeInsets.all(10),
                bodyPadding: EdgeInsets.all(20),
                imagePadding: EdgeInsets.all(20),
                pageColor: Colors.white,
              )),
        ],
        dotsDecorator: DotsDecorator(
            color: Colors.grey,
            activeColor: myTheme.teal,
            activeSize: Size(30,10),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        next: Icon(Icons.arrow_forward_ios, size: 25, color: myTheme.teal),
        showSkipButton: true,
        skip: Text("Skip", style: TextStyle(fontSize: 20, color: myTheme.teal)),
        done: Text(
          "Start Now!",
          style: TextStyle(fontSize: 20, color: myTheme.teal),
        ),
        globalBackgroundColor: Colors.white,
        onDone: () {
          Navigator.of(context).pushReplacementNamed(homeScreen.routeName);
        },
      ),
    );
  }
}
