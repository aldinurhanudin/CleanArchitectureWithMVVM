
import 'package:analyzer/dart/element/type.dart';
import 'package:clean_architecture_mvvm/app/constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio  dio,{String baseUrl})= _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationsResponse>login();
}