import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'slide_captcha_model.dart';

//滑动图形验证码
class SlideCaptcha extends StatefulWidget {
  const SlideCaptcha({super.key, required this.getCaptcha, this.title, required this.onEnd});

  final String? title;

  //返回一个SlideCaptchaModel的异步方法
  final Future<SlideCaptchaModel> Function() getCaptcha;
  final Function(int) onEnd;

  @override
  State<SlideCaptcha> createState() => _SlideCaptchaState();
}

class _SlideCaptchaState extends State<SlideCaptcha> {
  var left = 0.0;
  SlideCaptchaModel? model;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    model = await widget.getCaptcha();
    setState(() {
      left = model?.displayX?.toDouble() ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return CupertinoActivityIndicator();
    } else {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    spacing: 8,
                    children: [
                      Text(widget.title ?? "请拖动滑块完成拼图", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      GestureDetector(onTap: () => Navigator.pop(context), child: Icon(CupertinoIcons.clear_circled)),
                      GestureDetector(onTap: () => getData(), child: Icon(CupertinoIcons.refresh_circled)),
                    ],
                  ),
                ),
                SizedBox(
                  width: model!.masterWidth?.toDouble() ?? 0,
                  child: Stack(
                    children: [
                      Image.memory(model!.masterImageBase64!,gaplessPlayback: true,),
                      Positioned(
                        top: model!.displayY?.toDouble() ?? 0,
                        left: left,
                        child: Image.memory(model!.thumbImageBase64!,gaplessPlayback: true,),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: model!.masterWidth?.toDouble() ?? 0,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(height: 50),
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(100),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Positioned(
                        left: left,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            left += details.delta.dx;
                            double maxX = (model!.masterWidth?.toDouble() ?? 0) - (model!.thumbWidth?.toDouble() ?? 0);
                            if (left < 0) {
                              left = 0;
                            }
                            if (left > maxX) {
                              left = maxX;
                            }
                            setState(() {});
                          },
                          onHorizontalDragEnd: (details) async {
                            widget.onEnd(left.toInt());
                          },
                          child: Container(
                            height: 30,
                            width: model!.thumbWidth?.toDouble() ?? 0,
                            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(50)),
                            child: Icon(CupertinoIcons.arrow_right, color: Colors.white, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
