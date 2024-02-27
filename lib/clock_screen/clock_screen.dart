import 'package:flutter/material.dart';
import 'dart:math';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  int? m, s, h, dd, mm, yy;
  bool isAnalog = false, isSmart = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Clock",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isAnalog,
              child: Stack(
                children: [
                  //Analog
                  Stack(
                    children: List.generate(
                      60,
                      (index) => Transform.rotate(
                        angle: (pi * 2) * index / 60,
                        child: Divider(
                          color: index % 5 == 0 ? Colors.red : Colors.green,
                          endIndent: index % 5 == 0
                              ? MediaQuery.sizeOf(context).width * 0.90
                              : MediaQuery.sizeOf(context).width * 0.95,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: (pi * 2) * h! / 60,
                    child: Divider(
                      endIndent: MediaQuery.sizeOf(context).width / 2,
                      thickness: 3,
                      color: Colors.green,
                      indent: 100,
                    ),
                  ),
                  //Min
                  Transform.rotate(
                    angle: (pi * 2) * m! / 60,
                    child: Divider(
                      endIndent: MediaQuery.sizeOf(context).width / 2,
                      thickness: 3,
                      color: Colors.red,
                      indent: 80,
                    ),
                  ),
                  // Second
                  Transform.rotate(
                    angle: (pi * 2) * s! / 60,
                    child: Divider(
                      endIndent: MediaQuery.sizeOf(context).width / 2,
                      indent: 60,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isSmart,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(45),
                    height: 300,
                    width: 300,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/logo.png"),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$h : $m :$s",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 45),
                            ),
                            Text(
                              "$dd/$mm/$yy",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 240,
                                    decoration: const BoxDecoration(
                                        color: Colors.black),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/battery.png",
                                          height: 30,
                                          width: 30,
                                        ),
                                        const Text(
                                          "60 %",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          "👣",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.purple),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "512 Steps",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          "💓",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.purple),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      isAnalog = true;
                      isSmart = false;
                      Navigator.pop(context);
                    },
                    child: const Text("Analog Clock")),
                SizedBox(height: 15,),
                ElevatedButton(
                    onPressed: () {
                      isSmart = true;
                      isAnalog = false;
                      Navigator.pop(context);
                    },
                    child: const Text("Smart Clock"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void timer() {
    setState(() {
      h = DateTime.now().hour;
      m = DateTime.now().minute;
      s = DateTime.now().second;
      dd = DateTime.now().day;
      mm = DateTime.now().month;
      yy = DateTime.now().year;
    });
    Future.delayed(
      const Duration(seconds: 1),
      () {
        timer();
      },
    );
  }
}
