import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name:"status")
  int? Status;
  @JsonKey(name:"message")
  String? message;
}

@JsonSerializable()
class CustomerResponse{
  @JsonKey(name:"id")
  String? id;
  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"numOfNotifications")
  int? numOfNotifications;

  CustomerResponse(this.id,this.name, this.numOfNotifications);
  
  //from json
 factory CustomerResponse.fromjson(Map<String,dynamic> json)=>_$CustomerResponseFromJson(json);
//to json
 Map<String, dynamic> toJson() => _$CustomerResponseToJson(this); 

}

@JsonSerializable()
class ContactsResponse{
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"phone")
  String? phone;
  @JsonKey(name:"link")
  int? link;

  ContactsResponse(this.email, this.phone,this.link);
   //from json
 factory ContactsResponse.fromjson(Map<String,dynamic> json)=>_$ContactsResponseFromJson(json);
//to json
 Map<String, dynamic> toJson() => _$ContactsResponseToJson(this); 
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name:"customer")
  CustomerResponse? customer;
  @JsonKey(name:"contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);
  //from json
 factory AuthenticationResponse.fromjson(Map<String,dynamic> json)=>_$AuthenticationResponseFromJson(json);
//to json
 Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this); 
}

