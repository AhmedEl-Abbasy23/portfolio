class Constants {
  static String translationsPath = 'assets/translations';
  static String lang = 'ar';

  // STORAGE KEYS
  static const String kLanguage = 'kLanguage';
  static const String kIsDarkMode = 'kIsDarkMode';

//////////////
  // SCHEMES
  String locationUrl(String latitude, String longitude) =>
      "geo:$latitude,$longitude";

  static String webUrl(String url) => "https://$url";
  static String emailUrl(String email) => "mailto:$email";
  static const String whatsappMessage = "مرحبًا "; // Phone number.
  static String whatsappUrlAndroid(String whatsApp) {
    String phoneNumber = whatsApp;
    if (phoneNumber.startsWith('+966')) {
      phoneNumber = phoneNumber.replaceAll('+966', '');
      return "whatsapp://send?phone=+966$phoneNumber&text=$whatsappMessage";
    } else if (phoneNumber.startsWith('00966')) {
      phoneNumber = phoneNumber.replaceAll('00966', '');
      return "whatsapp://send?phone=+966$phoneNumber&text=$whatsappMessage";
    } else if (phoneNumber.startsWith('966')) {
      phoneNumber = phoneNumber.replaceAll('966', '');
      return "whatsapp://send?phone=+966$phoneNumber&text=$whatsappMessage";
    } else {
      return "whatsapp://send?phone=+966$phoneNumber&text=$whatsappMessage"; // Whatsapp android. +966 For Saudi only
    }
  }

  static String whatsappUrlIos(String whatsApp) =>
      "https://wa.me/$whatsApp?text=${Uri.tryParse(whatsappMessage)}"; // Whatsapp ios.
  static const String telScheme = 'tel';

  ///////////////////////
}
