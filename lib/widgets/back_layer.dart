import 'package:ecommmerce_app/cosntants/colors.dart';
import 'package:ecommmerce_app/cosntants/network_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class BackLayer extends StatelessWidget {
  const BackLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsConst.starterColor,
                ColorsConst.endColor,
              ],
            ),
          ),
        ),
        buildPositioned(top: -100, left: 150, angle: -0.5),
        buildPositioned(top: -100, left: 80, angle: -0.5),
        buildPositioned(bottom: -5, left: 330, angle: -0.8),
        buildPositioned(bottom: 40, left: 200, angle: -0.8),
        SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(50.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).backgroundColor,
                  ),
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(NetworkLinks.avatar))),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Feeds',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Icon(FeatherIcons.rss)
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Positioned buildPositioned(
      {double? top,
      double? bottom,
      required double left,
      required double angle}) {
    return Positioned(
      top: top ?? null,
      bottom: bottom ?? null,
      left: left,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: 100,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12.0)),
        ),
      ),
    );
  }
}
