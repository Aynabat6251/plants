import 'package:flutter/material.dart';
import 'package:flutter_application_1/product_by_cat.dart';
import 'package:flutter_application_1/product_page.dart';
import 'appstyle.dart';
import 'popular_svety.dart';
import 'product_card.dart';
class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key, required this.tabIndex,
  });
   final int tabIndex;
    
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.405,
         child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap:(){
                Navigator.push(context,
                 MaterialPageRoute(builder:(context)=> 
                 ProductPage(
                 price:"450 TMT" ,
                 category:"Otag gülleri",
                  id: "1", 
                  name:"Filodendron" , 
                 )));
              },
              child: ProductCard(
                price:"450 TMT" ,
                 category:"Otag gülleri",
                  id: "1", 
                  name:"Filodendron" , 
                  image:"assets/filo.jpeg",),
            );
          }),
        ),
         Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12,20,12,20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular",
                  style: appstyle(
                    24, Colors.black, FontWeight.bold),),
                GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductByCat(
                    tabIndex: tabIndex,
                  )));
                },
                 child:
                  const Icon(Icons.arrow_right_sharp,size:40)
                
               )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.13,
       child:ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopularSvety(),
            );
          }) ,
        )
         ],
    );
  }
}