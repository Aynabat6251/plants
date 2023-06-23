import 'package:flutter/material.dart';
import 'package:flutter_application_1/appstyle.dart';
import 'package:flutter_application_1/product_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'cartpage.dart';
import 'checkout_btn.dart';
import 'constantss.dart';

class ProductPage extends StatefulWidget {
  const ProductPage(
      {super.key,
      required this.id,
      required this.category,
      required this.price,
      required this.name});
  final String id;
  final String category;
  final String price;
  final String name;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

List a = [
  "assets/filo.jpeg",
  "assets/fi.jpeg",
  "assets/filo.jpeg",
  "assets/fi.jpeg",
];

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();
  final _cartBox = Hive.box('cart_box');
  Future<void> _createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
    getCarts();
  }

  getCarts() {
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);

      return {
        "key": key,
        "id": item["id"],
      };
    }).toList();

    carts = cartData.toList();
    idss = carts.map((item) => item['id']).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Consumer<ProductNotifier>(builder: (context, productNotifer, child) {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                      ),
                    )
                  ]),
            ),
            pinned: true,
            snap: false,
            floating: true,
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      controller: pageController,
                      onPageChanged: (page) {
                        productNotifer.activePage = page;
                      },
                      itemBuilder: (context, int index) {
                        return Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.39,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey.shade300,
                              child: Image.asset(
                                a[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                                top: MediaQuery.of(context).size.height * 0.05,
                                right: 20,
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                )),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List<Widget>.generate(
                                      a.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            child: CircleAvatar(
                                              radius: 5,
                                              backgroundColor:
                                                  productNotifer.activepage !=
                                                          index
                                                      ? Colors.grey
                                                      : Colors.black,
                                            ),
                                          )),
                                )),
                          ],
                        );
                      }),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.37,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.645,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.name,
                                    style: appstyle(
                                        40, Colors.black, FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.category,
                                        style: appstyle(
                                            20, Colors.grey, FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 22,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Colors.black,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    widget.price,
                                    style: appstyle(
                                        26, Colors.black, FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    indent: 10,
                                    endIndent: 10,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '''  Filodendron - hemişe gök öwüsýän köpýyllyk ösümlik, Aroid maşgalasynyň Filodendron urugynyň bir görnüşi. Filodendron Braziliýada we dünýäniň käbir ýerlerinde doglan ösümlikdir. Bu at grek dilinden "Phileo" (söýmek) we "dendron" (agaç) gelip çykýar.''',
                                    textAlign: TextAlign.justify, 
                                    style: appstyle(
                                        25, Colors.black, FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: CheckoutButton(
                                          onTap: () async {
                                            if (idss.contains(widget.id)) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CartPage()));
                                            } else {
                                              _createCart({
                                                "id": widget.id,
                                                "name": widget.name,
                                                "category": widget.category,
                                                "price": widget.price,
                                              });
                                            }
                                          },
                                          lable: idss.contains(widget.id)
                                              ? "Sebetden aýyr"
                                              : "Sebede goş"),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ))
              ],
            )),
          ),
        ],
      );
    }));
  }
}
