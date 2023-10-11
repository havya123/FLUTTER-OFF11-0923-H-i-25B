import 'package:baitap06/widgets/input_form.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    bool loading = false;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 25),
            ),
            const Text("Create a new account"),
            space(),
            Form(
              key: loginFormKey,
              child: Column(
                children: [
                  InputForm(
                      prefixIcon: const Icon(Icons.email),
                      hintText: "Email or Phone Nummber"),
                  space(),
                  InputForm(
                    prefixIcon: const Icon(Icons.key),
                    hintText: "Password",
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    obscure: true,
                    suffixIconChanged: const Icon(Icons.hide_source),
                  ),
                ],
              ),
            ),
            space(),
            createAccount(loginFormKey, loading),
            space(),
            const Center(child: Text("Already have an accout? Login")),
          ],
        ),
      ),
    );
  }

  SizedBox space() {
    return const SizedBox(
      height: 30,
    );
  }

  Container createAccount(formKey, bool loading) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: StatefulBuilder(
        builder: (context, setState2) {
          return ElevatedButton(
              onPressed: () async {
                if (loading) return;
                setState2(() {
                  loading = !loading;
                });
                await Future.delayed(const Duration(seconds: 1));
                setState2(() {
                  loading = !loading;
                });
                if (formKey.currentState!.validate()) {}
              },
              child: Center(
                child: Text(!loading ? "Create account" : "Loading"),
              ));
        },
      ),
    );
  }
}
