// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

import 'package:store_app/consts/global_colors.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/user_screen.dart';
import 'package:store_app/services/api_handler.dart';
import 'package:store_app/widgets/appbar_icons.dart';

import '../widgets/feeds_widget.dart';
import '../widgets/sale_widget_with_swiper.dart';
import 'categories_screen.dart';
import 'feeds_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductsModel> productsList = [];
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
getProduct();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> getProduct() async {
    productsList = await APIHandler.getAllProducts();
    setState(() {});
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child:productsList.isEmpty? const CircularProgressIndicator(): Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: AppBarIcons(
            function: () {
              Navigator.push(
                context,
                PageTransition(child: const CategoriesScreen(), type: PageTransitionType.leftToRight),
              );
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(child: const UserScreen(), type: PageTransitionType.leftToRight),
                );
              },
              icon: IconlyBold.user3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchBarWidget(textEditingController: _textEditingController),
                const SizedBox(height: 10),
                ScrollableProductWidget(
                  size: size,
                  productsList: productsList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScrollableProductWidget extends StatelessWidget {
  ScrollableProductWidget({
    Key? key,
    required this.size,
    required this.productsList,
  }) : super(key: key);

  final Size size;
  List<ProductsModel> productsList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SaleWidgetWithSwiper(),
          const LatestProducstBar(),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0, childAspectRatio: 0.6),
            itemBuilder: (ctx, index) {
              return FeedsWidget(
                imageUrl: productsList[index].images![0],
                title: productsList[index].title.toString(),
              );
            },
          )
        ],
      ),
    );
  }
}

class LatestProducstBar extends StatefulWidget {
  const LatestProducstBar({
    Key? key,
  }) : super(key: key);

  @override
  State<LatestProducstBar> createState() => _LatestProducstBarState();
}

class _LatestProducstBarState extends State<LatestProducstBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text(
            "Latest Products",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(child: const FeedsScreen(), type: PageTransitionType.fade),
                );
              },
              icon: IconlyBold.arrowRight2)
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    required TextEditingController textEditingController,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: "Search",
            filled: true,
            fillColor: Theme.of(context).cardColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).cardColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            suffixIcon: Icon(
              IconlyLight.search,
              color: lightIconsColor,
            )),
      ),
    );
  }
}
