import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import '../constants/network_links.dart';
import 'package:flutter/material.dart';

class BrandsRailWidget extends StatelessWidget {
  final String brand;
  const BrandsRailWidget({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          constraints: BoxConstraints(
              minHeight: 150, maxHeight: 180, minWidth: double.infinity),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5.0, 5.0),
                          color: Colors.grey,
                          blurRadius: 2.0)
                    ],
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                          NetworkLinks.product),
                    ),
                  ),
                ),
              ),
              FittedBox(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0)),
                    color: Theme.of(context).backgroundColor,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5.0, 5.0),
                          color: Colors.grey,
                          blurRadius: 2.0)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        constraints:
                            BoxConstraints(maxWidth: 120, minWidth: 90),
                        child: AutoSizeText(
                          'TITLE',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context)
                                .textSelectionTheme
                                .selectionColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'US 16.95\$',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(),
                      Text(
                        brand,
                        style: TextStyle(color: Colors.grey, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
