import 'package:flutter/cupertino.dart';
import 'package:he_shop/api/home.dart';
import 'package:he_shop/components/Home/Category.dart';
import 'package:he_shop/components/Home/Hot.dart';
import 'package:he_shop/components/Home/MoreList.dart';
import 'package:he_shop/components/Home/Slider.dart';
import 'package:he_shop/components/Home/Suggestion.dart';
import 'package:he_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<Banneritem> _bannerList = [];

  List<Widget> _getScrollChildren() {
    return [
      // 包裹普通Widget的sliver组件
      SliverToBoxAdapter(child: Slider(bannerlist: _bannerList,)),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: Category()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(child: Suggestion()),

      SliverToBoxAdapter(child: SizedBox(height: 10)),

      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hot()),
              SizedBox(width: 10),
              Expanded(child: Hot()),
            ],
          ),
        ),
      ),

    SliverToBoxAdapter(child: SizedBox(height: 10)),

    Morelist(),

    ];
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
  }

  void _getBannerList() async{
    _bannerList =  await getBannerListAPI();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
