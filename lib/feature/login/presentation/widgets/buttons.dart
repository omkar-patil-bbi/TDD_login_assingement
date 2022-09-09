import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, this.onPress});

  final String text;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClayContainer(
          //color: baseColor,

          borderRadius: 75,
          curveType: CurveType.concave,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 118, 198, 199),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 50,
            width: 200,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
