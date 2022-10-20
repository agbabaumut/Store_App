import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../services/api_handler.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  late List<ProductsModel> productsList;
  Future<void> getProducts() async {
    productsList = (await APIHandler.getAllProducts());
    setState(() {});
  }

  @override
  void initState() {
    productsList = [];
    getProducts();
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return productsList.isEmpty
        ? const Scaffold(body: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
            ),
            body: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0, childAspectRatio: 0.6),
                itemBuilder: (ctx, index) {
                  return FeedsWidget(
                    imageUrl: productsList[index].images![0],
                    title: productsList[index].title.toString(),
                  );
                }),
          );
  }
}
