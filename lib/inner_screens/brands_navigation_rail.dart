import 'package:flutter/material.dart';

class BrandsNavigationRail extends StatefulWidget {
  static const routeName = "/brands_navigation_rail";
  const BrandsNavigationRail({Key? key}) : super(key: key);

  @override
  _BrandsNavigationRailState createState() => _BrandsNavigationRailState();
}

class _BrandsNavigationRailState extends State<BrandsNavigationRail> {
  final padding = 8.0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: 50,
            child: NavigationRail(
              leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://www.bluebridgewindowcleaning.co.uk/wp-content/uploads/2016/04/default-avatar.png")))),
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: (value) {},
              destinations: [
                buildNavigationRailDestination(),
                buildNavigationRailDestination(),
                buildNavigationRailDestination(),
                buildNavigationRailDestination(),
              ],
              selectedIndex: _selectedIndex,
            ),
          ),
        ],
      ),
    );
  }

  NavigationRailDestination buildNavigationRailDestination() {
    return NavigationRailDestination(
      icon: SizedBox.shrink(),
      label: RotatedBox(
        quarterTurns: -1,
        child: Text(
          'Hello',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
