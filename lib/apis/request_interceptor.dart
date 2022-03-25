import 'dart:async';

import 'package:chopper/chopper.dart';

import '../strings.dart';

class CustomRequestInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    return applyHeader(request, 'authorization', 'Bearer ${AppString.apiKey}',
        override: false);
  }
}
