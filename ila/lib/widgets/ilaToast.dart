import 'package:flutter/material.dart';
import 'package:ila/config.dart';

// More or less from: https://github.com/OpenbookOrg/openbook-app/

enum ToastType { info, warning, success, error }

class ILAToast extends StatefulWidget {
  final Widget child;

  ILAToast({this.child});

  @override
  ILAToastState createState() {
    return ILAToastState();
  }

  static ILAToastState of(BuildContext context) {
    final ILAToastState toastState =
    context.rootAncestorStateOfType(const TypeMatcher<ILAToastState>());
    toastState._setCurrentContext(context);
    return toastState;
  }
}

class ILAToastState extends State<ILAToast> with SingleTickerProviderStateMixin {

  static Color colorError = Colors.redAccent;
  static Color colorSuccess = Colors.greenAccent[700];
  static Color colorInfo = Colors.blue;
  static Color colorWarning = Colors.yellow[800];

  OverlayEntry _overlayEntry;
  BuildContext _currentContext;
  AnimationController controller;
  Animation<Offset> offset;
  bool _toastInProgress;
  bool _dismissInProgress;

  static const double TOAST_CONTAINER_HEIGHT = 75.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _toastInProgress = false;
    _dismissInProgress = false;

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 0.1))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return _ILAToast(
      child: widget.child,
    );
  }

  Future showToast(
      {@required ToastType toastType,
        String message,
        Widget child,
        Duration duration,
        VoidCallback onDismissed}) async {
    Color color = _getToastColor(toastType);

    if (_toastInProgress) return;
    _toastInProgress = true;
    this._overlayEntry = this._createOverlayEntryFromTop(
        color: color, message: message, onDismissed: onDismissed, child: child);
    final overlay = Overlay.of(_currentContext);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => overlay.insert(_overlayEntry));
    controller.forward();

    duration = duration ?? const Duration(seconds: Config.ToastDuration);
    _dismissToastAfterDelay(duration);
  }

  Color _getToastColor(ToastType type) {
    var color;

    switch (type) {
      case ToastType.error:
        color = colorError;
        break;
      case ToastType.info:
        color = colorInfo;
        break;
      case ToastType.success:
        color = colorSuccess;
        break;
      case ToastType.warning:
        color = colorWarning;
        break;
    }

    return color;
  }

  void _dismissToastAfterDelay(Duration duration) async {
    await new Future.delayed(duration);
    if (_toastInProgress && !_dismissInProgress) {
      _dismissToast();
    }
  }

  Future _dismissToast() async {
    await controller.reverse();
    if (this._overlayEntry != null) this._overlayEntry.remove();
    this._overlayEntry = null;
    _dismissInProgress = false;
    _toastInProgress = false;
  }

  OverlayEntry _createOverlayEntryFromTop(
      {@required Color color,
        String message,
        Widget child,
        VoidCallback onDismissed}) {
    return OverlayEntry(builder: (context) {
      final MediaQueryData existingMediaQuery = MediaQuery.of(context);
      // 44 is header height
      double paddingTop = existingMediaQuery.padding.top + 44;

      return Stack(children: [
        Positioned(
            left: 0,
            width: existingMediaQuery.size.width,
            child: GestureDetector(
              onTap: () {
                if (_dismissInProgress) return;
                _dismissInProgress = true;
                if (onDismissed != null) onDismissed();
                _dismissToast();
              },
              child: _buildToast(
                  paddingTop: paddingTop,
                  color: color,
                  message: message,
                  child: child),
            ))
      ]);
    });
  }

  Widget _buildToast(
      {@required double paddingTop,
        @required Color color,
        @required String message,
        Widget child}) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: paddingTop),
                      child: SlideTransition(
                        position: offset,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    child ??
                                        Flexible(
                                          child: Text(
                                            message,
                                            style:
                                            TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              )
            ],
            mainAxisSize: MainAxisSize.max,
          ),
        ],
      ),
    );
  }

  void _setCurrentContext(BuildContext context) {
    setState(() {
      _currentContext = context;
    });
  }
}

class _ILAToast extends InheritedWidget {
  _ILAToast({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_ILAToast old) {
    return true;
  }
}