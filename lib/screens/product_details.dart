import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:store_app/consts/global_colors.dart';

import '../services/api_handler.dart';

class ProductDetails extends StatefulWidget {
  late List productsList = [];
  Future<void> getProducts() async {
    productsList = (await APIHandler.getAllProducts());
  }

  ProductDetails({
    Key? key,
    required this.productsList,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    widget.getProducts();
    setState(() {});
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final titleStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            const BackButton(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 3,
                        child: Text("lorem ipsum"),
                      ),
                      Flexible(
                        flex: 1,
                        child: RichText(
                          text: TextSpan(
                            text: "\$",
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.amberAccent,
                            ),
                            children: [
                              TextSpan(
                                text: "168",
                                style: TextStyle(
                                  color: lightTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Swiper(
                itemCount: 3,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(activeColor: Colors.black, color: Colors.red),
                ),
                itemBuilder: (context, index) {
                  return FancyShimmerImage(
                    boxFit: BoxFit.contain,
                    imageUrl: widget.productsList[index].images![0],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.productsList[3].title}",
                    style: titleStyle,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "${widget.productsList[5].description}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 25),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
