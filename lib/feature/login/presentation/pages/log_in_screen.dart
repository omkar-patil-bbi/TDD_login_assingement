import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

import '../bloc/app_bloc.dart';
import '../widgets/buttons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required String title});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        backgroundColor: Color(0xff2ACCBB),
        //  appBar: AppBar(backgroundColor: Colors.black),
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xff7CDEDF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100.0),
                        bottomRight: Radius.circular(5000.0),
                        topLeft: Radius.circular(100.0),
                        bottomLeft: Radius.circular(100.0)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 510.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0xff64fcc9),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100.0),
                          bottomRight: Radius.circular(100.0),
                          topLeft: Radius.circular(5000.0),
                          bottomLeft: Radius.circular(100.0)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClayContainer(
                          color: Color(0xff7CDEDF),
                          borderRadius: 75,
                          curveType: CurveType.convex,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "LogIn",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromARGB(96, 231, 236, 236),
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Color.fromARGB(96, 231, 236, 236),
                              // color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            height: 550,
                            width: 350,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 50),
                                  child: Row(
                                    children: [
                                      Text(
                                        " Email address * ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8, right: 8),
                                  child: TextField(
                                    controller: emailController,
                                    onChanged: (val) {
                                      setState(() {
                                        isEmailCorrect = isEmail(val);
                                      });
                                    },
                                    showCursor: true,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        labelText: "Email",
                                        hintText: "Something@gmail.com",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red.shade200,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        " Password * ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: passwordController,
                                    obscureText: !isVisible,
                                    onChanged: (password) =>
                                        onPasswordChanged(password),
                                    showCursor: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isVisible = !isVisible;
                                            });
                                          },
                                          icon: isVisible
                                              ? Icon(
                                                  Icons.visibility,
                                                  color: Colors.black,
                                                )
                                              : Icon(Icons.visibility_off,
                                                  color: Colors.grey),
                                        ),
                                        labelText: "Password",
                                        //hintText: "",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red.shade200,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: isPasswordEightCharecter
                                                ? Colors.green
                                                : Colors.transparent,
                                            border: isPasswordEightCharecter
                                                ? Border.all(
                                                    color: Colors.transparent)
                                                : Border.all(
                                                    color:
                                                        Colors.grey.shade500),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            " Contains at least 8 chracter "),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: hasPasswordOneNumber
                                                ? Colors.green
                                                : Colors.transparent,
                                            border: hasPasswordOneNumber
                                                ? Border.all(
                                                    color: Colors.transparent)
                                                : Border.all(
                                                    color:
                                                        Colors.grey.shade500),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            " Contains at least 1 number "),
                                      )
                                    ],
                                  ),
                                ),
                                MyButton(
                                    text: "LogIn",
                                    onPress: isEmailCorrect &&
                                            isPasswordEightCharecter &&
                                            hasPasswordOneNumber == true
                                        ? () {
                                            BlocProvider.of<AppBloc>(context)
                                                .loadLogoutPage();
                                          }
                                        : null)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
