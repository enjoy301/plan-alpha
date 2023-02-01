import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class RemoteDatasource {
  String endpoint =
      "http://ec2-3-39-189-126.ap-northeast-2.compute.amazonaws.com:3000/";

  Future<dynamic> makeCalendar(DateTime dateTime) async {
    try {
      Response response = await Dio(BaseOptions(
        baseUrl: endpoint,
      )).post("v1/api/schedule", data: {
        'userId': 1,
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      });
    } catch (e) {
      print(e);
    }
    try {
      Response response = await Dio(BaseOptions(baseUrl: endpoint)).get(
          "v1/api/schedule?userId=1&date=" +
              DateFormat('yyyy-MM-dd').format(dateTime));
      return response.data;
    } catch (e) {}
  }

  Future<dynamic> getCalendar() async {
    try {
      Response response = await Dio(BaseOptions(baseUrl: endpoint))
          .get("v1/api/month/2023-01?userId=1");
      print(response.statusCode);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
