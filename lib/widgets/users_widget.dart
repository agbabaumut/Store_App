import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/consts/global_colors.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListTile(
      title: const Text("User Name"),
      subtitle: const Text("Email@email.com"),
      trailing: Text(
        "user role",
        style: TextStyle(color: lightIconsColor, fontWeight: FontWeight.bold),
      ),
      leading: FancyShimmerImage(
          height: double.infinity,
          width: size.height * 0.05,
          errorWidget: Icon(IconlyBold.danger, color: Colors.red, size: size.height * 0.01),
          imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
          boxFit: BoxFit.fill),
    );
  }
}
