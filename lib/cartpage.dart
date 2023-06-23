import 'package:flutter/material.dart';
import 'package:flutter_application_1/appstyle.dart';
import 'package:flutter_application_1/checkout_btn.dart';
import 'package:flutter_application_1/constantss.dart';
import 'package:hive/hive.dart';
import 'mainscreen.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final _cartBox=Hive.box('cart_box');

  _deleteCart(int key) async {
    await _cartBox.delete(key);
  }

  @override
  Widget build(BuildContext context) {
     List<dynamic> cart = [];
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "name": item['name'],
        "category": item['category'],
        "price": item['price'],
        "image": item['image']
      };
    }).toList();
    cart = cartData.reversed.toList();
    return Scaffold(
      backgroundColor: const Color(0XFFE2E2E2),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Sebet",
                    style: appstyle(36, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView.builder(
                        itemCount: cart.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context,int index) {
                          final svety = cart[index];
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade500,
                                        spreadRadius: 5,
                                        blurRadius: 0.3,
                                        offset: Offset(0, 1)),
                                  ]),
                              child: SingleChildScrollView(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Image.asset(
                                            "assets/filo.jpeg",
                                            height: 70,
                                            width: 70,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 12, left: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Filodendron",
                                                style: appstyle(16, Colors.black,
                                                    FontWeight.bold),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "otog gulleri",
                                                style: appstyle(14, Colors.grey,
                                                    FontWeight.w600),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "450 TMT",
                                                style: appstyle(18, Colors.black,
                                                    FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                     Padding(
                                    padding: EdgeInsets.all(8),
                                    child: GestureDetector(
                                      onTap: (){
                                        _deleteCart(svety['key']);
                                        idss.removeWhere(
                                          (element)=>element==svety['id']
                                        );
                                        Navigator.push(context,MaterialPageRoute(
                                          builder:(context)=>MainScreen() ));
                                      },
                                      child:const Icon(Icons.delete),
                                    ),
                                  )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                   const Align(
                alignment: Alignment.bottomCenter,
                child: CheckoutButton(
                  lable: "Sargyt et"),
              )
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
