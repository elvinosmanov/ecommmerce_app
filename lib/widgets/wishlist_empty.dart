import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../provider/dark_theme_provider.dart';

class WishlistEmpty extends StatelessWidget {
  const WishlistEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/empty-wishlist.png"),
                ),
              ),
            ),
            Text(
              'Your Wishlist Is Empty',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 35.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Looks Like You didn\'t \nadd anything to your wishlist yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: darkTheme ? Theme.of(context).disabledColor : ColorsConst.subTitle,
                fontWeight: FontWeight.w600,
                fontSize: 26.0,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.width * .12,
              width: MediaQuery.of(context).size.width * .9,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), side: BorderSide(color: Colors.red)),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'START SHOPPING',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textSelectionTheme.selectionColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 26.0,
                  ),
                ),
              ),
            )
          ],
        ),
        Positioned(
            left: 10,
            top: 30,
            child: IconButton(
              alignment: Alignment.center,
              iconSize: 30,
              padding: EdgeInsets.all(10),
              splashColor: Theme.of(context).splashColor,
              splashRadius: 30,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
            ))
      ],
    );
  }
}
