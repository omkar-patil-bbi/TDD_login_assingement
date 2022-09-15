import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/user_details.dart';
// import '../../domain/repositories/login_repository.dart';
import '../model/login_model.dart';

abstract class LoginLocalDataSource {
  // final SharedPreferences sharedPreferences;

  Future<String> getScreenNumber();
  Future setScreenNumber(String screenNumber);

  Future<UserDetails> getUserDetail();
  Future setUserDetails(LoginModel userDetails);

  Future<bool> login(String email, String pass);

  isRemember() {}

  setisRemember(bool value) {}
}

const SCREEN_NUMBER = 'SCREEN_NUMBER';
const USER_DETAIL = 'USER_DETAIL';
const BOOL_DATA = 'BOOL_DATA';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  late final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getScreenNumber() {
    print("get screen number call");

    String? data = sharedPreferences.getString(SCREEN_NUMBER);

    if (data != null) {
      return Future.value(data);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<LoginModel> getUserDetail() {
    print("get user detail call");
    String? data = sharedPreferences.getString(USER_DETAIL);

    if (data != null) {
      List<String> str = data
          .replaceAll("{", "")
          .replaceAll("}", "")
          .replaceAll("\"", "")
          .replaceAll("'", "")
          .split(",");
      Map<String, dynamic> result = {};
      for (int i = 0; i < str.length; i++) {
        List<String> s = str[i].split(":");
        result.putIfAbsent(s[0].trim(), () => s[1].trim());
      }
      return Future.value(LoginModel.fromJson(result));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> login(String email, String pass) async {
    print("login call");
    LoginModel? loginModel = await getUserDetail();
    if (loginModel.email == email && loginModel.pass == pass) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future setScreenNumber(String screenNumber) {
    print("set screen number call");
    return Future.value(
        sharedPreferences.setString(SCREEN_NUMBER, screenNumber));
  }

  @override
  Future setUserDetails(LoginModel loginModel) {
    print("set user detail call");
    final value = loginModel.toJson().toString();
    return Future.value(sharedPreferences.setString(USER_DETAIL, value));
  }

  @override
  Future<bool> isRemember() {
    print("get is Remember call");
    final isRememberData = sharedPreferences.getBool(BOOL_DATA);
    if (isRememberData != null) {
      return Future.value(true);
    } else {
      throw CacheException();
    }
  }

  @override
  Future setisRemember(bool value) {
    print("set is remember call");
    final setRememberData = sharedPreferences.setBool(BOOL_DATA, value);
    if (setRememberData != null) {
      return Future.value(setRememberData);
    } else {
      throw CacheException();
    }
  }
}
