import 'package:buoi5/model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:buoi5/provider/calculate_provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CalculateProvider>(context, listen: false).loadResult();
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<CalculateProvider>(context).listResults;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  "https://images.unsplash.com/photo-1542662565-7e4b66bae529?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1854&q=80",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Calculator",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: inputForm(
                                context.read<CalculateProvider>().firstNumber,
                                "Nhap so thu 1")),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: inputForm(
                                context.read<CalculateProvider>().secNumber,
                                "Nhap so thu 2")),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        button(context, "+"),
                        button(context, "-"),
                        button(context, "X"),
                        button(context, "%"),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: TextButton(
                        onPressed: () {
                          context.read<CalculateProvider>().clearAll();
                        },
                        child: const Text(
                          "Clear All",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Consumer2<CalculateProvider, ResultModel>(
                      builder: (context, value, value2, child) {
                        return Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return AspectRatio(
                                aspectRatio: 4 / 1,
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.hardEdge,
                                  child: ChangeNotifierProvider.value(
                                    value: items[index],
                                    child: InkWell(
                                      onTap: () {
                                        value.selectItem(index);
                                        value.firstNumber.text = value
                                            .listResults[index].result
                                            .toString();
                                        value2.toggleIsClick();
                                      },
                                      child: Ink(
                                        height: 50,
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  items[index].result,
                                                  style: TextStyle(
                                                    color: value2.isClick
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<CalculateProvider>()
                                                      .deleteElement(index);
                                                },
                                                icon: const Icon(Icons.remove),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox inputForm(TextEditingController firstNumber, String hintText) {
    return SizedBox(
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: firstNumber,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          enabledBorder: outlineBorder(),
          disabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));
  }

  ElevatedButton button(context, String text) => ElevatedButton(
        onPressed: () {
          Provider.of<CalculateProvider>(context, listen: false)
              .handleCal(text);
        },
        child: Center(
          child: Text(text),
        ),
      );
}
