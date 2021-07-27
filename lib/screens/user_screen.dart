import '../constants/network_links.dart';
import 'cart/cart_screen.dart';
import 'wishlist_screen.dart';

import '../constants/colors.dart';
import '../provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final List<IconData> userTileIcon = [
    FeatherIcons.heart,
    FeatherIcons.shoppingCart,
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded,
    Icons.logout_sharp,
  ];

  ScrollController? _scrollController;
  var top = 0.0;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                elevation: 4.0,
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    top = constraints.biggest.height;
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              ColorsConst.starterColor,
                              ColorsConst.endColor
                            ],
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(1.0, .0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        title: Row(
                          children: [
                            AnimatedOpacity(
                              opacity: top <= 110 ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 300),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Container(
                                    height: kToolbarHeight / 1.8,
                                    width: kToolbarHeight / 1.8,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 1.0)
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(NetworkLinks.avatar),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Text('Guest')
                                ],
                              ),
                            ),
                          ],
                        ),
                        background: Image.network(
                          NetworkLinks.avatar,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userTitle("User Bag"),
                    Divider(thickness: 1.0, color: Colors.grey),
                    userListTile(
                        title: 'WishList',
                        index: 0,
                        isTrailing: true,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(WishListScreen.routeName);
                        },
                        context: context),
                    userListTile(
                        title: 'Cart',
                        index: 1,
                        isTrailing: true,
                        onTap: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        context: context),
                    userTitle("User Information"),
                    Divider(thickness: 1.0, color: Colors.grey),
                    userListTile(
                        title: 'Email',
                        subtitle: 'elvinn.osmanov@gmail.com',
                        index: 0,
                        context: context),
                    userListTile(
                        title: 'Phone number',
                        subtitle: '+994554261998',
                        index: 1,
                        context: context),
                    userListTile(
                        title: 'Shopping Address',
                        subtitle: 'AZ1104',
                        index: 2,
                        context: context),
                    userListTile(
                        title: 'Joined date',
                        subtitle: '07/08/2021',
                        index: 3,
                        context: context),
                    userTitle("User Settings"),
                    Divider(thickness: 1.0, color: Colors.grey),
                    ListTileSwitch(
                      value: themeData.darkTheme,
                      leading: const Icon(FeatherIcons.moon),
                      onChanged: (value) {
                        themeData.darkTheme = value;
                      },
                      switchActiveColor: Colors.purple,
                      title: const Text(
                        'Dark theme',
                      ),
                    ),
                    userListTile(title: "Logout", index: 4, context: context)
                  ],
                ),
              )
            ],
          ),
          _buildFab()
        ],
      ),
    );
  }

  Padding userTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Material userListTile(
      {required String title,
      required int index,
      required BuildContext context,
      String? subtitle,
      bool isTrailing = false,
      Function()? onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        onTap: onTap,
        child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle ?? ""),
            leading: Icon(userTileIcon[index]),
            trailing: isTrailing ? Icon(Icons.chevron_right_rounded) : null),
      ),
    );
  }

  _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController!.hasClients) {
      double offset = _scrollController!.offset;
      top -= offset;

      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }
    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(
            Icons.camera_alt_outlined,
          ),
        ),
      ),
    );
  }
}
