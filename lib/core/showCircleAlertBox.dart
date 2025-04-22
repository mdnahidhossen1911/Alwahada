import 'package:flutter/material.dart';

showCircleAlertBox (BuildContext context){
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
      )
    );
  },);
}