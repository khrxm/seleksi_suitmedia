//FIRST PAGE
import 'package:flutter/material.dart';

import '../utils/constant.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _palindromeControler =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    bool isPalindrome() {
      String palindrome = _palindromeControler.text;
      String reverse = palindrome.split('').reversed.join();
      if (reverse == palindrome) {
        return false;
      } else {
        return true;
      }
    }

    showDialogMessage({required String message, required Color color}) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }

    handleCheckPalindrome() {
      if (isPalindrome()) {
        showDialogMessage(message: "is palindrome", color: Colors.green);
      } else {
        showDialogMessage(message: "is not palindrome", color: Colors.red);
      }
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 116,
                height: 116,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white38,
                ),
                child: const Icon(
                  Icons.person_add_alt_sharp,
                  size: 40,
                  color: Constant.whiteColor,
                ),
              ),
              const SizedBox(
                height: 58,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 22),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Constant.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  //controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Name',
                  ),
                  style: const TextStyle(
                    color: Constant.darkColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 45),
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
                decoration: BoxDecoration(
                  color: Constant.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: _palindromeControler,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Palindrome',
                  ),
                  style: const TextStyle(
                    color: Constant.darkColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 43,
                margin: const EdgeInsets.only(
                  bottom: 22,
                ),
                decoration: BoxDecoration(
                  color: Constant.buttonColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      handleCheckPalindrome();
                    },
                    child: const Center(
                      child: Text(
                        "Check",
                        style:
                            TextStyle(color: Constant.whiteColor, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 43,
                margin: const EdgeInsets.only(
                  bottom: 22,
                ),
                decoration: BoxDecoration(
                  color: Constant.buttonColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.pushNamed(context, '/second');
                    },
                    child: const Center(
                      child: Text(
                        "Next",
                        style:
                            TextStyle(color: Constant.whiteColor, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
