import 'package:flutter/material.dart';
import 'package:hecker_task/component/cartTile.dart';
import 'package:hecker_task/component/daimention.dart';
import 'package:hecker_task/providers/auth_provider.dart';
import 'package:hecker_task/providers/cartProvider.dart';
import 'package:hecker_task/screens/ShoppingScreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CartProvider>(context,listen: false).lodeCart();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, p, child) =>Scaffold(

        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingScreen(),));
          },child: Icon(Icons.add),),

        appBar: AppBar(
          title: Text("Hi-Fi Shop & Service My Cart"),
          actions: [
            IconButton(onPressed: (){
              Provider.of<AuthProvider>(context,listen: false).logOut(context);
            }, icon: Icon(Icons.logout))
          ],
        ),

        body:  (p.loading)?Center(child: CircularProgressIndicator(),):
        (p.product.length==0)?
            Center(child: Image.asset("assets/emtycartNoBG.png")):
          GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 6),
          itemCount: p.product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              mainAxisExtent: SC.from_width(280)),
          itemBuilder: (context, index) => CartTile(product: p.product[index]),

        ),
      ) ,
    );
  }
}
