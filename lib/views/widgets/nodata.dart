

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child:Lottie.asset('assets/nodata.json'),
          ),
          const SizedBox(height: 10,),
          const Flexible(child: Text('No hay datos'))
        ],
      ),
    );
  }
}
