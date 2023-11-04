import 'package:character/app/views/productItem.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../controller/product_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductListController>(context).getProducts();

  }
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: Consumer<ProductListController>(
        builder: (_, value, __) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(((context, index) {
              return ProductItem(product: value.product[index]);
            }), childCount: value.product.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.73,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2),
          );
        },
      ),
    );
  }
}