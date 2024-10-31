import 'package:flutter/material.dart';

class CheckInOutState extends StatefulWidget {
  final Widget child;

  const CheckInOutState({super.key, required this.child});

  @override
  _CheckInOutState createState() => _CheckInOutState();

  static _CheckInOutState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedCheckInOutState>()
        ?.data;
  }
}

class _CheckInOutState extends State<CheckInOutState> {
  bool isCheckedIn = false;

  void checkIn() {
    setState(() {
      isCheckedIn = true;
    });
  }

  void checkOut() {
    setState(() {
      isCheckedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedCheckInOutState(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedCheckInOutState extends InheritedWidget {
  final _CheckInOutState data;

  const _InheritedCheckInOutState({required this.data, required super.child});

  @override
  bool updateShouldNotify(_InheritedCheckInOutState oldWidget) {
    return true;
  }
}
