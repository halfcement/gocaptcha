# gocaptcha

flutter实现gocaptcha图形验证码:https://github.com/wenlng/go-captcha

## Getting Started

### 安装依赖: flutter pub add gocaptcha
### 使用:
import 'package:gocaptcha/gocaptcha.dart';
```
showDialog(
    context: context,
    builder: (_) => SlideCaptcha(
    model: SlideCaptchaModel.fromJson(data),
    onEnd: (position) {
        ///TODO 获取到位置后验证 #Verify after obtaining the location
        },
    ),
);
```  
```flutter pub publish --server=https://pub.dartlang.org ```  
支持的类型:  
- 滑动验证  ✅  
- 点击验证  ×  
- 随机字符验证  ×  
- 随机图片验证  ×

