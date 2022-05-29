

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:singular/views/widgets/custom_inherited/try_inherited_widget.dart';

class NoInternet extends StatelessWidget {
  final BuildContext context;
  const NoInternet({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child:Lottie.asset('assets/nointernet.json'),),
          const SizedBox(height: 10,),
          const Flexible(child: Text('No hay internet')),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            MyInheritedWidgetToTry.of(context).tryFunction();
          }, child: const Text('Reintentar'))
        ],
      ),
    );
  }
}
