import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "first_name")
  String? firstName;
  CustomerResponse(this.id, this.firstName);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phone")
  int? phone;
  @JsonKey(name: "email")
  String? email;
  ContactsResponse(this.email, this.name, this.phone);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;
  AuthenticationResponse(this.customer, this.contacts);

  // # from json "to dart class/object"

  // # to json
}
