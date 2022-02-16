import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../models/articles_model.dart';
import '../strings.dart';

part 'retrofit_api.g.dart';

@RestApi(baseUrl: AppString.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @GET('/everything')
  @Headers(<String, dynamic>{
    'Content-Type': "application/json",
    'x-api-key': AppString.apiKey
  })
  Future<ResponseData> getEverything(@Query('domains') String query,
      [@Query('page') int page = 1]);
  @GET('/everything?pageSize=4')
  @Headers(<String, dynamic>{
    'Content-Type': "application/json",
    'x-api-key': AppString.apiKey
  })
  Future<ResponseData> getSuggested(@Query('domains') String query,
      [@Query('page') int page = 1]);
}
