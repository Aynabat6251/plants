import 'package:flutter/material.dart';
import 'appstyle.dart';
import 'home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/zel.jpg"), fit: BoxFit.fill)),
                  child: Container(
                    padding: const EdgeInsets.only(left: 8, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Janly güller",
                          style: appstyleWithHt(
                              42, Colors.white, FontWeight.bold, 1.5),
                        ),
                        SizedBox(height: 10,),
                        TabBar(
                            padding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelStyle:
                                appstyle(24, Colors.white, FontWeight.bold),
                            unselectedLabelColor: Colors.grey.withOpacity(0.3),
                            tabs: const [
                              Tab(
                                text: "Otag gülleri",
                              ),
                              Tab(
                                text: "Bag gülleri",
                              ),
                              Tab(
                                text: "Seýrek güller",
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.265),
                  child: Container(
                    padding: const EdgeInsets.only(left: 12),
                    child: TabBarView(controller: _tabController, children: [
                      HomeWidget(
                        tabIndex: 0,
                      ),
                      HomeWidget(
                        tabIndex: 1,
                      ),
                      HomeWidget(
                        tabIndex: 2,
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
