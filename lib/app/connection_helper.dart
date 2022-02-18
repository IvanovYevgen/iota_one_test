import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:connectivity/connectivity.dart';
import 'dart:io';
import 'package:iota_one_test/presentation/common/app_strings.dart';

class ConnectionHelper {
  static Future<bool> isPlatformConnected() async {
    bool isConnected;
    if (kIsWeb) {
      isConnected = await isWebConnected();
      if (kDebugMode) {
        print(AppStrings.web);
      }
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        isConnected = await isMobileConnected();
        if (kDebugMode) {
          print(AppStrings.mobile);
        }
      } else if (Platform.isMacOS) {
        isConnected = await isConnectedDesktop();
        if (kDebugMode) {
          print(AppStrings.desktop);
        }
      }
      isConnected = false;
    }
    return isConnected;
  }

  static Future<bool> isConnectedDesktop() async {
    bool isConnected;
    if (kDebugMode) {
      print(AppStrings.macos);
    }
    final response = await InternetAddress.lookup(AppStrings.randomSite);
    if (response.isNotEmpty) {
      isConnected = true;
    } else {
      if (kDebugMode) {
        print(AppStrings.macosIsNotConnected);
      }
      isConnected = false;
    }
    return isConnected;
  }
}

Future<bool> isWebConnected() async {
  bool hasWebConnection;
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.wifi) {
    if (kDebugMode) {
      print('$connectivityResult');
    }
    hasWebConnection = true;
  } else {
    hasWebConnection = false;
  }
  return hasWebConnection;
}

Future<bool> isMobileConnected() async {
  bool isMobileConnected;
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile) {
    if (kDebugMode) {
      print('$connectivityResult');
    }
    isMobileConnected = true;
    if (kDebugMode) {
      print(isMobileConnected);
    }
  } else {
    isMobileConnected = false;
  }
  return isMobileConnected;
}
