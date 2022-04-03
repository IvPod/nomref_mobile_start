import 'package:flutter/material.dart';

import 'theme.dart';
import 'pages/home/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nomref',
      theme: appTheme,
      home: HomePage(),
    );
  }
}
