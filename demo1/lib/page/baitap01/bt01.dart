import 'package:flutter/material.dart';

class Bt01 extends StatelessWidget {
  const Bt01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.green,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.green,
              ),
            ],
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle
            ),
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle
                ),
              ),
            ),
          ),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.green,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.green,
              ),
            ],
          ),     
      ],)
    );
  }
}