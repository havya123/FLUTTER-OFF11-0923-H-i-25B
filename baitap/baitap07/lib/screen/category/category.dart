import 'package:baitap07/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryProvider>().getCategory();
    context.read<CategoryProvider>().loadCheckbox();
  }

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Consumer<CategoryProvider>(
          builder: (context, value, child) {
            return GridView.builder(
              itemCount: value.category.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                isCheck = context
                        .read<CategoryProvider>()
                        .prefs
                        ?.getBool("isChecked_${value.category[index].id}") ??
                    false;
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index % 2 == 0 ? Colors.yellow : Colors.red,
                    ),
                    child: CheckboxListTile(
                      title: Text(value.category[index].name.toString()),
                      value: isCheck,
                      onChanged: (value1) {
                        print(value1);
                        isCheck = value1!;
                        context
                            .read<CategoryProvider>()
                            .saveCheckBox(value.category[index].id, isCheck);
                      },
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}
