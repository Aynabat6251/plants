import 'package:flutter/material.dart';
import 'package:flutter_application_1/appstyle.dart';

class PopularSvety extends StatelessWidget {
  const PopularSvety({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.8,
                offset: Offset(0, 1))
          ]),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.3,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/ro.jpg",
                height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.height * 0.08,
              ),
              const SizedBox(height: 1),
              Text(
                "Gyzyl bägül",
                style: appstyle(16, Colors.black, FontWeight.bold),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                "400 TMT",
                style: appstyle(18, Colors.black, FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
