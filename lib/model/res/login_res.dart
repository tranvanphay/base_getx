class LoginRes {
  Data? data;
  String? message;

  LoginRes({this.data, this.message});

  factory LoginRes.fromJson(Map<String, dynamic> json) =>
      _$LoginResFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResToJson(this);
}

class Data {
  int? expiresIn;
  String? token;
  bool? passChange;

  Data({this.expiresIn, this.token, this.passChange});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

LoginRes _$LoginResFromJson(Map<String, dynamic> json) => LoginRes(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LoginResToJson(LoginRes instance) => <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      expiresIn: json['expiresIn'] as int?,
      token: json['token'] as String?,
      passChange: json['passChange'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'expiresIn': instance.expiresIn,
      'token': instance.token,
      'passChange': instance.passChange,
    };
