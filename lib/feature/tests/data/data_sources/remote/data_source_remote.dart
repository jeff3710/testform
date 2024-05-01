import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';
import '../../models/base/base.dart';
import '../../models/base_config_model.dart';

part 'data_source_remote.g.dart';

@RestApi(baseUrl: configsAPIBaseURL)
abstract class BaseConfigApiService {
  factory BaseConfigApiService(Dio dio) = _BaseConfigApiService;

  @POST('/baseconfig')
  Future<HttpResponse<BaseConfigModel>> getBaseConfig(
      @Body() CommonInterface commonInterface);
}
