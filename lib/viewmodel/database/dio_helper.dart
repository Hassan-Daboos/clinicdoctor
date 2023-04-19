
import 'package:dio/dio.dart';



//Dio Helper That's Connect and Talk to API.
class DioHelper {
  static late Dio dio;


  //Here The Initialize of Dio and Start Connect to API Using baseUrl.
  static init() {

    dio = Dio(BaseOptions(
      baseUrl:'http://tonymalak.pythonanywhere.com',
      receiveDataWhenStatusError: true,


    ));
  }

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response<dynamic>> getData(
      {required String url,  Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    return await dio.get(url, queryParameters: query);
  }


  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
  static Future<Response<dynamic>> postData({
    required String url,
    Map<String, dynamic>? query,
     dynamic data,
    String? token,
  }) async {
    dio.options.headers = {'Content-Type': 'application/json',};
    return await dio.post(url, queryParameters: query, data: data,);
  }



  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
    //String lang = 'en',
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
        // 'Authorization': token ,
        //'Content-Type': 'application/json',
      };
      final Response response = await dio.delete(
        url,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }

  }
}