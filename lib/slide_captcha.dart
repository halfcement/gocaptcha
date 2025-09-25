import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'slide_captcha_model.dart';

//滑动图形验证码
class SlideCaptcha extends StatefulWidget {
  const SlideCaptcha({super.key, required this.model, this.title, required this.onEnd,  this.onClose,  this.onRefresh,});
  final SlideCaptchaModel model;
  final String? title;
  final Function(int) onEnd;
  final GestureTapCallback? onClose;
  final GestureTapCallback? onRefresh;

  @override
  State<SlideCaptcha> createState() => _SlideCaptchaState();
}

class _SlideCaptchaState extends State<SlideCaptcha> {
  var left = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    left = widget.model.displayX!.toDouble();
  }
  @override
  Widget build(BuildContext context) {
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
                    Text(widget.title??"请拖动滑块完成拼图", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    GestureDetector(onTap: widget.onClose, child: Icon(CupertinoIcons.clear_circled)),
                    GestureDetector(onTap: widget.onRefresh, child: Icon(CupertinoIcons.refresh_circled)),
                  ],
                ),
              ),
              SizedBox(
                width: widget.model.masterWidth!.toDouble(),
                child: Stack(
                  children: [
                    Image.memory(widget.model.masterImageBase64!),
                    Positioned(
                      top: widget.model.displayY!.toDouble(),
                      left: left,
                      child: Image.memory(widget.model.thumbImageBase64!),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: widget.model.masterWidth!.toDouble(),
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
                          double maxX =
                              (widget.model.masterWidth?.toDouble() ?? 0) -
                                  (widget.model.thumbWidth?.toDouble() ?? 0);
                          if (left < 0) {
                            left = 0;
                          }
                          if (left > maxX) {
                            left = maxX;
                          }
                          setState(() {

                          });
                        },
                        onHorizontalDragEnd: (details) async{
                          widget.onEnd(left.toInt());
                        },
                        child: Container(
                          height: 30,
                          width: widget.model.thumbWidth?.toDouble() ?? 0,
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
