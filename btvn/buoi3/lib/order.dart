import 'package:buoi3/checkout.dart';
import 'package:buoi3/size_config.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    int itemCount = 2;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          itemBuilder: (context, index) {
            if (index == itemCount) {
              return null;
            }
            return item(
                context,
                "https://images.unsplash.com/photo-1553279768-865429fa0078?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
                "Mango",
                "Fruit",
                "\$9.9",
                "\$19.9",
                "5");
          },
          separatorBuilder: (context, index) {
            return divider(context);
          },
          itemCount: itemCount + 1,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CheckOut(
                    onReturn: () {
                      showSnackBar(context);
                    },
                  );
                },
                backgroundColor: Colors.transparent);
          },
          child: Container(
            width: double.infinity,
            height: getHeight(context, height: 0.075),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.yellow,
            ),
            child: Center(
              child: Text(
                "Buy Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textSize(context, size: 0.075),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showSnackBar(context) {
    SnackBar snackBar = SnackBar(
      content: Center(
        child: Text(
          "Order thanh cong",
          style: TextStyle(
            fontSize: textSize(context, size: 0.07),
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: margin(context, margin: 0.75),
          left: margin(context, margin: 0.05),
          right: margin(context, margin: 0.05)),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius(context, borderRadius: 0.1),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Row item(BuildContext context, String image, String name, String type,
      String priceAfter, String priceBefore, String amount) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: borderRadius(context, borderRadius: 0.05),
          child: Container(
            margin: EdgeInsets.only(
                bottom: margin(context, margin: 0.02),
                top: margin(context, margin: 0.02)),
            width: getWidth(context, width: 0.35),
            height: getHeight(context, height: 0.2),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        spaceAround(context),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: textSize(context, size: 0.075),
                  fontWeight: FontWeight.bold,
                ),
              ),
              spaceBetween(context, height: 0.02),
              Text(
                type,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: textSize(context, size: 0.055),
                    fontWeight: FontWeight.w500),
              ),
              spaceBetween(context, height: 0.02),
              Row(
                children: [
                  Text(
                    priceAfter,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: textSize(context, size: 0.055),
                        fontWeight: FontWeight.bold),
                  ),
                  spaceAround(context),
                  Text(
                    priceBefore,
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontSize: textSize(context, size: 0.055),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.add,
              size: textSize(context, size: 0.05),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: borderRadius(context, borderRadius: 0.03),
                color: Colors.orange.shade100,
              ),
              child: Center(
                  child: Text(
                amount,
                style: TextStyle(
                    fontSize: textSize(context, size: 0.055),
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Icon(
              Icons.remove,
              color: Colors.orange,
              size: textSize(context, size: 0.05),
            )
          ],
        )
      ],
    );
  }
}
