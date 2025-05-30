import 'package:dio/dio.dart';
import 'package:my_test/core/model/login_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(
    )
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

 static ApiService init() {
  final dio = Dio();
  dio.options.baseUrl = 'https://turf.shanmarasolutions.com';
  dio.interceptors.add(LogInterceptor(responseBody: true)); // Log full response
  return ApiService(dio);
}



 @POST('/api/User/Login')
  Future<LoginResponse> logins(@Body() LoginRequest loginRequest);
  
}