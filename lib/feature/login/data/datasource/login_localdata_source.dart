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

class LoginRepositoryImpl implements LoginLocalDataSource {
  late final SharedPreferences sharedPreferences;

  LoginRepositoryImpl({required this.sharedPreferences});

  @override
  Future<String> getScreenNumber() {
    String? data = sharedPreferences.getString(SCREEN_NUMBER);

    if (data != null) {
      return Future.value(data);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<LoginModel> getUserDetail() {
    String? data = sharedPreferences.getString(USER_DETAIL);

    if (data != null) {
      return Future.value(LoginModel.fromJson(json.decode(data.toString())));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> login(String email, String pass) async {
    LoginModel? loginModel = await getUserDetail();
    if (loginModel.email == email && loginModel.pass == pass) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future setScreenNumber(String screenNumber) {
    return Future.value(
        sharedPreferences.setString(SCREEN_NUMBER, screenNumber));
  }

  @override
  Future setUserDetails(LoginModel loginModel) {
    final value = loginModel.toJson().toString();
    return Future.value(sharedPreferences.setString(USER_DETAIL, value));
  }

  @override
  Future<bool> isRemember() {
    final isRememberData = sharedPreferences.getBool(BOOL_DATA);
    if (isRememberData != null) {
      return Future.value(true);
    } else {
      throw CacheException();
    }
  }

  @override
  Future setisRemember(bool value) {
    final setRememberData = sharedPreferences.setBool(BOOL_DATA, value);
    if (setRememberData != null) {
      return Future.value(setRememberData);
    } else {
      throw CacheException();
    }
  }
}
