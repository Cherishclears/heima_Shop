import 'package:flutter/material.dart';
import 'package:he_shop/pages/Cart/index.dart';
import 'package:he_shop/pages/Category/index.dart';
import 'package:he_shop/pages/Home/index.dart';
import 'package:he_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Map<String,String>> _tabList = [
    {
      "icon":"lib/assets/ic_home_normal.png",
      "active_icon":"lib/assets/ic_home_active.png",
      "text":"主页",
    },
    {
      "icon":"lib/assets/ic_category_normal.png",
      "active_icon":"lib/assets/ic_category_active.png",
      "text":"分类",
    },
    {
      "icon":"lib/assets/ic_cart_normal.png",
      "active_icon":"lib/assets/ic_cart_active.png",
      "text":"购物车",
    },
    {
      "icon":"lib/assets/ic_home_normal.png",
      "active_icon":"lib/assets/ic_home_active.png",
      "text":"我的",
    },
  ];

  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTabBarWidget(){
    return List.generate(_tabList.length, (int index){
      return BottomNavigationBarItem(
        icon: Image.asset(_tabList[index]["icon"]!,width: 30,height: 30,),
        activeIcon: Image.asset(_tabList[index]["active_icon"]!,width: 30,height: 30,),
        label: _tabList[index]["text"],
      );
    });
    
  }

  List<Widget> _getChildren(){
    return [
      HomeView(),
      CategoryView(),
      CardView(),
      MineView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('主页'),
      ),
      body: SafeArea(child: IndexedStack(
        index: _currentIndex,
        children: _getChildren(),
      )),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        onTap: (int Index){
          _currentIndex = Index;
          setState(() {
            
          });
        },
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
        ),
    );  
  }
}