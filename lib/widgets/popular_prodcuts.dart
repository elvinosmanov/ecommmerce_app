import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage("assets/images/CatFurniture.jpg")),
                      ),
                    ),
                    // Positioned(
                    //   right: 10,
                    //   top: 12,
                    //   child: Icon(Icons.star_border_outlined),
                    // ),

                    Positioned(
                      right: 12,
                      top: 10,
                      child: Icon(
                        Icons.star,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 7,
                      child: Icon(
                        Icons.star_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 32,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        color: Theme.of(context).backgroundColor,
                        child: Text(
                          '\$ 99.0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textSelectionTheme
                                  .selectionColor),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Description',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[800])),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(24.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(FeatherIcons.shoppingCart,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
