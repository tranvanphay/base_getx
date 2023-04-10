class LoginReq {
  String email;
  String password;

  LoginReq({
    required this.email,
    required this.password,
  });

  factory LoginReq.fromJson(Map<String, dynamic> json) =>
      _$LoginReqFromJson(json);
  Map<String, dynamic> toJson() => _$LoginReqToJson(this);
}

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) => LoginReq(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginReqToJson(LoginReq instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
