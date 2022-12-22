import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static const _keyUsername = "username";
  static const _keyUserId = "userId";
  static const _keyUserPic = "userPic";
  static const _keyUserHeart = "userHeart";
  static const _keyUserEmail = "userEmail";

  static const _KeyValue = "setPoint";

  static Future setPoint({required int point}) async =>
      await preferences!.setInt(_KeyValue, point);

  static getPoint() => preferences!.getInt(_KeyValue);

  static Future removePoint() async => await preferences!.remove(_KeyValue);

  static SharedPreferences? preferences;
  static Future init() async =>
      preferences = await SharedPreferences.getInstance();

//! ID username
  static Future setUserId({required String id}) async =>
      await preferences!.setString(_keyUserId, id);
  static getUserId() => preferences!.getString(_keyUserId);

  static Future removeUserId() async => await preferences!.remove(_keyUserId);
  //! ID usermail
  static Future setUserEmail({required String id}) async =>
      await preferences!.setString(_keyUserEmail, id);
  static getUserEmail() => preferences!.getString(_keyUserEmail);
  static Future removeUserEmail() async =>
      await preferences!.remove(_keyUserEmail);
//! Username
  static Future setUsername({required String username}) async =>
      await preferences!.setString(_keyUsername, username);
  static getUsername() => preferences!.getString(_keyUsername);
  static Future removeUsername() async =>
      await preferences!.remove(_keyUsername);

//! Pic
  static Future setUserPic({required String pic}) async =>
      await preferences!.setString(_keyUserPic, pic);
  static getUserPic() => preferences!.getString(_keyUserPic);
  static Future removeUserPic() async => await preferences!.remove(_keyUserPic);

  //! Heart username
  static Future setHeart({required int heart}) async =>
      await preferences!.setInt(_keyUserHeart, heart);
  static getHeart() => preferences!.getInt(_keyUserHeart);
  static Future removeUserHeart() async =>
      await preferences!.remove(_keyUserHeart);

//! removeAll
  static Future removeAll() async {
    await removeUsername();
    await removeUserId();
    await removeUserPic();
    await removeUserHeart();
    await removePoint();
    UserPref.setUserId(id: "");
  }
}
