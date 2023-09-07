import 'package:clean_architecture_mvvm/data/network/app_api.dart';
import 'package:clean_architecture_mvvm/data/request/request.dart';
import 'package:clean_architecture_mvvm/data/responses/responses.dart';
import 'package:clean_architecture_mvvm/domain/model/model.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse>login(LoginRequest loginRequest);
}

class RemoteDataSourceImplenter implements RemoteDataSource{
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplenter(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest)async{
    return await _appServiceClient.login(loginRequest.email,loginRequest.password, loginRequest.imei, loginRequest.deviceType);

  }
}