import 'package:dio/dio.dart';
import 'package:imagine_bloc/Constants/key_and_screate.dart';

class ApiService {
  static BaseOptions options = BaseOptions(
    baseUrl: 'https://api.unsplash.com',
  );
  static Dio dio = Dio(options);

  static Future getHomeScreenImages() async {
    try {
      var response =
          await dio.get('/photos?client_id=${KeysAndSecrete.accessKey}');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print("Something went wrong ${response.data}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
  
  static Future getFeaturedImages() async {
    try {
      var response =
          await dio.get('/photos/random?client_id=${KeysAndSecrete.accessKey}');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print("Something went wrong ${response.data}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
