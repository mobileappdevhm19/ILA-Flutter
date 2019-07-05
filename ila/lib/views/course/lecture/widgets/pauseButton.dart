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
    return Card(
      color: Colors.white70,
      child: Container(
        margin: new EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                  FlatButton.icon(
                    onPressed: () => widget.lecturesApi
                            .lecturesPostPause(widget.lectureId)
                            .then((_) => ILAToast.of(context).showToast(
                                  toastType: ToastType.success,
                                  message: 'pause send',
                                ))
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
                    label: Text('Pause'),
                    icon: Icon(Icons.announcement),
                    color: Colors.primaries[0],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
