import 'package:ecommmerce_app/cosntants/network_links.dart';

import 'brands_rail_widget.dart';
import 'package:flutter/material.dart';

class BrandsNavigationRail extends StatefulWidget {
  static const routeName = "/brands_navigation_rail";
  const BrandsNavigationRail({Key? key}) : super(key: key);

  @override
  _BrandsNavigationRailState createState() => _BrandsNavigationRailState();
}

class _BrandsNavigationRailState extends State<BrandsNavigationRail> {
  final double padding = 8.0;

  int _selectedIndex = 0;
  String brand = "";
  @override
  void didChangeDependencies() {
    int _selectedIndex = ModalRoute.of(context)!.settings.arguments as int;
    changeBrandName(_selectedIndex);
    super.didChangeDependencies();
  }

  void changeBrandName(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        brand = 'Addidas';
        break;
      case 1:
        brand = 'Apple';
        break;
      case 2:
        brand = 'Dell';
        break;
      case 3:
        brand = 'Huawei';
        break;
      case 4:
        brand = 'Nike';
        break;
      case 5:
        brand = 'H&M';
        break;
      case 6:
        brand = 'Samsung';
        break;
    }
    print(brand);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) {
              print(constraints.maxHeight);
              print(constraints.minHeight);
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      groupAlignment: 1.0,
                      minWidth: 56.0,
                      leading: Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 60.0),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      NetworkLinks.avatar)))),
                      labelType: NavigationRailLabelType.all,
                      onDestinationSelected: (value) {
                        setState(() {
                          changeBrandName(value);
                        });
                      },
                      destinations: [
                        buildNavigationRailDestination(
                            title: "Addidas", padding: 2),
                        buildNavigationRailDestination(
                            title: "Apple", padding: padding),
                        buildNavigationRailDestination(
                            title: "Dell", padding: padding),
                        buildNavigationRailDestination(
                            title: "Huawei", padding: padding),
                        buildNavigationRailDestination(
                            title: "Nike", padding: padding),
                        buildNavigationRailDestination(
                            title: "H&M", padding: padding),
                        buildNavigationRailDestination(
                            title: "Samsung", padding: padding),
                      ],
                      selectedIndex: _selectedIndex,
                      unselectedLabelTextStyle:
                          TextStyle(fontSize: 15, letterSpacing: 0.5),
                      selectedLabelTextStyle: TextStyle(
                          color: Color(0xffffe6bc97),
                          fontSize: 20.0,
                          letterSpacing: 1,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5),
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return BrandsRailWidget(brand:brand);
            },
          )),
        ],
      ),
    );
  }

  NavigationRailDestination buildNavigationRailDestination(
      {required String title, required double padding}) {
    return NavigationRailDestination(
      icon: SizedBox.shrink(),
      label: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
