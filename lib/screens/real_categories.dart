import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/consts/global_colors.dart';

class CategoriesReal extends StatelessWidget {
  const CategoriesReal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        child: Stack(children: [
          Opacity(
            opacity: 0.4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                width: size.width * 0.45,
                height: size.height * 0.45,
                imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
                errorWidget: const Icon(IconlyBold.danger),
              ),
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Category Name",
                  style: TextStyle(fontWeight: FontWeight.bold, backgroundColor: lightBackgroundColor),
                )),
          ),
        ]),
      ),
    );
  }
}
