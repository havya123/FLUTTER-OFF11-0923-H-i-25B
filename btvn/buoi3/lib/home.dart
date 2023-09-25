import 'package:buoi3/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<ItemProvider>().increase();
                },
                child: const Text("+")),
            const SizedBox(
              height: 20,
            ),
            Consumer<ItemProvider>(
              builder: (context, value, child) {
                return Text(value.number.toString());
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ItemProvider>().decrease();
                },
                child: const Text("-"))
          ],
        ),
      ),
    );
  }
}
