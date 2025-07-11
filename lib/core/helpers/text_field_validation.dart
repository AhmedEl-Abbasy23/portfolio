// ignore_for_file: constant_identifier_names

import 'package:portfolio/core/helpers/extension.dart';
import 'package:portfolio/core/storage/storage_helper.dart';

extension T on String {
  String get arabicNumberToEnglish {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    var input = this;
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    return input;
  }
}

enum TextFieldValidatorType {
  Email,
  Password,
  NewPassword,
  ConfirmPassword,
  ConfirmPasswordRegister,
  PhoneNumber,
  PhoneNumberOptional,
  EmailOrPhoneNumber,
  EmailNotRequire,
  NormalText,
  Code,
  Number,
  NumberWithLimitations,
  DisplayText,
  Optional,
  Name,
  CardNumber,
  Cvc,
}

String? validateEmailOrName(String value) {
  bool isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  bool isName = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]{3,50}$')
      .hasMatch(value); // Supports English & Arabic names

  if (value.isEmpty) {
    return StorageHelper.getLanguagePrefs() == 'en'
        ? 'You must enter a name or email'
        : 'يجب إدخال الاسم أو البريد الإلكتروني';
  } else if (!isEmail && !isName) {
    return StorageHelper.getLanguagePrefs() == 'en'
        ? 'Enter a valid email or name (at least 3 characters)'
        : 'أدخل بريدًا إلكترونيًا صالحًا أو اسمًا لا يقل عن 3 أحرف';
  }
  return null; // Input is valid
}

validation({
  required TextFieldValidatorType type,
  required String value,
  String? firstPasswordForConfirm,
}) {
  if (type == TextFieldValidatorType.PhoneNumber) {
    String phone = value.arabicNumberToEnglish.trim();
    'phone: $phone'.logIfDebug();
    if (phone.isEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Phone number required'
          : 'رقم الجوال مطلوب';
    } else if (RegExp(r'[^0-9+]').hasMatch(phone)) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Phone number should contain only digits'
          : 'يجب أن يحتوي رقم الجوال على أرقام ورمز "+" فقط';
    } else if (phone.length > 13) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Phone number must not exceed 13 digits'
          : 'يجب ألا يتجاوز رقم الجوال 13 رقمًا';
    } else if (!regExpPhone.hasMatch(phone) && phone.isNotEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Invalid phone number'
          : 'رقم الجوال غير صحيح';
    }
    return null;
  } else if (type == TextFieldValidatorType.PhoneNumberOptional) {
    // || RegExp(r'[^\d]+').hasMatch(value) -> Contains characters that are not numbers.
    String phone = value.arabicNumberToEnglish.trim();
    'phone: $phone'.logIfDebug();
    if (RegExp(r'[^0-9+]').hasMatch(phone)) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Phone number should contain only digits'
          : 'يجب أن يحتوي رقم الجوال على أرقام ورمز "+" فقط';
    } else if (phone.length > 13) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Phone number must not exceed 13 digits'
          : 'يجب ألا يتجاوز رقم الجوال 13 رقمًا';
    } else if (!regExpPhone.hasMatch(phone) && phone.isNotEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Invalid phone number'
          : 'رقم الجوال غير صحيح';
    }
    return null;
  } else if (type == TextFieldValidatorType.NumberWithLimitations) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (!regExpRealNumber.hasMatch(value)) {
      return "يجب أن يكون رقما صحيحا";
    } else if (int.parse(value.toString()) > 9) {
      return "يجب الا تزيد خصائص المنتج عن 9 خصائص";
    }
  } else if (type == TextFieldValidatorType.EmailOrPhoneNumber) {
    if (value.isEmpty) {
      return 'ادخل البريد الإلكتروني أو رقم الجوال';
    } else if (!regExpEmail.hasMatch(value)) {
      return 'البريد الإلكتروني غير صحيح';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.Email) {
    if (value.isEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'E-mail is required'
          : 'البريد الإلكتروني مطلوب';
    } else if (!regExpEmail.hasMatch(value)) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Email is incorrect'
          : 'البريد الإلكتروني غير صحيح';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.Password) {
    if (value.isEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'You must enter the password'
          : 'يجب ادخال كلمة المرور';
    } else if (value.length < 6) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'The password must be at least 8 characters long'
          : 'يجب ألا تقل كلمة المرور عن 8 أحرف';
    } else if (value.length > 25) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Password must be no more than 25 characters'
          : 'يجب ألا تزيد كلمة المرور عن 25 حرفًا';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.NewPassword) {
    if (value.isEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'You must enter the new password'
          : 'يجب إدخال كلمة المرور الجديدة';
    } else if (value.length < 8) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'The password must be at least 8 characters long'
          : 'يجب ألا تقل كلمة المرور عن 8 أحرف';
    } else if (value.length > 25) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Password must be no more than 25 characters'
          : 'يجب ألا تزيد كلمة المرور عن 25 حرفًا';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.ConfirmPassword) {
    if (value.isEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Please re-enter your new password'
          : 'يرجي إعادة إدخال كلمة المرور الجديدة';
    } else if (value != firstPasswordForConfirm) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'The password does not match'
          : 'كلمة المرور غير متطابقة';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.ConfirmPasswordRegister) {
    if (value.isEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Please re-enter your password'
          : 'يرجي إعادة إدخال كلمة المرور';
    } else if (value != firstPasswordForConfirm) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'The password does not match'
          : 'كلمة المرور غير متطابقة';
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.Code) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
  } else if (type == TextFieldValidatorType.Optional) {
    return null;
  } else if (type == TextFieldValidatorType.Number) {
    if (value.isEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'The field is required'
          : 'هذا الحقل مطلوب';
    } else if (!regExpNormalNumber.hasMatch(value)) {
      return "يجب أن يكون رقما صحيحا";
    }
    //
  } else if (type == TextFieldValidatorType.CardNumber) {
    if (value.isEmpty) {
      return 'يرجي إدخال رقم كارت الدفع الخاص بك';
    } else if (value.length != 16) {
      return 'يجب أن يتكوّن رقم الكارت من 16 رقم';
    }
  } else if (type == TextFieldValidatorType.Cvc) {
    if (value.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (value.length != 3) {
      return 'ادخل رقم CVC صحيح';
    }
  } else if (type == TextFieldValidatorType.NormalText) {
    if (value.isEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'this field is required'
          : 'هذا الحقل مطلوب';
    }
  } else if (type == TextFieldValidatorType.EmailNotRequire) {
    if (value.isEmpty) {
      return null;
    } else if (!regExpEmail.hasMatch(value)) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'Invalid email'
          : "البريد الإلكتروني غير صحيح";
    } else {
      return null;
    }
  } else if (type == TextFieldValidatorType.DisplayText) {
    return null;
  } else if (type == TextFieldValidatorType.Name) {
    if (value.isEmpty) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'This field is required'
          : 'هذا الحقل مطلوب';
    }
    if (!regExpName.hasMatch(value.trim().replaceAll('‎', ''))) {
      return StorageHelper.getLanguagePrefs() == 'en'
          ? 'It must not contain special characters'
          : 'لا يجب ان يحتوي علي حروف خاصة';
    }

    return null;
  }
}

RegExp regExpPhone = RegExp(
  r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{6,7})$',
  caseSensitive: false,
  multiLine: false,
);

RegExp regExpEmail = RegExp(
  r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))+$',
  caseSensitive: false,
  multiLine: false,
);

RegExp regExpName = RegExp(
  r"^[\p{L} ,.'-]*$",
  caseSensitive: false,
  unicode: true,
  dotAll: true,
  multiLine: false,
);
RegExp regExpNumber = RegExp(
  r"^(?:[0]9)?[0-9]{10}$",
  caseSensitive: false,
  unicode: true,
  dotAll: true,
  multiLine: false,
);
RegExp regExpRealNumber = RegExp(r'^[1-9]*$');
RegExp regExpNormalNumber = RegExp(r'^[0-9]*$');
