class LoginRequest {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}

class ForgotPasswordRequest {
  String email;
  ForgotPasswordRequest(this.email);
}

class RegisterRequest {
  String countryMobileCode;
  String userName;
  String email;
  String password;
  // String profilePicture;
  String mobileNumber;
  RegisterRequest(this.email, this.password, this.countryMobileCode,
      this.mobileNumber, this.userName);
}
