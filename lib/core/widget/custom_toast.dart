import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theme/app_color.dart';

class CustomToast{
  static void showToast({required String message,required BuildContext context}){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: AppColor.blackColor,
      textColor:AppColor.whiteColor,
      fontSize: 20,
      webBgColor: "linear-gradient(to right, #000000, #000000)",
    );
  }

}