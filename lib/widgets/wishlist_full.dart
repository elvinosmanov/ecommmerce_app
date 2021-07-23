import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/network_links.dart';

class WishlistFull extends StatelessWidget {
  const WishlistFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10.0, right: 30.0, left: 4.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80.0,
                      child: Image.network(NetworkLinks.product),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text('text'),
                          Text('text'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 15,
          child: Container(
            width: 30.0,
            height: 30.0,
            child: MaterialButton(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: ColorsConst.favColor,
              onPressed: () {},
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
