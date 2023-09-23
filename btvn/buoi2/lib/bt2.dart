import 'package:buoi2/size_config.dart';
import 'package:flutter/material.dart';

class Bt2 extends StatelessWidget {
  const Bt2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "Welcome ZendVN",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          width: getWidth(context, width: 0.4),
                          height: getHeight(context, height: 0.4),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80),
                              ),
                              color: Colors.blue),
                        )),
                  ],
                ),
                spaceBetween(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(
                          context, "asfsfsaf asfsfsaf sa fsafasf fsafasf asfa"),
                      spaceBetween(context),
                      Container(
                        width: getWidth(context, width: 0.5),
                        height: getHeight(context, height: 0.05),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      spaceBetween(context),
                      title(context, "sffsafasfasfasfasfasfadggggggggggggggg"),
                      spaceBetween(context),
                      title(context,
                          "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"),
                      spaceBetween(context),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("gsdsgsdgsdgsdg"),
                          Text("dgsdgdsgsdgsdg")
                        ],
                      ),
                      spaceBetween(context),
                      Container(
                        width: getWidth(context, width: 1),
                        height: getHeight(context, height: 0.25),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                            bottomLeft: Radius.circular(80),
                          ),
                          color: Colors.yellow,
                        ),
                      ),
                      spaceBetween(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

SizedBox title(context, String text, {double fontSize = 17}) {
  return SizedBox(
    width: double.infinity,
    child: Text(
      text,
      overflow: TextOverflow.clip,
      style: TextStyle(fontSize: fontSize),
    ),
  );
}
