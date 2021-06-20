import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:namaste/api/user_api.dart';
import 'package:namaste/models/product.dart';
import 'package:namaste/models/user.dart';
import 'package:namaste/models/waste.dart';
import 'package:namaste/utils/flushbar_service.dart';

class UserProvider with ChangeNotifier {
  UserApi userApi = UserApi();
  UserData _userData = UserData();
  Utils utils = Utils();

  List<UserData> _findUser = [];
  List<ProductData> _userProducts = [];
  List<WasteData> _userWastes = [];

  UserData get userData => _userData;
  List<UserData> get findUser => [..._findUser];
  List<ProductData> get userProducts => _userProducts;
  List<WasteData> get userWastes => _userWastes;

  bool _isBusy = false;

  setBusy(bool busy) {
    _isBusy = busy;
    notifyListeners();
  }

  Future getUser({required String uid}) async {
    try {
      print(uid);
      Response response = await userApi.getUser(uid: uid);

      _userData = UserData.fromJson(response.data);
      return {
        "success": true,
      };
    } catch (e) {
      if (e == 404) {
        return {
          "success": false,
        };
      }
      throw e;
    }
  }

  Future findUserByPhone({required String phone}) async {
    try {
      Response response = await userApi.findUserByPhone(phone: phone);
      print(response.data);
      List<dynamic> data = response.data;
      _findUser = data.map((e) => UserData.fromJson(e)).toList();
      return {
        "success": true,
      };
    } catch (e) {
      utils.showBasicFlushBar(content: "An error occured please try again");
      if (e == 404) {
        return {
          "success": false,
        };
      }
      throw e;
    }
  }

  Future addUser({required UserData userData}) async {
    try {
      setBusy(true);
      Response response = await userApi.addUser(userData: userData);
      dynamic data = response.data['user'];
      _userData = UserData.fromJson(data);

      print(_userData.id!);

      setBusy(false);
    } catch (e) {
      setBusy(false);

      utils.showBasicFlushBar(content: "An error occured please try again");
      throw e;
    }
  }

  Future updateUser({required String id, required UserData userData}) async {
    try {
      setBusy(true);
      Response response = await userApi.updateUser(id: id, userData: userData);

      _userData = userData;
      notifyListeners();

      setBusy(false);
    } catch (e) {
      setBusy(false);

      utils.showBasicFlushBar(content: "An error occured please try again");
      throw e;
    }
  }

  Future makeAdmin({required String id}) async {
    try {
      setBusy(true);
      Response response = await userApi.makeAdmin(id: id);
      // dynamic data = response.data['user'];
      // _userData = UserData.fromJson(data);
      _userData.isAdmin=true;
notifyListeners();
      print(_userData.id!);
      print(_userData.isAdmin);

      setBusy(false);
    } catch (e) {
      setBusy(false);

      utils.showBasicFlushBar(content: "An error occured please try again");
      throw e;
    }
  }

  Future addPoints({required String id, required int points}) async {
    try {
      setBusy(true);
      Response response = await userApi.addPoints(id: id, points: points);
      dynamic data = response.data['user'];
      _userData = UserData.fromJson(data);
      notifyListeners();

      print(_userData.id!);

      setBusy(false);
    } catch (e) {
      setBusy(false);

      utils.showBasicFlushBar(content: "An error occured please try again");
      throw e;
    }
  }

  Future addWaste({required WasteData wasteData}) async {
    try {
      setBusy(true);
      Response response = await userApi.addWaste(wasteData: wasteData);

      _userWastes.add(wasteData);
      notifyListeners();

      setBusy(false);
    } catch (e) {
      setBusy(false);

      utils.showBasicFlushBar(content: "An error occured please try again");
      throw e;
    }
  }

  Future addProduct({required ProductData productData}) async {
    try {
      setBusy(true);
      Response response = await userApi.addProduct(productData: productData);
      _userProducts.add(productData);
      notifyListeners();

      setBusy(false);
    } catch (e) {
      setBusy(false);

      utils.showBasicFlushBar(content: "An error occured please try again");
      throw e;
    }
  }

  Future fetchUserWaste({required String id}) async {
    try {
      Response response = await userApi.fetchUserWaste(id: id);

      List<dynamic> data = response.data;

      _userWastes = data.map((e) => WasteData.fromJson(e)).toList();
    } catch (e) {
      utils.showBasicFlushBar(content: "An error occured please try again");
      throw e;
    }
  }

  Future fetchUserProduct({required String id}) async {
    try {
      Response response = await userApi.fetchUserProduct(id: id);

      List<dynamic> data = response.data;

      _userProducts = data.map((e) => ProductData.fromJson(e)).toList();
    } catch (e) {
      utils.showBasicFlushBar(content: "An error occured please try again");
      throw e;
    }
  }
}
