import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/extensions/enums.dart';
import '../utils/models/notification_model/notification_model.dart';
import '../utils/models/user/base_user_model.dart';

class SharedPrefController {
  //SINGLETON DESIGN PATTERN

  static SharedPrefController? _instance;

  SharedPrefController._internal();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._internal();
  }

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  ///THIS IS METHOD FOR ADD DATA TO SharedPrefController

  Future<void> save({required BaseUserModel baseUser}) async{
    await _sharedPreferences.setBool(PrefKey.login.toString(), true);
    await _sharedPreferences.setBool(PrefKey.register.toString(), true);
    await _sharedPreferences.setString(PrefKey.name.toString(), baseUser.user!.name!);
    await _sharedPreferences.setString(PrefKey.phone.toString(), baseUser.user!.phone!);
    await _sharedPreferences.setString(PrefKey.avatarOriginal.toString(), baseUser.user!.avatarOriginal!);
    await _sharedPreferences.setString(PrefKey.saved.toString(), baseUser.user!.saved!);
    await _sharedPreferences.setString(PrefKey.token.toString(), 'Bearer ${baseUser.accessToken}');
  }

  Future<void> saveSessionInfo({required BaseUserModel baseUser}) async{
    await _sharedPreferences.setString(PrefKey.sessionInfo.toString(), baseUser.sessionInfo!);
  }

  ///THIS IS METHODS FOR GET DATA FROM SharedPrefController

  bool get loggedIn => _sharedPreferences.getBool(PrefKey.login.toString()) ?? false;
  bool get register => _sharedPreferences.getBool(PrefKey.register.toString()) ?? false;

  String get token => _sharedPreferences.getString(PrefKey.token.toString()) ?? '';
  String get sessionInfo => _sharedPreferences.getString(PrefKey.sessionInfo.toString()) ?? '';

  String get userName => _sharedPreferences.getString(PrefKey.name.toString()) ?? '';
  String get phone => _sharedPreferences.getString(PrefKey.phone.toString()) ?? '';
  String get avatarOriginal => _sharedPreferences.getString(PrefKey.avatarOriginal.toString()) ?? '';
  String get saved => _sharedPreferences.getString(PrefKey.saved.toString()) ?? '';

  //Function To Edit language
  Future<bool> changeLanguage({required String language}) async {
    return await _sharedPreferences.setString(PrefKey.lang.toString(), language);
  }

  //Function To Read language
  String get language =>
      _sharedPreferences.getString(PrefKey.lang.toString()) ?? 'ar';

  Future<bool> clear() async{
    return await _sharedPreferences.clear();
  }

  static const String messagesKey = 'messages';
  //Function To Get Messages
  Future<List<NotificationModel>> getMessages() async {
    final messagesJson = _sharedPreferences.getStringList(messagesKey) ?? [];
    return messagesJson.map((e) => NotificationModel.fromJson(json.decode(e))).toList();
  }
  //Function To Add Message
  Future<bool> addMessage(String title, String body, DateTime timeReceived) async {
    final messages = await getMessages();
    final message = NotificationModel(title, body, timeReceived.toIso8601String(), isRead: false);
    messages.add(message);
    final messagesJson = messages.map((e) => json.encode(e.toJson())).toList();
    return await _sharedPreferences.setStringList(messagesKey, messagesJson);
  }
  //Function To Mark Message As Read
  Future<void> markMessageAsRead(int index) async {
    final messages = await getMessages();
    if (index >= 0 && index < messages.length) {
      messages[index].isRead = true;
      final messagesJson = messages.map((e) => json.encode(e.toJson())).toList();
      await _sharedPreferences.setStringList(messagesKey, messagesJson);
    } else {
      throw Exception('Invalid index: $index');
    }
  }


}
