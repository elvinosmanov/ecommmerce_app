import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../provider/dark_theme_provider.dart';

class ProductEmpty extends StatelessWidget {
  const ProductEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/emptyproduct.png"),
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'No Any Product',
              style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 35.0,
              ),
              children: [
                TextSpan(
                  text: '\nin this category',
                  style: TextStyle(
                    color: Theme.of(context).textSelectionTheme.selectionColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0,
                  ),
                ),
              ]),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'Looks Like Seller didn\'t \nadd anything in this category yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: darkTheme ? Theme.of(context).disabledColor : ColorsConst.subTitle,
            fontWeight: FontWeight.w600,
            fontSize: 26.0,
          ),
        ),
      ],
    );
  }
}
