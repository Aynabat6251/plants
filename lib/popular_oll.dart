import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'appstyle.dart';

class PopularOll extends StatelessWidget {
  const PopularOll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 16,
        itemCount: 16,
        scrollDirection: Axis.vertical,
        staggeredTileBuilder: (index) => StaggeredTile.extent(
            (index % 2 == 0) ? 1 : 1,
            (index % 4 == 1 || index % 4 == 3)
                ? MediaQuery.of(context).size.height * 0.35
                : MediaQuery.of(context).size.height * 0.35),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/ro.jpg",
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Gyzyl bägül",
                        style:
                            appstyleWithHt(20, Colors.black, FontWeight.w700, 1)),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "400 TMT",
                      style: appstyleWithHt(20, Colors.black, FontWeight.w500, 1),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
