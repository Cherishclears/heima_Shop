import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder:(BuildContext context,int index){
          return Container(
            alignment: Alignment.center,
            height: 100,
            width: 80,
            color: Colors.blue,
            child: Text("分类$index"),
            margin: EdgeInsets.symmetric(horizontal: 10),
          );
        }
        )
    );
  }
}