import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveButton extends StatelessWidget{

  final String text ; 
  final VoidCallback handler;

  AdaptiveButton(this.text,this.handler);

  @override 
Widget build (BuildContext context){

  return Platform.isIOS
                  ? CupertinoButton(
                      onPressed: handler,
                      child:  Text(text),
                    )
                  : ElevatedButton(
                      onPressed: handler,
                      child:  Text(text),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white)))

  


}
}