// import "package:firebase_auth/firebase_auth.dart";
import "package:get/get.dart";
import "package:stock_sync/components/RegFields.dart";
import "package:flutter/material.dart";
import "package:stock_sync/constants/Constants.dart";
import "package:stock_sync/controllers/userControllers/registerController.dart";
import "package:stock_sync/screens/Home.dart";
import "package:stock_sync/screens/Login.dart";
// import "package:stocksync/services/authServices.dart";
import "package:stock_sync/models/userModel.dart";

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool is_checked = false;

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    final controller = Get.put(Registercontroller());
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: 350,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Create Account",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: tertiaryColor,
                          )),

                      const SizedBox(height: 18),

                      Image.asset('assets/images/create.png'),

                      const Text(
                        "Sign Up to Continue",
                        style: TextStyle(
                            fontSize: 16,
                            color: tertiaryColor,
                            fontWeight: FontWeight.w500),
                      ),

                      const SizedBox(height: 18),

                      const RegFields(),

                      // Remember me
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: is_checked,
                              onChanged: (bool? value) {
                                setState(() {
                                  is_checked = value ?? false;
                                });
                              },
                              checkColor: secondaryColor,
                            ),
                            const Text("I have accepted terms & conditions"),
                          ],
                        ),
                      ),

                      // button to login

                      SizedBox(
                        width: 160,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {

                            if (_formKey.currentState!.validate()) {
                              final user = User (
                                firstName: controller.firstName.text.trim(),
                                lastName: controller.lastName.text.trim(),
                                email: controller.email.text.trim(),
                                password: controller.password.text.trim(),
                              );
                              Registercontroller.instance.createUser(user);
                            } else {
                              return null;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: secondaryColor,
                          ),
                          child: const Text(
                            "SIGNUP",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      // link for create account
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => LogIn());
                        },
                        child: const Text(
                          "Already You have an account",
                          style: TextStyle(
                            fontSize: 14,
                            color: quaternaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: quaternaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
