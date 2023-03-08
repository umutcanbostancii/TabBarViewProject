import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<
      FormState>(); //Kullanicinin yanlis veri girerse form key bunu kontrol eder
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width *
                0.4, //mediaquery ile cihazin genisligini aliyoruz
            decoration: BoxDecoration(
              color: Colors.blueGrey[400],
              borderRadius: BorderRadius.circular(16),
            ),

            child: Center(
              child: Text(
                "Giris Yap",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 12
          ), //container 1 tane child alir
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email giriniz",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Sifrenizi giriniz",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 40,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blueGrey[300],
                            shape: const StadiumBorder()),
                        onPressed: () {
                          String email = "email@email.com";
                          String Password = "123";
                          if (_emailController.text != email) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Emailiniz hatali lutfen kontrol edin",
                                  style: TextStyle(color: Colors.white),
                                )));
                            return;
                          }
                          if (_passwordController.text != Password) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "sifreniz hatali lutfen kontrol edin",
                                  style: TextStyle(color: Colors.white),
                                )));
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,content: 
                              Text("Tebrikler giris yapildi")));
                        },
                        child: const Text(
                          "Giris yap",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
