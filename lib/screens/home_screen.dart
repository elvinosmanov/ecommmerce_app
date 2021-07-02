import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import '../widgets/front_layer.dart';
import '../cosntants/colors.dart';
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
                  backgroundImage: NetworkImage(
                      "https://www.bluebridgewindowcleaning.co.uk/wp-content/uploads/2016/04/default-avatar.png"),
                ))
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorsConst.starterColor, ColorsConst.endColor],
              ),
            ),
          ),
        ),
        backLayer: Center(
          child: Text("Back Layer"),
        ),
        frontLayer: FrontLayer());
  }
}
