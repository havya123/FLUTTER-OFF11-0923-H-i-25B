import 'package:buoi3/size_config.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key, required this.onReturn});
  final VoidCallback onReturn;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1.1,
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.orange.shade100,
                Colors.orange.shade200,
                Colors.orange.shade300,
                Colors.orange.shade400,
                Colors.orange.shade500,
              ]),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: margin(context, margin: 0.02),
                  vertical: margin(context, margin: 0.03)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bill Details",
                    style: TextStyle(
                      fontSize: textSize(context),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  spaceBetween(context),
                  detail("Item Total", "\$20.70"),
                  spaceBetween(context),
                  detail("Delivery Free for 3.6kms", "+\$12.70"),
                ],
              ),
            ),
            Expanded(child: checkOut(context))
          ],
        ),
      ),
    );
  }

  Container checkOut(context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: margin(context, margin: 0.03),
            vertical: margin(context, margin: 0.03)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Total",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: textSize(context, size: 0.055),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$39.10",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: textSize(context, size: 0.055),
                  ),
                )
              ],
            ),
            spaceBetween(context, height: 0.035),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(
                    Icons.airplane_ticket,
                    size: textSize(context, size: 0.1),
                    color: Colors.yellow,
                  ),
                  hintText: "Promo Code",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: textSize(context, size: 0.06),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: margin(context, margin: 0.02)),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange),
                      child: Center(
                        child: Text(
                          "Apply",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: textSize(context, size: 0.055),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            spaceBetween(context, height: 0.04),
            GestureDetector(
              onTap: () {
                onReturn();
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: getHeight(context, height: 0.08),
                decoration: BoxDecoration(
                    borderRadius: borderRadius(context, borderRadius: 0.04),
                    color: Colors.orange),
                child: Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: textSize(
                        context,
                        size: 0.07,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row detail(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          price,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
