import 'package:flutter/material.dart';
import 'package:flutter_application_1/appstyle.dart';
import 'package:flutter_application_1/mainscreen.dart';
import 'package:hive/hive.dart';
import 'constants.dart';

class Favorites extends StatelessWidget {
 Favorites({super.key});

  final _favBox = Hive.box('fav_box');

  _deleteFav(int key) async {
    await _favBox.delete(key);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> fav = [];
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "name": item['name'],
        "category": item['category'],
        "price": item['price'],
        "image": item['image']
      };
    }).toList();
    fav = favData.reversed.toList();
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/zel.jpg"), fit: BoxFit.fill)),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("Halanlarym",
                    style: appstyle(36, Colors.white, FontWeight.bold)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: fav.length,
                padding: const EdgeInsets.only(top: 100),
                itemBuilder: (BuildContext context, int index) {
                  final svety = fav[index];
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
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
                                  offset: Offset(0, 1))
                            ]),
                        child: SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Image.asset(
                                      "assets/filo.jpeg",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 12, left: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Filodendron",
                                          style: appstyle(
                                              16, Colors.black, FontWeight.bold),
                                        ),
                                  const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Otag gulleri",
                                          style: appstyle(
                                              14, Colors.grey, FontWeight.w600),
                                        ),
                                      const  SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "450 TMT",
                                          style: appstyle(
                                              18, Colors.black, FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                 
                                ],
                              ),
                               Padding(
                                    padding: EdgeInsets.all(8),
                                    child: GestureDetector(
                                      onTap: (){
                                        _deleteFav(svety['key']);
                                        ids.removeWhere(
                                          (element)=>element==svety['id']
                                        );
                                        Navigator.push(context,MaterialPageRoute(
                                          builder:(context)=>MainScreen() ));
                                      },
                                      child:const Icon(Icons.favorite),
                                    ),
                                  )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
