import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

import '../bloc/app_bloc.dart';
import '../widgets/buttons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required String title});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool isEmailCorrect = false;
  bool isPasswordEightCharecter = false;
  bool hasPasswordOneNumber = false;
  bool isVisible = false;

  // bool isValidForm() {
  //   if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
  //     return isEmailCorrect && isPasswordEightCharecter && hasPasswordOneNumber;
  //   }

  //   return false;
  // }

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
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color(0xff2ACCBB),

        //appBar: AppBar(backgroundColor: Colors.red),
        body: Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xff7CDEDF),
                        //color: Color(0xff3d5a5a),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100.0),
                            //  bottomRight: Radius.circular(5.0),
                            topLeft: Radius.circular(100.0),
                            bottomLeft: Radius.circular(5000.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0, left: 30),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClayContainer(
                              color: Color.fromARGB(255, 109, 186, 187),
                              // color: Color.fromARGB(95, 145, 156, 156),
                              borderRadius: 75,
                              curveType: CurveType.convex,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  "Registartion",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xff64fcc9),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5000.0),
                              //  bottomRight: Radius.circular(5.0),
                              topLeft: Radius.circular(100.0),
                              bottomLeft: Radius.circular(100.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90.0, left: 10, right: 10),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Card(
                      // color: Colors.redAccent.withOpacity(0.5),
                      color: Color.fromARGB(96, 231, 236, 236),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 20,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 20),
                            child: Row(
                              children: [
                                Text(
                                  " Name * ",
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
                              controller: nameController,
                              onChanged: (val) {
                                setState(() {
                                  isEmailCorrect = isEmail(val);
                                });
                              },
                              showCursor: true,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  hintText: "Ronaldo",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red.shade200,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 20),
                            child: Row(
                              children: [
                                Text(
                                  " Age * ",
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
                              controller: ageController,
                              onChanged: (val) {
                                setState(() {
                                  isEmailCorrect = isEmail(val);
                                });
                              },
                              showCursor: true,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Age",
                                  hintText: "21",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red.shade200,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 20),
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
                            padding: const EdgeInsets.all(8.0),
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
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red.shade200,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 20),
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
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red.shade200,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
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
                                              color: Colors.grey.shade500),
                                      borderRadius: BorderRadius.circular(50)),
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
                                  child: Text(" Contains at least 8 chracter "),
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
                                              color: Colors.grey.shade500),
                                      borderRadius: BorderRadius.circular(50)),
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
                                  child: Text(" Contains at least 1 number "),
                                )
                              ],
                            ),
                          ),
                          MyButton(
                            text: "Register",
                            onPress: () {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty &&
                                  nameController.text.isNotEmpty &&
                                  ageController.text.isNotEmpty &&
                                  isEmailCorrect &&
                                  isPasswordEightCharecter &&
                                  hasPasswordOneNumber) {
                                BlocProvider.of<AppBloc>(context)
                                    .loadRegisterSuccesfullPage();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Please enter Missing data'),
                                  ),
                                );
                              }
                            },
                            // onPress: isEmailCorrect &&
                            //         isPasswordEightCharecter &&
                            //         hasPasswordOneNumber == true
                            //     ? () {
                            //         BlocProvider.of<AppBloc>(context)
                            //             .loadSingInPage();
                            //       }
                            //     : null
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                    "If you are all ready registered goto the "),
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<AppBloc>(context)
                                        .loadSingInPage();
                                  },
                                  child: Text(
                                    "LogIn ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 32, 177, 36),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "page",
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
