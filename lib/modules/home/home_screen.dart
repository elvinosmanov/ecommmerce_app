import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'widgets/back_layer.dart';
import 'widgets/front_layer.dart';
import '../../constants/network_links.dart';
import '../../constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        headerHeight: MediaQuery.of(context).size.height * 0.25,
        appBar: BackdropAppBar(
          leading: BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          title: Text("Home"),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(NetworkLinks.avatar),
              ),
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorsConst.starterColor, ColorsConst.endColor],
              ),
            ),
          ),
        ),
        backLayer: BackLayer(),
        frontLayer: FrontLayer());
  }
}
