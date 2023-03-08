import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mart_8_project/home_page.dart';
import 'package:mart_8_project/register.dart';
import 'package:mart_8_project/tab_sub_widgets/home.dart';

import 'tab_subwidgets/home.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = "deneme@mail.com";
  String password = "123";
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myPrimaryColor,
        title: const Text(
          "Giriş Yap",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: LottieBuilder.asset("assets/lottie/lottie.json")),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value.toString());
                        return !emailValid ? "Geçerli bir email giriniz" : null;
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email giriniz",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon:
                            const Icon(Icons.email, color: myPrimaryColor),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: myPrimaryColor,
                              width: 2,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      obscureText: !isVisibility,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (password == value) {
                          return null;
                        }
                        return "Lütfen şifreyi 123 girin";
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: "Şifrenizi giriniz",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: myPrimaryColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: myPrimaryColor,
                                width: 2,
                              )),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisibility = !isVisibility;
                                });
                              },
                              child: Icon(
                                isVisibility == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: myPrimaryColor,
                              ))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 45,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: myPrimaryColor,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        "Lütfen alanlarınızı kontrol edin!",
                                        style: TextStyle(color: Colors.white),
                                      )));
                              return;
                            }
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    backgroundColor: myPrimaryColor,
                                    content: Text(
                                      "Tebrikler giriş yapıldı",
                                      style: TextStyle(color: Colors.white),
                                    )));
                          },
                          child: const Text(
                            "Giriş yap",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyRegisterPage()));
                        },
                        child: const Text(
                          "Hesabın yok mu? Kayıt ol",
                          style: TextStyle(color: myPrimaryColor),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const Color myPrimaryColor = Colors.teal;
