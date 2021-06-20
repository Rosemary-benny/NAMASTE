import 'package:dio/dio.dart';
import 'package:namaste/models/product.dart';
import 'package:namaste/models/user.dart';
import 'package:namaste/models/waste.dart';

class UserApi {
  final Dio dio;
  final String baseUrl = "https://namastebackend.eu-gb.cf.appdomain.cloud";

  UserApi()
      : dio = Dio(
          BaseOptions(
            // __HEROKU URL___
            // baseUrl: "https://namastebackend.herokuapp.com/api/user",

            // __IBM URL___
            baseUrl: "https://namastebackend.eu-gb.cf.appdomain.cloud/api/user",
          ),
        );

  Future<Response> addUser({
    required UserData userData,
  }) async {
    Map data = userData.toJson();
    data.remove("_id");
    try {
      print("add user called");
      Response response = await dio.post('/addProfile', data: data);
      print("add user success");
      print(response);
      return response;
    } on DioError catch (e) {
      print(e);
      throw e;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> updateUser({
    required String id,
    required UserData userData,
  }) async {
    Map data = userData.toJson();
    data.remove('_id');
    try {
      print("update user called");
      print(userData);
      Response response = await dio.post('/updateProfile/$id', data: data);
      print("update user success");
      print(response);
      return response;
    } on DioError catch (e) {
      print(e);
      throw e;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future getUser({
    required String uid,
  }) async {
    try {
      print("get user called");
      Response response = await dio.get('/byId/$uid');
      print("got user");
      return response;
    } on DioError catch (e) {
      print(e.message);
      if (e.response == null) {
        throw e;
      } else if (e.response!.statusCode == 404) {
        throw 404;
      } else {
        throw 500;
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future findUserByPhone({
    required String phone,
  }) async {
    try {
      print("get user called");
      Response response = await dio.get('/byPhone/$phone');
      print("got user");
      return response;
    } on DioError catch (e) {
      print(e.message);
      if (e.response == null) {
        throw e;
      } else if (e.response!.statusCode == 404) {
        throw 404;
      } else {
        throw 500;
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> makeAdmin({
    required String id,
  }) async {
    try {
      print("add admin called");
      Response response = await dio.post('/makeAdmin/$id');
      print("add admin success");
      return response;
    } on DioError catch (e) {
      print(e);
      throw e;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> addPoints({required String id, required int points}) async {
    try {
      print("add points called");
      Response response = await dio.post('/addPoints/$id/$points');
      print("add points success");
      return response;
    } on DioError catch (e) {
      print(e);
      throw e;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> addWaste({required WasteData wasteData}) async {
    Map data = wasteData.toJson();
    data.remove("_id");
    try {
      print("add wasste called");
      Response response = await dio.post('/addWaste', data: data);
      print("add waste success");
      return response;
    } on DioError catch (e) {
      print(e);
      throw e;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> addProduct({required ProductData productData}) async {
    Map data = productData.toJson();
    data.remove("_id");
    try {
      print("add product called");
      Response response = await dio.post('/addProduct', data: data);
      print("add product success");
      return response;
    } on DioError catch (e) {
      print(e);
      throw e;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> fetchUserWaste({
    required String id,
  }) async {
    try {
      print("fetch waste called");
      Response response = await dio.get(
        '/wasteByUser/$id',
      );
      print("wastes fetched successfully");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> fetchUserProduct({
    required String id,
  }) async {
    try {
      print("fetch products called");
      Response response = await dio.get(
        '/productByUser/$id',
      );
      print("product fetched successfully");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
