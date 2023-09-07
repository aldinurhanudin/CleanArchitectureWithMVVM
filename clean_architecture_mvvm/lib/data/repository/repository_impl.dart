import 'package:clean_architecture_mvvm/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_mvvm/data/mapper/mapper.dart';
import 'package:clean_architecture_mvvm/data/network/error_handler.dart';
import 'package:clean_architecture_mvvm/data/network/network_info.dart';
import 'package:clean_architecture_mvvm/domain/model/model.dart';
import 'package:clean_architecture_mvvm/data/request/request.dart';
import 'package:clean_architecture_mvvm/data/network/failure.dart';
import 'package:clean_architecture_mvvm/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) 
    {
      try{
        final response = await RemoteDataSource.login(loginRequest);

      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(response.toDomain());
      }else{

        return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,response.message?? ResponseMessage.DEFAULT));
      }
      }catch(error){
        return (left(ErrorHandler.handle(error).failure));
      }
      
    }else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  
}