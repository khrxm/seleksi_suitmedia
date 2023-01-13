import 'dart:ui';

import 'package:flutter/material.dart ';
import 'package:seleksi_suitmedia/utils/constant.dart';
import 'package:seleksi_suitmedia/view/first_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/first');
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Constant.darkColor,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Second Screen',
          style: TextStyle(
              color: Constant.darkColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Constant.whiteColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Constant.darkColor,
              ),
            ),
            const Text(
              'nama',
              style: TextStyle(
                fontSize: 18,
                color: Constant.darkColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 200),
                child: Text(
                  "Select a user to show the profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff808080),
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
          child: const Text('Third Screen'),
          style: ElevatedButton.styleFrom(
            primary: Constant.buttonColor,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
