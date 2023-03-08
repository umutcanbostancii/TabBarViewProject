import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/lottie/lottie.json"),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text(
                  "Giriş yap",
                  style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Email gir",
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: "Şifre gir",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 20,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          String email = "email.email.com";
                          String password = "123";
                          if (_emailController.text != email ||
                              _passwordController.text != password) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Emailiniz hatalı",
                                style: TextStyle(color: Colors.white),
                              ),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Giriş başarılı",
                                style: TextStyle(color: Colors.white),
                              ),
                            ));
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text(
                          "Giriş yap",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
