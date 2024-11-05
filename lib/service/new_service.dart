import 'package:dio/dio.dart';
import 'package:emmthaan/models/new_model.dart';

class prayarservece {
  static Dio dio = Dio();

  static getArticles() async {
    try {
      Response response = await dio.get("https://newsapi.org/v2/everything?q=tesla&from=2024-10-05&sortBy=publishedAt&apiKey=API_KEY");
      if (response.statusCode == 200) {
        print(response.data);
        return newmodel.fromJson(response.data);
      } else {
        print('error');
        return null;
      }
    } catch (r) {
      print('exception ');
      return null;
    }
  }
}