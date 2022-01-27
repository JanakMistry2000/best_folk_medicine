import 'package:chopper/chopper.dart';

import '../flavor_config.dart';
import '../models/articles_model.dart';
import '../models/converter.dart';
import 'request_interceptor.dart';
import 'response_interceptor.dart';

part 'api_services.chopper.dart';

@ChopperApi()
abstract class ArticleApiService extends ChopperService {
  @Get(path: '/everything')
  Future<Response<ResponseData>> getEverything(@Query('domains') String query,
      [@Query('page') int page = 1]);

  @Get(path: '/top-headlines')
  Future<Response<ResponseData>> getHeadlines(
      [@Query('category') String category = 'general']);

  static ArticleApiService create() {
    final client = ChopperClient(
      baseUrl: FlavorConfig.instance.baseUrl,
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
        const HeadersInterceptor({
          'Content-Type': 'Application/Json',
        }),
        CurlInterceptor(),
        CustomRequestInterceptor(),
        CustomResponseInterceptor()
      ],
    );
    return _$ArticleApiService(client);
  }
}
