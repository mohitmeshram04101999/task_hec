import 'package:flutter/material.dart';
import 'package:hecker_task/component/daimention.dart';
import 'package:hecker_task/component/product%20Model.dart';
import 'package:hecker_task/providers/cartProvider.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final Product product;
  const CartTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, p, child) => Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey.shade300,
              width: double.infinity,
              height: SC.from_width(180),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      child: Image.network(
                        product.image ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                      child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.5)
                    ),
                      child: IconButton(onPressed: () {
                        p.removeProduct(product);
                      }, icon: Icon(Icons.delete_outline))))
                ],
              ),
            ),
            SizedBox(
              height: SC.from_width(2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "${product.title}",
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    "₹ ${product.price}",
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: SC.from_width(18)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
