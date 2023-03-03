import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/Source.dart';
import 'package:news_app/theme.dart';
import 'package:provider/provider.dart';

import '../../Provider/SettingsProvider.dart';

class CategoryTab extends StatelessWidget {
  Source source;
  bool isSelected = false;
  CategoryTab({required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    var sp = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ?myTheme.teal:Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color:myTheme.teal),
      ),
      child: isSelected
          ? Text('${source.name}',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: sp.currentTheme==ThemeMode.light?Colors.white:Colors.white, fontSize: 14))
          : Text('${source.name}',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: sp.currentTheme==ThemeMode.light?myTheme.mainColor:Colors.white,fontSize: 14)),
    );
  }
}
