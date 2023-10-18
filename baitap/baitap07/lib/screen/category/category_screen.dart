import 'package:baitap07/model/category.dart';
import 'package:baitap07/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<CategoryScreen> {
  late Future getCategory;
  @override
  void initState() {
    super.initState();
    getCategory = context.read<CategoryProvider>().getCategory();
    // context.read<CategoryProvider>().loadCheckbox();
  }

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: FutureBuilder(
            future: getCategory,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                List<CategoryModel> listData =
                    snapshot.data as List<CategoryModel>;
                return GridView.builder(
                  itemCount: listData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.primaries[index],
                        ),
                        child: Consumer<CategoryProvider>(
                          builder: (context, value, child) {
                            return CheckboxListTile(
                              title: Text(listData[index].name),
                              value: value.listId.contains(listData[index].id),
                              onChanged: (check) {
                                value.saveCheckBox(listData[index].id);
                              },
                            );
                          },
                        ));
                  },
                );
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            }),
      ),
    );
  }
}
