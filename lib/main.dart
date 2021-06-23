import 'package:ecommmerce_app/cosntants/theme_data.dart';
import 'package:ecommmerce_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'screens/bottom_bar_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => themeChangeProvider,
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeData.darkTheme, context),
            title: 'Material App',
            home: BottomBarScreen(),
          );
        },
      ),
    );
  }
}
