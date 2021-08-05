import '../screens/feed_screen.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final int index;
  Category({Key? key, required this.index}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<Map<String, String>> categories = [
    {
      "categoryName": "Watches",
      "categoryImagePath": "assets/images/CatWatches.jpg",
    },
    {
      "categoryName": "Beauty&Health",
      "categoryImagePath": "assets/images/CatBeauty.jpg",
    },
    {
      "categoryName": "Laptops",
      "categoryImagePath": "assets/images/CatLaptops.png",
    },
    {
      "categoryName": "Furniture",
      "categoryImagePath": "assets/images/CatFurniture.jpg",
    },
    {
      "categoryName": "Shoes",
      "categoryImagePath": "assets/images/CatShoes.jpg",
    },
    {
      "categoryName": "Clothes",
      "categoryImagePath": "assets/images/CatClothes.jpg",
    },
    {
      "categoryName": "Phones",
      "categoryImagePath": "assets/images/CatPhones.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FeedScreen.routeName, arguments: categories[widget.index]["categoryName"]);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              // image: DecorationImage(
              //   fit: BoxFit.contain,
              //   image: AssetImage(
              //     categories[widget.index]["categoryImagePath"].toString(),
              //   ),
              // ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            width: 150.0,
            height: 150.0,
            child: Image.asset(
              categories[widget.index]["categoryImagePath"].toString(),
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              color: Theme.of(context).backgroundColor,
              child: Text(
                categories[widget.index]['categoryName'].toString(),
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Theme.of(context).textSelectionTheme.selectionColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
