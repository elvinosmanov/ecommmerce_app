import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class FeedProducts extends StatefulWidget {
  const FeedProducts({Key? key}) : super(key: key);

  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 240,
        height: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Theme.of(context).backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(2.0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                        minHeight: 80,
                        maxHeight: MediaQuery.of(context).size.height * .2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                            "https://i.gadgets360cdn.com/products/large/realme-watch-670x800-1590388807.jpg"),
                      ),
                    ),
                  ),
                ),
                Badge(
                  toAnimate: true,
                  shape: BadgeShape.square,
                  badgeColor: Colors.pink,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(2.0)),
                  badgeContent:
                      Text('NEW', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 4.0),
              margin: EdgeInsets.only(right: 4.0, top: 4.0, bottom: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '\$ 179.99',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Quantity: 12 left',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {},
                          child: Icon(Icons.more_horiz),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
