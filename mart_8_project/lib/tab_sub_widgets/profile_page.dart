import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width *
              0.8, //mediaquery ile cihazin genisligini aliyoruz
          decoration: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(16)),
          child: Text(
            "Giris Yap",
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
