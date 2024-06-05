import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String msg, bool? success}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor:  success==true?Colors.green[50]:Colors.red[50],
    textColor: success==true?Colors.green:Colors.red,
    fontSize: 16.0,
  );
}