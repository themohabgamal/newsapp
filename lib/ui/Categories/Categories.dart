import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/ui/Categories/Category_grid_view.dart';
import 'package:news_app/ui/Categories/single_category_view.dart';

import 'CategoryItem.dart';

class Categories extends StatefulWidget {
  static const String routeName = 'Categories';

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategoryItem> categories = [
    CategoryItem(
        categoryName: "Sports",
        categoryId: "sports",
        categoryImage: "assets/images/sports.png"),
    CategoryItem(
        categoryName: "Business",
        categoryId: "business",
        categoryImage: "assets/images/business.png"),
    CategoryItem(
        categoryName: "General",
        categoryId: "general",
        categoryImage: "assets/images/general.png"),
    CategoryItem(
        categoryName: "Technology",
        categoryId: "technology",
        categoryImage: "assets/images/technology.png"),
    CategoryItem(
        categoryName: "Entertainment",
        categoryId: "entertainment",
        categoryImage: "assets/images/entertainment.png"),
    CategoryItem(
        categoryName: "Health",
        categoryId: "health",
        categoryImage: "assets/images/health.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:selectedCategory==null?Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Pick your field of interest",
              style: GoogleFonts.openSans(
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontSize: 28)),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 6/7),
                  itemBuilder: (context, index) {
                    return CategoryGridView(
                        category: categories[index], index: index,onItemClick: onClick,);
                  },
                )),
          ),
        ],
      ):SingleCategoryView(category: selectedCategory!),
    );
  }

  CategoryItem? selectedCategory=null;

  void onClick(CategoryItem category){
    setState(() {
      selectedCategory=category;
    });
  }
}


