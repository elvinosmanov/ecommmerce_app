import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import '../inner_screens/brands_navigation_rail.dart';
import 'popular_prodcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'category.dart';

class FrontLayer extends StatefulWidget {
  @override
  _FrontLayerState createState() => _FrontLayerState();
}

class _FrontLayerState extends State<FrontLayer> {
  final List<String> listImage = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png"
  ];

  final List<String> _listBrands = [
    "assets/images/addidas.jpg",
    "assets/images/apple.jpg",
    "assets/images/Dell.jpg",
    "assets/images/Huawei.jpg",
    "assets/images/nike.jpg",
    "assets/images/hm.jpg",
    "assets/images/samsung.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          carousel(),
          titleCategories(),
          categories(),
          titlePopular(title: "Popular Brands"),
          popularBrands(context),
          titlePopular(title: "Popular Products"),
          popularProducts(),
        ],
      ),
    );
  }

  Container carousel() {
    return Container(
      height: 190.0,
      width: double.infinity,
      child: Carousel(
        images: listImage.map((e) => Image.asset(e, fit: BoxFit.fill)).toList(),
        dotSize: 5.0,
        boxFit: BoxFit.fill,
        dotSpacing: 15.0,
        animationDuration: Duration(seconds: 1),
        dotIncreasedColor: Colors.purple,
        animationCurve: Curves.fastOutSlowIn,
        indicatorBgPadding: 7.0,
        dotBgColor: Colors.black.withOpacity(0.2),
        borderRadius: true,
      ),
    );
  }

  Container popularBrands(BuildContext context) {
    return Container(
      height: 210,
      width: MediaQuery.of(context).size.width * .95,
      child: Swiper(
        onTap: (index) {
          Navigator.pushNamed(context, BrandsNavigationRail.routeName,
              arguments: index);
        },
        itemCount: _listBrands.length,
        autoplay: true,
        autoplayDelay: 2000,
        curve: Curves.fastOutSlowIn,
        viewportFraction: 0.8,
        scale: 0.8,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              color: Colors.white,
              child: Image.asset(
                _listBrands[index],
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }

  Container categories() {
    return Container(
      height: 180.0,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Category(
            index: index,
          );
        },
      ),
    );
  }

  Padding titleCategories() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Categories',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
      ),
    );
  }

  Padding titlePopular({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Spacer(),
          Text(
            'View all...',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w800, color: Colors.red),
          )
        ],
      ),
    );
  }

  Container popularProducts() {
    return Container(
      width: double.infinity,
      height: 285,
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return PopularProducts();
        },
      ),
    );
  }
}
