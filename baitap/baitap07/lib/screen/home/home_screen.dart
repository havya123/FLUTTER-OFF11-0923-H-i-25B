import 'package:baitap07/routes/routes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {},
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.articleScreen);
                  },
                  child: const Text("change article")),
            )),
      ),
    );
  }
}
