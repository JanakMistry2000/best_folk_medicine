import 'dart:async';

import 'package:best_folk_medicine/strings.dart';
import 'package:chopper/chopper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomResponseInterceptor extends ResponseInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) {
    if (response.statusCode == 401) {
      Fluttertoast.showToast(
          msg: AppString.error401, toastLength: Toast.LENGTH_SHORT);
      return response;
    } else if (response.statusCode == 404) {
      Fluttertoast.showToast(
          msg: AppString.error404, toastLength: Toast.LENGTH_SHORT);
      return response;
    } else if (response.statusCode == 429) {
      Fluttertoast.showToast(
          msg: AppString.error429, toastLength: Toast.LENGTH_SHORT);
      return response;
    } else if (!response.isSuccessful) {
      Fluttertoast.showToast(
          msg: response.error.toString(), toastLength: Toast.LENGTH_LONG);
      return response;
    } else {
      return response;
    }
  }
}
