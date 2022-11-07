import 'package:flutter/material.dart';

class DenemeView extends StatefulWidget {
  const DenemeView({Key? key}) : super(key: key);

  @override
  State<DenemeView> createState() => _DenemeViewState();
}

class _DenemeViewState extends State<DenemeView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: size.height * 0.3,
            color: Colors.amber,
            child: const Text(
              "123123123",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
