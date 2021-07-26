import '../../../constants/colors.dart';
import '../../../provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/emptycart.png"),
            ),
          ),
        ),
        Text(
          'Your Cart Is Empty',
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
          'Looks Like You didn\'t \nadd anything to your card yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: darkTheme
                ? Theme.of(context).disabledColor
                : ColorsConst.subTitle,
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
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.red)),
              ),
            ),
            onPressed: () {},
            child: Text(
              'SHOP NOW',
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
    );
  }
}
