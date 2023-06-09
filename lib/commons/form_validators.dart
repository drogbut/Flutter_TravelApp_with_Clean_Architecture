import 'package:email_validator/email_validator.dart';

class PasswordValidation {
  static final _upperCaseExpression = RegExp(r'[A-Z]');
  static final _lowerCaseExpression = RegExp(r'[a-z]');
  static final _numberExpression = RegExp(r'[0-9]');
  static final _specialCharacterExpression = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

  static String? isValid(String password, String appLocalizations) {
    if (password.length < 8) {
      return 'labelPwdLength';
    }
    if (!_upperCaseExpression.hasMatch(password)) {
      return 'appLocalizations.labelPwdUpperCase';
    }
    if (!_lowerCaseExpression.hasMatch(password)) {
      return 'appLocalizations.labelPwdLowerCase';
    }
    if (!_numberExpression.hasMatch(password)) {
      return 'appLocalizations.labelPwdContainNumb';
    }
    if (!_specialCharacterExpression.hasMatch(password)) {
      return 'appLocalizations.labelPwdSpecialCharacter';
    }
    return null;
  }
}

class RequiredFieldValidator {
  static String? isValid(String? value, String appLocalizations) {
    if (value == null || value.isEmpty) {
      return 'appLocalizations.labelRequiredFieldEmptyWarning';
    }
    return null;
  }
}

class PhoneNumberValidator {
  static final _phoneRegex = RegExp(r'^\+?\d{10,14}$');

  static String? isValid(String? value, String appLocalizations) {
    if (value == null || value.isEmpty) {
      return 'appLocalizations.labelRequiredFieldEmptyWarning';
    }

    return !_phoneRegex.hasMatch(value)
        ? 'appLocalizations.labelInvalidPhoneNumber'
        : null;
  }
}

class EmailAddressValidator {
  static String? isValid(String? value, String appLocalizations) {
    if (value == null || !EmailValidator.validate(value)) {
      return 'appLocalizations.labelValidEmailValidation';
    }
    return null;
  }
}
