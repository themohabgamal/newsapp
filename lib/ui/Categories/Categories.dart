import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/ui/Categories/Category_grid_view.dart';
import 'package:news_app/ui/Categories/single_category_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'CategoryItem.dart';

class Categories extends StatefulWidget {
  static const String routeName = 'Categories';

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  @override
  Widget build(BuildContext context) {
    List<CategoryItem> categories = [
      CategoryItem(
          categoryName: AppLocalizations.of(context)!.sports,
          categoryId: "sports",
          categoryImage: "assets/images/sports.png"),
      CategoryItem(
          categoryName: AppLocalizations.of(context)!.business,
          categoryId: "business",
          categoryImage: "assets/images/business.png"),
      CategoryItem(
          categoryName: AppLocalizations.of(context)!.general,
          categoryId: "general",
          categoryImage: "assets/images/general.png"),
      CategoryItem(
          categoryName: AppLocalizations.of(context)!.technology,
          categoryId: "technology",
          categoryImage: "assets/images/technology.png"),
      CategoryItem(
          categoryName: AppLocalizations.of(context)!.entertainment,
          categoryId: "entertainment",
          categoryImage: "assets/images/entertainment.png"),
      CategoryItem(
          categoryName: AppLocalizations.of(context)!.health,
          categoryId: "health",
          categoryImage: "assets/images/health.png"),
    ];
    return Scaffold(
      body:selectedCategory==null?Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.pickYour,
                style: GoogleFonts.openSans(
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontSize: 28)),textAlign: TextAlign.center,
              ),
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


