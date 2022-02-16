// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ArticleApiService extends ArticleApiService {
  _$ArticleApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ArticleApiService;

  @override
  Future<Response<ResponseData>> getEverything(String query, [int page = 1]) {
    final $url = '/everything';
    final $params = <String, dynamic>{'domains': query, 'page': page};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ResponseData, ResponseData>($request);
  }

  @override
  Future<Response<ResponseData>> getHeadlines([String category = 'general']) {
    final $url = '/top-headlines';
    final $params = <String, dynamic>{'category': category};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ResponseData, ResponseData>($request);
  }
}
