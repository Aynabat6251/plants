import 'package:flutter/material.dart';

import 'appstyle.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formfield = GlobalKey<_ProfileState>();
  final numControllor = TextEditingController();
  final passControllor = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formfield,
        child: Column(
          children: [
            Stack(children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/zel.jpg"), fit: BoxFit.fill)),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Profil",
                      style: appstyle(36, Colors.white, FontWeight.bold)),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: numControllor,
                    decoration: InputDecoration(
                      labelText: "Telefon belgiňiz",
                      border: OutlineInputBorder(),
                      prefixText: "+993",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: passControllor,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                        labelText: "Açar sözüňiz",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Agza bol",
                          style: appstyle(20, Colors.white, FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Akaunduňyz barmy?",
                        style: appstyle(17, Colors.black, FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Içeri gir",
                            style: appstyle(18, Colors.indigo, FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
