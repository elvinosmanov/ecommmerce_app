import '../../../constants/colors.dart';
import '../../../constants/network_links.dart';
import '../../../provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';


class CartFull extends StatelessWidget {
  const CartFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 140.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 135.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(NetworkLinks.product),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'Title',
                          softWrap: false,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: () {},
                          child: Container(
                            height: 45.0,
                            width: 45.0,
                            child: Icon(
                              FeatherIcons.x,
                              color: Colors.red,
                              size: 22.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Price:'),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '450.0',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Sub Total:'),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '\$450.000',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: darkTheme
                                ? Colors.brown.shade900
                                : Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Ships Free',
                        style: TextStyle(
                            color: darkTheme
                                ? Colors.brown.shade900
                                : Theme.of(context).accentColor),
                      ),
                      Row(
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4.0),
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  FeatherIcons.minus,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 12.0,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              width: MediaQuery.of(context).size.width * 0.12,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    ColorsConst.gradientLStart,
                                    ColorsConst.gradientLEnd
                                  ],
                                  stops: [0.0, 0.7],
                                ),
                              ),
                              child: Text(
                                '1',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4.0),
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  FeatherIcons.plus,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
