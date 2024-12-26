
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hecker_task/component/daimention.dart';
import 'package:hecker_task/component/product%20Model.dart';
import 'package:hecker_task/component/product%20tile.dart';
import 'package:hecker_task/providers/productPovider.dart';
import 'package:provider/provider.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context,listen: false).loadAllProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, p, child) => Scaffold(

      appBar: AppBar(
        title:CupertinoSearchTextField(
          controller: p.searchController,
          onChanged: (d){
            p.filter();
          },
        ),

      ),

      body: (p.loading)?Center(child: CircularProgressIndicator(),):
      (p.searchController.text.trim().isNotEmpty)?
      (p.filterList.isEmpty)?Center(
          child: Image.asset("assets/noSerch.png",height: SC.from_width(200),)
      ):GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: p.filterList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10 ,
              crossAxisSpacing: 6,
              mainAxisExtent: SC.from_width(280)),
          itemBuilder: (context, index) {
            var item = p.filterList[index];
            return ProductTile(product: item);
          }
      ):
      GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: p.product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        mainAxisExtent: SC.from_width(280)),
        itemBuilder: (context, index) {
          var item = p.product[index];
          return ProductTile(product: item);
        }
      ),



    ),);
  }
}
