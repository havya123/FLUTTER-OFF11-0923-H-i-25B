import 'package:baitap07/provider/category_provider.dart';
import 'package:baitap07/routes/routes.dart';
import 'package:baitap07/screen/home/widget/home_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<CategoryProvider>(
      builder: (context, value, child) {
        if (value.listId.isEmpty) {
          return const Center(child: Text("Chon muc yeu thich trong settings"));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  print(value.listId[index]);
                  return HomeCategory(
                    idCategory: value.listId[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: value.listId.length),
          ),
        );
      },
    ));
  }
}
