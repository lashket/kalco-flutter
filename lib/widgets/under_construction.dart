import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnderConstruction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: Lottie.asset('assets/lottie/under_construct.json'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text('Under construction', style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      ),
    );
  }

}