import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/API/apiManager.dart';
import 'package:news_app/modules/Source.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/Home/hot_news_builder.dart';
import 'package:provider/provider.dart';
import '../../Provider/SettingsProvider.dart';
import '../../modules/NewsResponse.dart';
import '../Categories/category_tabs.dart';
import '../News/news_item.dart';
class homePage extends StatelessWidget {
static const String routeName='homePage';

  @override
  Widget build(BuildContext context) {
    var sp = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 20,),
             Container(
               color: sp.currentTheme==ThemeMode.light?myTheme.whiteGrey:myTheme.mainColor,
             height: 120,
             width: double.infinity,
             alignment: Alignment.centerLeft,
             padding: EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('News at',style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 28,fontWeight: FontWeight.w400),),
                 SizedBox(height: 8,),
                 Text('Another Perspective',style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 35,fontWeight: FontWeight.w500),),

               ],
             ),
             ),
             SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
               child: Text('Hot News',style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
             ),
             SizedBox(height: 10,),
             Expanded(
               child: FutureBuilder(
                 future: apiManager.getSources('general'),
                 builder: (context, snapshot) {
                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return Center(
                       child: CircularProgressIndicator(),
                     );
                   }
                   if (snapshot.hasError) {
                     return Center(
                       child: Text("Error displaying data"),
                     );
                   }
                   if (snapshot.data?.status == 'error') {
                     return Center(
                       child: Text(
                           "Error fetching data from server as ${snapshot.data?.message}"),
                     );
                   }
                   var sources = snapshot.data?.sources;
                   return CategoryTabs(sources: sources!);
                 },
               )
               ),

             
           ],
        ),
      )
    );
  }
}
