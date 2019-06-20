import 'package:flutter_driver/driver_extension.dart';
import 'package:ila/main.dart' as ila;

void main(){
  //This line enables the extension
  enableFlutterDriverExtension();

  //Call the 'main()' function of the app, or call 'runApp' with
  //any widget
  ila.main();
}