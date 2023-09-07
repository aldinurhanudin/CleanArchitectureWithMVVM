import 'package:dio/dio.dart';

import '../../app/constant.dart';
const String APPLICATION_JSON  = "application/json";
const String CONTENT_TYPE  = "content-type";
const String ACCEPT  = "accept";
const String AUTHORIZATION  = "authorization";
const String DEFAULT_LANGUAGE  = "language";
class DioFactory{
  Future<Dio> getDio()async{
    Dio dio = Dio();
Duration _timeOut = Duration(seconds: 60*1000);
    Map<String,String> headers = {
      CONTENT_TYPE:APPLICATION_JSON,
      ACCEPT:APPLICATION_JSON,
      AUTHORIZATION: Constant.token,
      DEFAULT_LANGUAGE: "en"
    };
    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout:_timeOut,
      receiveTimeout: _timeOut,
      headers: headers
    );
    return dio;
  }
}