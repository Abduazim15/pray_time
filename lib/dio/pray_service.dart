
import 'package:dio/dio.dart';
import 'package:islam/models/ByMonthResponse.dart';

class PrayDioService {
  Dio dio = Dio();
  Future<List<ByMonthResponse>> getByMonth(int month) async {
    try {
      Response<List<dynamic>> response = await dio.get(
          "https://islomapi.uz/api/monthly?region=Toshkent&month=$month");
      return response.data!.map((json) => ByMonthResponse.fromJson(json)).toList();
    } catch (ex){
      throw ex;
    }
  }

}