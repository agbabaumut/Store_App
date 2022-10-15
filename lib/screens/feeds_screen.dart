import 'package:flutter/material.dart';

import 'home_screen.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ScrollableProductWidget(
        size: size * 0.4,
      ),
    );
  }
}
