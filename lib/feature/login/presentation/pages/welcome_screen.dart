import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task3/feature/presentation/pages/register_screen.dart';

import '../bloc/app_bloc.dart';
import '../widgets/buttons.dart';
import 'register_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required String title});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2ACCBB),
        appBar: AppBar(
          backgroundColor: Color(0xff7CDEDF),
          title: ClayContainer(
              color: Color(0xff7CDEDF),
              borderRadius: 75,
              curveType: CurveType.convex,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Welcomes Screen'),
              )),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClayContainer(
                    color: Color(0xff2ACCBB),
                    borderRadius: 75,
                    curveType: CurveType.concave,
                    depth: 100,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xff2ACCBB),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100.0),
                            bottomRight: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0),
                            bottomLeft: Radius.circular(100.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyButton(
                      text: "Get Started",
                      onPress: () {
                        BlocProvider.of<AppBloc>(context).loadRegisterPage();
                      },
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
