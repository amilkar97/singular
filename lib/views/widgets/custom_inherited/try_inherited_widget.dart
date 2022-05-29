


import 'package:flutter/material.dart';

class MyInheritedWidgetToTry extends InheritedWidget{

  final VoidCallback tryFunction;
  MyInheritedWidgetToTry({required super.child, required this.tryFunction});


  static MyInheritedWidgetToTry of(BuildContext context) => context.dependOnInheritedWidgetOfExactType()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

}