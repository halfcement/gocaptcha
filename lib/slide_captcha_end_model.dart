import 'dart:convert';
SlideCaptchaEndModel slideCaptchaEndModelFromJson(String str) => SlideCaptchaEndModel.fromJson(json.decode(str));
String slideCaptchaEndModelToJson(SlideCaptchaEndModel data) => json.encode(data.toJson());
class SlideCaptchaEndModel {
  SlideCaptchaEndModel({
      String? captchaId, 
      String? captchaKey, 
      String? captchaValue,}){
    _captchaId = captchaId;
    _captchaKey = captchaKey;
    _captchaValue = captchaValue;
}

  SlideCaptchaEndModel.fromJson(dynamic json) {
    _captchaId = json['captchaId'];
    _captchaKey = json['captchaKey'];
    _captchaValue = json['captchaValue'];
  }
  String? _captchaId;
  String? _captchaKey;
  String? _captchaValue;

  String? get captchaId => _captchaId;
  String? get captchaKey => _captchaKey;
  String? get captchaValue => _captchaValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['captchaId'] = _captchaId;
    map['captchaKey'] = _captchaKey;
    map['captchaValue'] = _captchaValue;
    return map;
  }

}