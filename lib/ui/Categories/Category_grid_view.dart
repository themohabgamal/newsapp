import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme.dart';

import 'CategoryItem.dart';

class CategoryGridView extends StatelessWidget {
  CategoryItem category;
  int index;
  Function onItemClick;
  CategoryGridView({required this.category, required this.index,required this.onItemClick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemClick(category);
      },
      child: Container(
        decoration: BoxDecoration(
            color: myTheme.mainDarker,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(index % 2 == 0 ? 30 : 0),
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 30),
            )),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(category.categoryImage, width: 80),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  category.categoryName,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ))
          ]),
        ),
      ),
    );
  }
}
