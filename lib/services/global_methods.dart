import 'package:flutter/material.dart';

import '../constants/network_links.dart';

class GlobalMethods {
  Future<void> showDialogg(String title, String content, Function() onPressed, BuildContext context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        elevation: 5.0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Row(
          children: <Widget>[
            Image.network(
              NetworkLinks.warning,
              height: 22,
              width: 22,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(title)
          ],
        ),
        content: Text(content),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')),
          ElevatedButton(onPressed: onPressed, child: Text('Ok')),
          SizedBox(
            width: 4.0,
          )
        ],
      ),
    );
  }
}
