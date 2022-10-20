import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

import 'package:store_app/consts/global_colors.dart';
import 'package:store_app/screens/product_details.dart';

import '../models/products_model.dart';
import '../services/api_handler.dart';

class FeedsWidget extends StatefulWidget {
  final String imageUrl, title;
  const FeedsWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  late List<ProductsModel> productsList = [];
  Future<void> getProducts() async {
    productsList = (await APIHandler.getAllProducts());
    setState(() {});
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return productsList.isEmpty
        ? const CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.all(2.0),
            child: Material(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).cardColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(child: const ProductDetails(), type: PageTransitionType.bottomToTop),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: "\$",
                                style: const TextStyle(color: Color.fromRGBO(33, 150, 243, 1)),
                                children: [
                                  TextSpan(
                                      text: "168.00",
                                      style: TextStyle(color: lightTextColor, fontWeight: FontWeight.w600))
                                ],
                              ),
                            ),
                          ),
                          const Icon(IconlyBold.heart),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    productsList.isEmpty
                        ? const CircularProgressIndicator()
                        : FancyImageWidget(imageurl: productsList[4].images![0]),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Title",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 17,
                          //  fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

class FancyImageWidget extends StatefulWidget {
  late String imageurl;
  FancyImageWidget({
    Key? key,
    required this.imageurl,
  }) : super(key: key);

  @override
  State<FancyImageWidget> createState() => _FancyImageWidgetState();
}

class _FancyImageWidgetState extends State<FancyImageWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: FancyShimmerImage(
        height: 160,
        width: double.infinity,
        errorWidget: Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: size.height * 0.01,
        ),
        imageUrl: widget.imageurl.isEmpty ? "https://placeimg.com/640/480/any" : widget.imageurl,
        boxFit: BoxFit.fill,
      ),
    );
  }
}
