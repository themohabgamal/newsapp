import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class hotNewsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(right: 10,bottom: 20),
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            child: Image(image: AssetImage("assets/images/basket.jpg")
              ,fit: BoxFit.cover,width: double.infinity,
              height: 220,),
          ),
          SizedBox(height: 4,),
          Text("LeBron James eyes history as NBA scoring record within...",style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ],
      )),
    );
  }
}
