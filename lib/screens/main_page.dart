import 'package:first_flutter/models/app_drawer.dart';
import 'package:first_flutter/module_data.dart';
import 'package:first_flutter/widgets/main_module.dart';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const mainroute = 'mainpage';

  static const Color backHexColor = Color(0xff1D2553);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/bgmainPage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Padding(
              padding: EdgeInsets.only(left: deviceSize.width * 0.15),
              child: Text(
                'TourOn',
                style: TextStyle(
                  fontSize: 34,
                  letterSpacing: 4,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            backgroundColor: MainPage.backHexColor,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.vertical(
            //     bottom: Radius.circular(10),
            //   ),
            // ),
          ),
          drawer: AppDrawer(),
          body: Column(
            children: [
              SizedBox(
                height: deviceSize.height * 0.03,
              ),
              carouselSlider(),
              buildGridView(),
            ],
          ),
        ),
      ),
    );
  }

  Center carouselSlider() {
    return Center(
      child: CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int itemIndex) => Container(
          child: Image.asset(
            imgList[itemIndex],
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        options: CarouselOptions(
          height: 180,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Expanded buildGridView() {
    return Expanded(
      child: GridView(
        padding: const EdgeInsets.all(25),
        children: Module_Data.map(
          (catData) => MainModule(
            catData.id,
            catData.title,
            catData.imagePath,
          ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.29,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
      ),
    );
  }
}

final List<String> imgList = [
  'assets/images/slider1.jpg',
  'assets/images/slider2.jpg',
  'assets/images/slider3.jpg',
  'assets/images/slider4.jpg',
  'assets/images/slider5.jpg',
  'assets/images/slider6.jpg',
  'assets/images/slider7.jpg',
  'assets/images/slider8.jpg',
  'assets/images/slider9.jpg',
  'assets/images/slider10.jpg',
];
