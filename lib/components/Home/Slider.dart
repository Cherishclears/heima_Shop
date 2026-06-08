
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import "package:he_shop/viewmodels/home.dart";

class Slider extends StatefulWidget {
  final List<Banneritem> bannerlist;

  Slider({Key? key, required this.bannerlist}) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  CarouselSliderController _controller = CarouselSliderController();

  int _currenIndex = 0;

  Widget _getSlider() {
    // 获取屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      carouselController: _controller, //  绑定controller对象
      items: List.generate(widget.bannerlist.length, (int index) {
        return Image.network(
          widget.bannerlist[index].imgURL,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: false,
        onPageChanged: (int index, reason) {
          _currenIndex = index;
          setState(() {
            
          });
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 40,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text("搜索.."),
        ),
      ),
    );
  }

  Widget _getDot() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerlist.length, (int index) {
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
              child: Container(
                height: 6,
                width: index == _currenIndex ? 40 :20,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDot()]);
  }
}
