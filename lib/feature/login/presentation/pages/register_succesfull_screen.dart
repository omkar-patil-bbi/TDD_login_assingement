import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../widgets/buttons.dart';

class RegisterSuccesfullPage extends StatefulWidget {
  const RegisterSuccesfullPage({super.key, required String title});

  @override
  State<RegisterSuccesfullPage> createState() => _RegisterSuccesfullPageState();
}

class _RegisterSuccesfullPageState extends State<RegisterSuccesfullPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool checkBoxValue = false;

  bool isEmailCorrect = false;
  bool isPasswordEightCharecter = false;
  bool hasPasswordOneNumber = false;
  bool isVisible = false;

  bool isValidForm() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return isEmailCorrect && isPasswordEightCharecter && hasPasswordOneNumber;
    }

    return false;
  }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      isPasswordEightCharecter = false;
      if (password.length >= 8) isPasswordEightCharecter = true;

      hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) hasPasswordOneNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff7CDEDF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100.0),
                        bottomRight: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomLeft: Radius.circular(10.0)),
                  ),
                  height: 400,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Account created Succesfully",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.green,
                                value: checkBoxValue,
                                onChanged: ((newValue) {
                                  setState(() {
                                    checkBoxValue = newValue!;
                                  });
                                })),
                            Text(
                              'Remember me',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyButton(
                  text: "Log In",
                  onPress: () {
                    BlocProvider.of<AppBloc>(context)
                        .saveIsRemember(checkBoxValue);
                    BlocProvider.of<AppBloc>(context).loadSingInPage();
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130.0, left: 250),
            child: Card(
              color: Color(0xff64fcc9),
              // color: Color.fromARGB(95, 218, 229, 229),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
              child: Container(
                height: 70,
                width: 70,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
