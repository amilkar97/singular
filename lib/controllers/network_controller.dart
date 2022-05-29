
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
class NetworkController extends ChangeNotifier{
  bool connection = true;
  late StreamSubscription<InternetConnectionStatus> _connectivitySubscription;

  NetworkController(){
    checkConnectivity();
    _connectivitySubscription = InternetConnectionChecker().onStatusChange.listen(updateConnectivity);

  }

  Future<void> checkConnectivity() async {
    var result;
    try{
      result = await (InternetConnectionChecker().connectionStatus);
      if(result == InternetConnectionStatus.connected){
        connection = true;
        notifyListeners();
      }else{
        connection = false;
        notifyListeners();
      }
    }catch(error){
    }
    return updateConnectivity(result);
  }

  updateConnectivity(InternetConnectionStatus? result){
    if(result == InternetConnectionStatus.connected){
      connection = true;
      notifyListeners();
    }else{
      connection = false;
      notifyListeners();
    }
  }
}