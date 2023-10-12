import 'dart:async';

import '../base/base_view_model.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs, LoginViewModelOutputs{

  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();
  @override
  void dispose() {
   _userNameStreamController.close();
   _passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }
  
  @override
  
  Sink get inputPassword => _passwordStreamController.sink;
  
  @override
  Sink get inputUserName => _userNameStreamController.sink;
  
  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }
  @override
  setPassword(String userName) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }
  
  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }
  @override
  
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password)=> _isPasswordValid(password));
  
  @override
  
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream.map((userName)=> _isUserNameValid(userName));
  //
  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }
  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }
  

}
abstract class LoginViewModelInputs{
  setUserName(String userName);
  setPassword(String userName);
  login();
  Sink get inputUserName;
  Sink get inputPassword;
}

abstract class LoginViewModelOutputs{
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
}