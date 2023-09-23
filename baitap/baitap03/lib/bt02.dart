import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bt02 extends StatelessWidget {
  const Bt02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text(
              'Reiciendis earum ea non doloribus exercitationem omnis. Commodi id inventore nostrum eos aut. Voluptatibus et et eos laudantium et.',
              style: GoogleFonts.roboto(),
            ),
            SizedBox(
              height: 50,
            ),
            Image.network(
                "https://images.unsplash.com/photo-1682685795557-976f03aca7b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1771&q=80"),
            SizedBox(
              height: 50,
            ),
            Text(
              'Reiciendis earum ea non doloribus exercitationem omnis. Commodi id inventore nostrum eos aut. Voluptatibus et et eos laudantium et.',
              style: TextStyle(fontFamily: "Roboto"),
            ),
            Image.asset("assets/views.jpg")
          ],
        ),
      ),
    );
  }
}
