class AppConstants {
  static const String appName = 'RailGo BD';
  static const String tagline = 'Bangladesh Railway Smart Travel Platform';
  static const String packageName = 'com.railgobd.app';
  static const String country = 'Bangladesh';
  static const String countryCode = 'BD';
  static const String railwayOperator = 'Bangladesh Railway';
  static const String currencySymbol = '৳';
  static const String currencyCode = 'BDT';
  static const String timezone = 'Asia/Dhaka';

  // Official Railway Data Sources
  static const String primaryDataSourceUrl = 'https://railway.gov.bd/';
  static const String eTicketingSourceUrl = 'https://eticket.railway.gov.bd/';

  // Storage Keys
  static const String keyLanguage = 'user_language';
  static const String keyIsDarkMode = 'is_dark_mode';
  static const String keyIsFirstTime = 'is_first_time';
  static const String keyAuthToken = 'auth_token';
  static const String keyUserData = 'user_data';

  // Verification Statuses
  static const String statusVerified = 'verified';
  static const String statusPending = 'pending_verification';
  static const String statusOutdated = 'outdated';
  static const String statusUnavailable = 'unavailable';

  // Train Classes
  static const List<String> trainClasses = [
    'Shovon',
    'Shovon Chair',
    'First Seat',
    'First Berth',
    'Snigdha',
    'AC Seat',
    'AC Berth',
  ];
}
