import 'package:shared_preferences/shared_preferences.dart';
const kRememberMe = "kRememberMe";
const kLanguageCode = "kLanguageCode";
const kDeviceToken = "kDeviceToken";
const kCheckLanguage = "kCheckLanguage";

class SpController {
static const String kBearerToken = 'kBearerToken';
  //* save Bearer Token
  Future<void> saveBearerToken(token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(kBearerToken, token.toString());
  }

  getBearerToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(kBearerToken);
  }

  //device Token
  Future<void> saveDeviceToken(token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(kDeviceToken, token.toString());
  }

  getDeviceToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(kDeviceToken);
  }

  //* Remember me status
  Future<void> saveRememberMe(value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(kRememberMe, value);
  }

  getRememberMe() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(kRememberMe);
  }

  //* save Name
  // Future<void> saveName(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(kName, value);
  // }

  // getName() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(kName);
  // }

  // //* save Email
  // Future<void> saveEmail(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(kEmail, value);
  // }

  // getEmail() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(kEmail);
  // }

  // //* save Phone
  // Future<void> savePhone(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(kPhone, value);
  // }

  // getPhone() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(kPhone);
  // }

  // //* save Address
  // Future<void> saveAddress(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(kAddress, value);
  // }

  // getAddress() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(kAddress);
  // }

  // //* save City
  // Future<void> saveCity(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(kCity, value);
  // }

  // getCity() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(kCity);
  // }

  // //* save post code
  // Future<void> savePostCode(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(kPostCode, value);
  // }

  // getPostCode() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(kPostCode);
  // }

  // //* save Is Push Notification
  // Future<void> saveIsPushNotification(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setBool(kIsPushNotification, value);
  // }

  // getIsPushNotification() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getBool(kIsPushNotification);
  // }

  // //* save Is Email Notification
  // Future<void> saveIsEmailNotification(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setBool(kIsEmailNotification, value);
  // }

  // getIsEmailNotification() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getBool(kIsEmailNotification);
  // }

  // //* save Image
  // Future<void> saveImage(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(kImage, value);
  // }

  // getImage() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(kImage);
  // }

  // //device Token
  // Future<void> saveDeviceToken(token) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(kDeviceToken, token.toString());
  // }

  // getDeviceToken() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(kDeviceToken);
  // }

  // //* recent card search list
  // Future<void> saveRecentCardSearchList(recentCardSearchList) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var data = recentCardSearchList;
  //   String encodeData = json.encode(data);
  //   await preferences.setString(kRecentCardSearchList, encodeData);
  // }

  // Future<dynamic> getRecentCardSearchList() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? data = preferences.getString(kRecentCardSearchList);
  //   var recentCardSearchList = (data == null) ? [] : json.decode(data);
  //   return recentCardSearchList;
  // }

  // //* recent Favorite card search list
  // Future<void> saveRecentFavoriteCardSearchList(recentFavoriteSearchList) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var data = recentFavoriteSearchList;
  //   String encodeData = json.encode(data);
  //   await preferences.setString(kRecentFavoriteCardSearchList, encodeData);
  // }

  // Future<dynamic> getRecentFavoriteCardSearchList() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? data = preferences.getString(kRecentFavoriteCardSearchList);
  //   var recentFavoriteSearchList = (data == null) ? [] : json.decode(data);
  //   return recentFavoriteSearchList;
  // }

  // //* recent shop search list
  // Future<void> saveRecentShopSearchList(recentFavoriteSearchList) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var data = recentFavoriteSearchList;
  //   String encodeData = json.encode(data);
  //   await preferences.setString(kRecentShopSearchList, encodeData);
  // }

  // Future<dynamic> getRecentShopSearchList() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? data = preferences.getString(kRecentShopSearchList);
  //   var recentFavoriteSearchList = (data == null) ? [] : json.decode(data);
  //   return recentFavoriteSearchList;
  // }

  // //* save Is Email Notification
  // Future<void> saveSocialSite(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setString(kSocialSite, value);
  // }

  // getSocialSite() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString(kSocialSite);
  // }

  Future<void> saveLanguageCheck(value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(kCheckLanguage, value);
  }

  getLanguageCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(kCheckLanguage);
  }

  //* save LanguageCode
  Future<void> saveLanguageCode(value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(kLanguageCode, value);
  }

  getLanguageCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(kLanguageCode);
  }

  // Future<void> saveIntro(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setBool(kIntro, value);
  // }

  // getIntro() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getBool(kIntro);
  // }

  // Future<void> saveIntroTutorial(value) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setBool(kIntroTutorial, value);
  // }

  // Future getIntroTutorial() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getBool(kIntroTutorial);
  // }

  //* on logout
  onLogout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(kBearerToken);
    preferences.remove(kRememberMe);
    // preferences.remove(kName);
    // preferences.remove(kEmail);
    // preferences.remove(kImage);
    // preferences.remove(kPhone);
    // preferences.remove(kAddress);
    // preferences.remove(kCity);
    // preferences.remove(kPostCode);
    // preferences.remove(kIsPushNotification);
    // preferences.remove(kIsEmailNotification);
    // preferences.remove(kRecentCardSearchList);
    // preferences.remove(kRecentFavoriteCardSearchList);
    // preferences.remove(kRecentShopSearchList);
    // preferences.remove(kSocialSite);
  }

  removeLangCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(kCheckLanguage);
    preferences.remove(kLanguageCode);
  }
}
