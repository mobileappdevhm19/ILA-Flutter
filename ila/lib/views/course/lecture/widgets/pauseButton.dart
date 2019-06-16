import 'package:flutter/material.dart';
import 'package:ila/config.dart';
import 'package:ila/widgets/ilaToast.dart';
import 'package:ila_swagger/api.dart';

class PauseButton extends StatefulWidget {
  final int lectureId;
  final LecturesApi lecturesApi;

  PauseButton(this.lecturesApi, this.lectureId);

  @override
  _PauseButtonView createState() => _PauseButtonView();
}

class _PauseButtonView extends State<PauseButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipOval(
          child: Container(
            height: 120.0, // height of the button
            width: 120.0, // width of the button
            child: RawMaterialButton(
              fillColor: Config.PrimaryColor,
              splashColor: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.announcement,
                    color: Colors.white,
                    size: 34.0,
                  ),
                  Text('  Pause',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ))
                ],
              ),
              onPressed: () => widget.lecturesApi
                      .lecturesPostPause(widget.lectureId)
                      .catchError((error) {
                    if (error is ApiException && error.code == 481) {
                      ILAToast.of(context).showToast(
                        toastType: ToastType.warning,
                        message: 'you have to wait 2 min',
                      );
                    } else {
                      ILAToast.of(context).showToast(
                        toastType: ToastType.error,
                        message: error is ApiException
                            ? (error as ApiException).message
                            : 'Unbekannter Fehler ist aufgetretten',
                      );
                    }
                  }),
            ),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
