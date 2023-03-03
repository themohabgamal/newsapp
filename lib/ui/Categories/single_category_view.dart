import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/API/apiManager.dart';
import 'package:news_app/Provider/SettingsProvider.dart';
import 'package:news_app/theme.dart';
import 'package:news_app/ui/Categories/CategoryItem.dart';
import 'package:news_app/ui/Categories/category_tabs.dart';
import 'package:news_app/ui/Search/search.dart';
import 'package:provider/provider.dart';

class SingleCategoryView extends StatefulWidget {
CategoryItem category;
SingleCategoryView({required this.category});

  @override
  State<SingleCategoryView> createState() => _SingleCategoryViewState();
}

class _SingleCategoryViewState extends State<SingleCategoryView> {
  @override
  Widget build(BuildContext context) {
    var sp=Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sp.currentTheme==ThemeMode.light?myTheme.whiteGrey:myTheme.mainColor,
        centerTitle: true,
        title: Text(widget.category.categoryName,style: Theme.of(context).textTheme.headline5),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: Search());
          }, icon: Icon(Icons.search,color: sp.currentTheme==ThemeMode.light?myTheme.mainColor:myTheme.whiteGrey,))
        ],
      ),
      body: FutureBuilder(
        future: apiManager.getSources(widget.category.categoryId),
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
      ,
    );
  }
}
