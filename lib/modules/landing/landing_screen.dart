import 'package:cached_network_image/cached_network_image.dart';
import '../../constants/colors.dart';
import '../../constants/network_links.dart';
import '../auth/login_screen.dart';
import '../home/widgets/custom_buttons.dart';
import '../../utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: NetworkLinks.landingImage,
            placeholder: (context, url) => Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Icon(Icons.warning),
              ),
            ),
            alignment: Alignment(_animation.value, 0),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 40.0,
                  ),
                ),
                giveHeight(20.0),
                Text(
                  'Welcome to the Biggest online store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.w400,
                    fontSize: 26.0,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomButtons(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        iconData: FeatherIcons.user,
                        iconColor: Colors.white,
                        label: 'Login',
                        backgroundColor: Colors.purple,
                        labelColor: Colors.white,
                      ),
                    ),
                    giveWidth(10.0),
                    Expanded(
                      child: CustomButtons(
                        iconData: FeatherIcons.userPlus,
                        iconColor: Colors.white,
                        label: 'Sign Up',
                        backgroundColor: ColorsConst.favBadgeColor,
                        labelColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Divider(thickness: 2, color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Or continue with', style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(child: Divider(thickness: 2, color: Colors.white)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomButtons(
                      iconData: Icons.gif_outlined,
                      iconColor: Colors.red,
                      label: 'Google +',
                      backgroundColor: Colors.black12,
                      borderColor: Colors.red,
                      labelColor: Colors.red,
                    ),
                    giveWidth(10),
                    CustomButtons(
                      iconData: FeatherIcons.facebook,
                      iconColor: Colors.blue,
                      label: 'Facebook',
                      backgroundColor: Colors.black12,
                      borderColor: Colors.blue[900],
                      labelColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              CustomButtons(
                iconData: Icons.lock_outline_rounded,
                iconColor: Colors.white,
                label: 'Continue as a guest',
                labelColor: Colors.white,
                backgroundColor: Colors.orange[900],
              ),
              giveHeight(20.0)
            ],
          )
        ],
      ),
    );
  }
}
