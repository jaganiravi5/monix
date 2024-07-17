import 'package:flutter/material.dart';

class Validation {
  static String? getEmailValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Enter valid email address";
    }
    // Check if the entered email has the right format
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Enter valid email address";
    }
    // Return null if the entered email is valid
    return null;
  }

  static String? getNameValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Name required";
    }

    // Return null if the entered email is valid
    return null;
  }

  static String? getFullNameValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Name required";
    } else if (value.length < 3) {
      return "Name should be minimum 3 character long";
    }

    // Return null if the entered email is valid
    return null;
  }

  static String? getideaValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Idea required";
    } else if (value.length < 5) {
      return "idea should be minimum 5 character long";
    }

    // Return null if the entered email is valid
    return null;
  }

  static String? getNationalIdValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "National id required";
    }

    // Return null if the entered email is valid
    return null;
  }

  static String? getRequiredValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Required";
    }

    // Return null if the entered email is valid
    return null;
  }

  static String? getFirstNameValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "First name required";
    }

    // Return null if the entered email is valid
    return null;
  }

  static String? getQtyValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Quantity required";
    }

    // Return null if the entered email is valid
    return null;
  }

  static String? getSizeValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Size required";
    }

    // Return null if the entered email is valid
    return null;
  }

  static String? getLastNameValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Last name required";
    }

    // Return null if the entered email is valid
    return null;
  }

  static String? getPriceValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Price required";
    }
    // Return null if the entered email is valid
    return null;
  }

  static String? getAmountValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Amount required";
    }
    // Return null if the entered email is valid
    return null;
  }

  static String? getContactValidation(String? value, BuildContext context) {
    if (value != null && value.trim().isNotEmpty && value.length < 10) {
      return "Enter valid contact number";
    }
    // Return null if the entered contact is valid
    return null;
  }

  static String? getContactReqValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Contact required";
    } else if (value.length < 10) {
      return "Enter valid contact";
    }
    // Return null if the entered contact is valid
    return null;
  }

  static String? getAddressValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Address required";
    }
    // Return null if the entered address is valid
    return null;
  }

  static String? getBusinessNameValidation(
      String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "Business name required";
    }
    // Return null if the entered address is valid
    return null;
  }

  static String? getTinValidation(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return "TIN required";
    } else if (value.length < 10) {
      return "TIN should be 10 character long";
    }
    // Return null if the entered address is valid
    return null;
  }

  static String? getTinValidationWithEmpty(
      String? value, BuildContext context) {
    if (value != null && value!.trim().isNotEmpty && value.length < 10) {
      return "TIN should be 10 character long";
    }
    // Return null if the entered address is valid
    return null;
  }

  static String? getLoginPasswordValidation(
      String? value, BuildContext context) {
    if (value!.isEmpty) {
      return "Enter valid password";
    }
    if (value.length < 6) {
      return "Password should be minimum 6 character long";
    }
    // if (value.length > 20) {
    //   return "Error";
    // }
    // if (!value.contains(RegExp(r'\d'))) {
    //   return "Error";
    // }
    return null;
  }

  static String? getConfirmPassValidations(
      String? value, String pass, BuildContext context) {
    if (value!.isEmpty) {
      return "Confirm password required";
    }
    if (value != pass) {
      return "Confirm password does not match with password";
    } else {
      return null;
    }
  }
}
