import 'package:flutter/material.dart';

class Morelist extends StatefulWidget {
  const Morelist({super.key});

  @override
  State<Morelist> createState() => _MorelistState();
}

class _MorelistState extends State<Morelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(gridDelegate: 
    SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    ), itemBuilder: (BuildContext context,int index){
      return Container(
        child: Text("商品"),
        color:Colors.blue,
        alignment: Alignment.center,
      );
    });
  }
}