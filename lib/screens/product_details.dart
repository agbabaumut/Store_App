import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/consts/global_colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
                    imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
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
                    "description",
                    style: titleStyle,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    "lorem ipsum msaopdmsadpsaodjaü",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 25),
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
