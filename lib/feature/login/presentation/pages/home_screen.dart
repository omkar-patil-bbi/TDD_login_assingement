import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';

class LogOutPage extends StatefulWidget {
  const LogOutPage({super.key, required String title});

  @override
  State<LogOutPage> createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2ACCBB),
        // appBar: AppBar(
        //   backgroundColor: Color(0xff3d5a5a),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Icon(Icons.logout_rounded),
        //     )
        //   ],
        // ),
        body: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 300,
                          width: 375,
                          decoration: BoxDecoration(
                            color: Color(0xff7CDEDF),
                            borderRadius: BorderRadius.only(
                              //topRight: Radius.circular(100.0),
                              bottomRight: Radius.circular(100.0),
                              //topLeft: Radius.circular(100.0),
                              //  bottomLeft: Radius.circular(5000.0)
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50.0, right: 20),
                                    child: InkWell(
                                      onTap: () {
                                        BlocProvider.of<AppBloc>(context)
                                            .loadSingInPage();
                                      },
                                      child: ClayContainer(
                                        color: Color(0xff7CDEDF),
                                        borderRadius: 75,
                                        curveType: CurveType.concave,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.logout,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 300, top: 8),
                                child: Text(
                                  "LogOut",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 212.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 300,
                            width: 375,
                            decoration: BoxDecoration(
                              color: Color(0xff7CDEDF),
                              borderRadius: BorderRadius.only(
                                //topRight: Radius.circular(100.0),
                                //bottomRight: Radius.circular(100.0),
                                topLeft: Radius.circular(100.0),
                                //  bottomLeft: Radius.circular(5000.0)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 400.0),
                  child: Card(
                    color: Color.fromARGB(95, 244, 246, 246),
                    child: Container(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Home Screen",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                ))
              ],
            )
          ],
        ));
  }
}
