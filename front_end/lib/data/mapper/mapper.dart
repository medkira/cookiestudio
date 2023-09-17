import 'package:cookiestudio/app/constants.dart';
import 'package:cookiestudio/app/extentions.dart';
import '../../domain/model/models.dart';
import '../response/responses.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.firstName.orEmpty() ?? Constants.empty,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.name.orEmpty() ?? Constants.empty,
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}
