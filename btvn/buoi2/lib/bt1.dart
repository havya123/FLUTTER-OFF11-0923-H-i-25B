import 'package:flutter/material.dart';
import 'size_config.dart';

class Bt1 extends StatelessWidget {
  const Bt1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: getHeight(context, height: 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                            text: "Hello ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                  text: "ZendVN",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                      Container(
                        width: getWidth(context, width: 0.2),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                spaceBetween(context),
                listView1(context),
                spaceBetween(context),
                article("List of Article"),
                spaceBetween(context),
                Expanded(child: listView2("08:00 AM"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding listView2(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ListView.separated(
        //tại sao cần 2 dòng này
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 18),
                  )),
              Expanded(
                  flex: 10,
                  child: Container(
                    height: getHeight(context, height: 0.06),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                          Colors.blue.shade100,
                          Colors.blue.shade200,
                          Colors.blue.shade400,
                          Colors.blue.shade500,
                          Colors.blue.shade600,
                          Colors.blue.shade700,
                        ])),
                  ))
            ],
          );
        },
        separatorBuilder: (context, index) {
          return spaceBetween(context);
        },
        itemCount: 10,
      ),
    );
  }

  Text article(String text) => Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      );

  SizedBox listView1(BuildContext context) {
    return SizedBox(
      height: getHeight(context, height: 0.12),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.sizeOf(context).width * 0.02),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Colors.blue.shade100,
                        Colors.blue.shade200,
                        Colors.blue.shade400,
                        Colors.blue.shade500,
                        Colors.blue.shade600,
                        Colors.blue.shade700,
                      ]),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return spaceAround(context, width: 0.04);
          },
          itemCount: 5),
    );
  }
}
