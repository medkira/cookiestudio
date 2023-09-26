class EmptyValidator {
  static String? isEmpty(String? value, String hintText) {
    if (value == null || value.isEmpty) {
      return "$hintText is required";
    }
    return null;
  }
}

class Appvalidator {
  static String? isEmpty(String? value, String hintText) {
    if (value == null || value.isEmpty) {
      return "$hintText is required";
    }
    return null;
  }

  static registerPasswordValidation(String value, String hintText) {
    String? isEmptyError = isEmpty(value, hintText);
    if (isEmptyError != null) {
      return isEmptyError;
    }
    if (value.length < 6) {
      return "Minimum password length is 6.";
    } else if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return "Password should contain at least one letter";
    } else if (!RegExp(r'\d').hasMatch(value)) {
      return "Password should contain at least one digit";
    }

    return null;
  }

  static registerEmailValidation(String value, String hintText) {
    String? isEmptyError = isEmpty(value, hintText);
    if (isEmptyError != null) {
      return isEmptyError;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return "Enter Correct Email Address";
    }
  }
}
