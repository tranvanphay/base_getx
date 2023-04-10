import 'package:base_getx/constant/constant.dart';
import 'package:base_getx/model/req/login_req.dart';
import 'package:base_getx/model/res/login_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/login')
  Future<LoginRes> login(@Body() LoginReq req);
}
