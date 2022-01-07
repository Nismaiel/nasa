import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenElements {

  Widget loading(){
    return const Center(child: CircularProgressIndicator(),);
  }

  Widget offlineSign() {
    return Container(color: Colors.red, child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(CupertinoIcons.airplane, color: Colors.white,),
        Text('you are browsing offline', style: TextStyle(color: Colors.white),)
      ],));
  }




}