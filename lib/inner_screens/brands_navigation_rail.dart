import 'package:ecommmerce_app/models/product.dart';
import 'package:ecommmerce_app/provider/products_provider.dart';
import 'package:provider/provider.dart';

import '../constants/network_links.dart';

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

  @override
  void didChangeDependencies() {
    _selectedIndex = ModalRoute.of(context)!.settings.arguments as int;

    super.didChangeDependencies();
  }

  List<String> brandName = [
    'Addidas',
    "Apple",
    "Dell",
    "Huawei",
    "Nike",
    "H&M",
    "Samsung",
    "All"
  ];

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
                                  image: NetworkImage(NetworkLinks.avatar)))),
                      labelType: NavigationRailLabelType.all,
                      onDestinationSelected: (value) {
                        setState(() {
                          _selectedIndex = value;
                        });
                      },
                      destinations: [
                        buildNavigationRailDestination(
                            title: brandName[0], padding: 2),
                        buildNavigationRailDestination(
                            title: brandName[1], padding: padding),
                        buildNavigationRailDestination(
                            title: brandName[2], padding: padding),
                        buildNavigationRailDestination(
                            title: brandName[3], padding: padding),
                        buildNavigationRailDestination(
                            title: brandName[4], padding: padding),
                        buildNavigationRailDestination(
                            title: brandName[5], padding: padding),
                        buildNavigationRailDestination(
                            title: brandName[6], padding: padding),
                        buildNavigationRailDestination(
                            title: brandName[7], padding: padding),
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
          ContentSpace(
              brandName: brandName[_selectedIndex] != 'All'
                  ? brandName[_selectedIndex]
                  : ""),
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

class ContentSpace extends StatelessWidget {
  final String brandName;

  const ContentSpace({Key? key, required this.brandName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context, listen: false);
    final productsBrand = provider.getProductsByBrand(brandName);
    return Expanded(
        child: ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: productsBrand.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: productsBrand[index],
          child: BrandsRailWidget(),
        );
      },
    ));
  }
}
