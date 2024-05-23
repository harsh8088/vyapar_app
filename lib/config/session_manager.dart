import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  late FlutterSecureStorage storage;

  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal() {
    // initialization logic
    storage = const FlutterSecureStorage();
  }

  /// LoginUser
  Future<void> setLoginUser(String value) async {
    await storage.write(key: "LoginUser", value: value);
  }

  //LoginUser
  Future<dynamic> getLoginUser() async {
    return await storage.read(key: "LoginUser");
  }

  Future<void> setInternalNotes(String key, String value) async {
    storage.write(key: key, value: value);
  }

  Future<dynamic> getInternalNotes(String key) async {
    return await storage.read(key: key);
  }

  Future<void> setProgressNotes(String key, String value) async {
    storage.write(key: key, value: value);
  }

  Future<dynamic> getProgressNotes(String key) async {
    return await storage.read(key: key);
  }

  Future<void> setPinToken(String value) async {
    await storage.write(key: "PIN_TOKEN", value: value);
  }

  Future<dynamic> getPinToken() async {
    return await storage.read(key: "PIN_TOKEN");
  }

  Future<void> setOtpToken(String value) async {
    await storage.write(key: "OTP_TOKEN", value: value);
  }

  Future<dynamic> getOtpToken() async {
    return await storage.read(key: "OTP_TOKEN");
  }

  Future<void> setToken(String value) async {
    await storage.write(key: "TOKEN", value: value);
  }

  Future<dynamic> getToken() async {
    return await storage.read(key: "TOKEN");
  }

  Future<void> setLOGIN(String value) async {
    await storage.write(key: "LOGIN", value: value);
  }

  Future<dynamic> isLogin() async {
    return await storage.read(key: "LOGIN");
  }

  Future<void> setMobile(String value) async {
    await storage.write(key: "MOBILE", value: value);
  }

  Future<dynamic> getMobile() async {
    return await storage.read(key: "MOBILE");
  }

  Future<void> setFirstName(String value) async {
    await storage.write(key: "FIRST_NAME", value: value);
  }

  Future<dynamic> getFirstName() async {
    return await storage.read(key: "FIRST_NAME");
  }

  Future<void> setLastName(String value) async {
    await storage.write(key: "LAST_NAME", value: value);
  }

  Future<dynamic> getLastName() async {
    return await storage.read(key: "LAST_NAME");
  }

  //role id
  Future<void> setResourceID(String value) async {
    await storage.write(key: "RESOURCE_ID", value: value);
  }

  //role id
  Future<dynamic> getResourceID() async {
    return await storage.read(key: "RESOURCE_ID");
  }

  //hospital id
  Future<void> setHospitalID(String value) async {
    await storage.write(key: "HOSPITAL_ID", value: value);
  }

  //hospital id
  Future<dynamic> getHospitalID() async {
    return await storage.read(key: "HOSPITAL_ID");
  }

  //email id
  Future<void> setEmail(String value) async {
    await storage.write(key: "EMAIL_ID", value: value);
  }

  //email id
  Future<dynamic> getEmail() async {
    return await storage.read(key: "EMAIL_ID");
  }

  //is upload-attendance-document
  Future<void> setAttendance(String value) async {
    await storage.write(key: value, value: value);
  }

  //is upload-attendance-document
  Future<dynamic> getAttendance(String value) async {
    return await storage.read(key: value);
  }

  //provider lat
  Future<void> setProviderLat(double value) async {
    await storage.write(key: "PROVIDER_LATITUDE", value: '$value');
  }

  //provider lat
  Future<dynamic> getProviderLat() async {
    return await storage.read(key: "PROVIDER_LATITUDE");
  }

  //provider longitude
  Future<void> setProviderLong(double value) async {
    await storage.write(key: "PROVIDER_LONGITUDE", value: '$value');
  }

  //provider lat
  Future<dynamic> getFCMToken() async {
    return await storage.read(key: "FCM_TOKEN");
  }

  //provider longitude
  Future<void> setFCMToken(String value) async {
    await storage.write(key: "FCM_TOKEN", value: '$value');
  }

  //provider longitude
  Future<dynamic> getProviderLong() async {
    return await storage.read(key: "PROVIDER_LONGITUDE");
  }

  Future<dynamic> clearAll() async {
    await storage.deleteAll();
  }

  Future<dynamic> getAllKeys() async {
    return await storage.readAll();
  }
}
