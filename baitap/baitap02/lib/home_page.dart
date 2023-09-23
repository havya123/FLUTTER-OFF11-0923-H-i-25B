import 'package:flutter/material.dart';

import 'app/size_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "ZendVN",
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Study Flutter",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )
          ]),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                ),
                spaceBetween(context, height: 0.02),
                listview1(context, "Categories"),
                spaceBetween(context, height: 0.02),
                listview1(context, "Categories"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column listview1(BuildContext context, String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Text("More")],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 3,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 2 / 1,
                child: Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.sizeOf(context).width * 0.02),
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.topCenter, colors: [
                      Colors.blue.shade200,
                      Colors.blue.shade300,
                      Colors.blue.shade400,
                      Colors.blue.shade500,
                      Colors.blue.shade600,
                      Colors.blue.shade700,
                    ]),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
