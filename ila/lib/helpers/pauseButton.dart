import 'package:flutter/material.dart';
import 'package:ila/config.dart';
class PauseButton extends StatelessWidget{
  final ws ;
  final func ;
  PauseButton({this.ws,this.func});
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 120.0, // height of the button
        width: 120.0, // width of the button
        child: RawMaterialButton(
          fillColor: Config.PrimaryColor,
          splashColor: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ws,
          ),
          onPressed: (){func();},
        ),
      ),
    );
  }
}