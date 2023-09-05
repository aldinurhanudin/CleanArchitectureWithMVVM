import 'package:clean_architecture_mvvm/data/network/failure.dart';
import 'package:flutter/material.dart';

enum DataSource{
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION
}

extension DataSourceExtension on DataSource{
  Failure getFailure(){
    switch(this){

      
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR, ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
       return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION);
        default:
        return Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN);
    }
}
}

class ResponseCode{
  static const int SUCCESS=200;
  static const int NO_CONTENT=201;
  static const int BAD_REQUEST=400;
  static const int FORBIDDEN=403;
  static const int UNAUTHORISED=401;
  static const int NOT_FOUND=404;
  static const int INTERNAL_SERVER_ERROR=500;


  static const int UNKNOWN=-1;
  static const int CONNECT_TIMEOUT=-2;
  static const int CANCEL=-3;
  static const int RECEIVE_TIMEOUT=-4;
  static const int SEND_TIMEOUT=-5;
  static const int CACHE_ERROR=-6;
  static const int NO_INTERNET_CONNECTION=-7;

}

class ResponseMessage{
  static const String SUCCESS="success";
  static const String NO_CONTENT="sucess with no content";
  static const String BAD_REQUEST="Bad request, try again later";
  static const String FORBIDDEN="forbiden request, try again later";
  static const String UNAUTHORISED="user is unauthorised, try again later";
  static const String NOT_FOUND="Url is not found, try again later";
  static const String INTERNAL_SERVER_ERROR="some thing went wrong, try again later";


  static const String UNKNOWN="some thing went wrong, try again later";
  static const String CONNECT_TIMEOUT="time out error, try again later";
  static const String CANCEL="request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT="time out error,try again later";
  static const String SEND_TIMEOUT="time out error, try again later";
  static const String CACHE_ERROR="Cache error, try again later";
  static const String NO_INTERNET_CONNECTION="Please check your internet connection";

}