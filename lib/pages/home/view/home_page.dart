import 'package:flutter/material.dart';

import '../home.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeForm(),
    );
  }
}
