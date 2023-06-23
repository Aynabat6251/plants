import 'package:flutter/material.dart';
import 'appstyle.dart';
import 'category_btn.dart';
import 'custom_spacer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.82,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color.fromRGBO(93, 129, 2, 0.82)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(93, 129, 2, 0.82).withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.68,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Gözleg',
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    size: 25,
                  )
                ],
              ),
            ),
            Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.12,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 129, 2, 0.82),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(93, 129, 2, 0.82).withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    filter();
                  },
                  child: Center(
                      child: Icon(
                    Icons.filter_alt_outlined,
                    size: 25,
                    color: Colors.white,
                  )),
                ))
          ],
        ),
      ),
    );
  }

  Future filter() {
    double _value = 100;
    return showModalBottomSheet(
        context: context,
        barrierColor: Colors.white54,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 84,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: [
                        const CustomSpacer(),
                        Text(
                          "Filter",
                          style: appstyle(40, Colors.black, FontWeight.bold),
                        ),
                        Text(
                          "Category",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CategoryBtn(
                              label: "Otag gulleri",
                              buttonClr: Colors.black,
                            ),
                            CategoryBtn(
                              label: "Bag gulleri",
                              buttonClr: Colors.grey,
                            ),
                            CategoryBtn(
                              label: "Seyrek guller",
                              buttonClr: Colors.grey,
                            )
                          ],
                        ),
                        const CustomSpacer(),
                        Text("Bahalar",
                            style: appstyle(20, Colors.black, FontWeight.w600)),
                        const CustomSpacer(),
                        Slider(
                            value: _value,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.black,
                            max: 500,
                            divisions: 50,
                            label: _value.toString(),
                            secondaryTrackValue: 200,
                            onChanged: (double value) {})
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
