import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// part 'apis_helper.g.dart';
// @RestApi(baseUrl:"https://newsapi.org/")
//
// abstract class ApisHelper{
//   factory ApisHelper(Dio dio, {String baseUrl}) = _ApisHelper;
//   @GET("v2/top-headlines")
//   Future<dynamic>getNews(@Queries() Map<String, dynamic> queries);
class DioHelper{
 static late Dio dio;
 static init(){
   dio=Dio(
     BaseOptions(
       baseUrl: "https://newsapi.org/",
       receiveDataWhenStatusError: true,
     )
   );
 }
 Future<Response>getNews(Map<String, dynamic> queries)async{
   return await dio.get("v2/top-headlines",queryParameters: queries);
 }

 Future<Response>getSearsh(Map<String, dynamic> queries)async{
   return await dio.get("v2/everything",queryParameters: queries);
 }

}

