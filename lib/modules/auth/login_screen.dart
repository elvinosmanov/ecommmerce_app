import '../../constants/colors.dart';
import '../home/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _emailAddress = '';
  String? _password = '';
  bool _obscureText = true;
  final FocusNode passFocusNode = FocusNode();

  void submitForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [ColorsConst.gradientFStart, ColorsConst.gradientLStart],
                  [ColorsConst.gradientFEnd, ColorsConst.gradientLEnd],
                ],
                durations: [19440, 10800],
                heightPercentages: [0.25, 0.30],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              size: Size(
                double.infinity,
                double.infinity,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: 120,
                height: 120,
                margin: EdgeInsets.only(top: 80.0, bottom: 10.0),
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: NetworkImage("https://image.flaticon.com/icons/png/128/869/869636.png")),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        key: ValueKey("Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty || !value.contains("@")) {
                            return "Please write right E-mail address";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context).requestFocus(passFocusNode),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Your email",
                          fillColor: Theme.of(context).backgroundColor,
                          filled: true,
                          border: const UnderlineInputBorder(),
                        ),
                        onSaved: (newEmail) {
                          _emailAddress = newEmail;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        focusNode: passFocusNode,
                        obscureText: _obscureText,
                        key: ValueKey("Password"),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length < 6) {
                            return "Please write right password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(_obscureText ? FeatherIcons.eye : FeatherIcons.eyeOff)),
                          labelText: "Your password",
                          fillColor: Theme.of(context).backgroundColor,
                          filled: true,
                          border: const UnderlineInputBorder(),
                        ),
                        onSaved: (newPassword) {
                          _password = newPassword;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomButtons(
                            backgroundColor: ColorsConst.cartBadgeColor,
                            iconData: FeatherIcons.logIn,
                            iconColor: Colors.purple,
                            label: "Login",
                            labelColor: Colors.white,
                            iconInRight: true,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) print(_emailAddress);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
