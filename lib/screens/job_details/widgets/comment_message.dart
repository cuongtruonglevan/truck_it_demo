import 'package:flutter/material.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentMessage extends StatelessWidget {
  const CommentMessage(
      {Key? key,
      required this.comment,
      this.guessColor = Colors.white,
      this.hasFlag = false})
      : super(key: key);

  final Comment comment;
  final Color guessColor;
  final bool hasFlag;

  @override
  Widget build(BuildContext context) {
    if (comment.user == 'me') {
      return buildMyMessage();
    } else {
      return buildOtherMessage();
    }
  }

  Widget buildMyMessage() {
    return Row(
      children: [
        Spacer(flex: 1),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: AppColor.fff05a29,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.w),
                          topRight: Radius.circular(10.w),
                          bottomLeft: Radius.circular(10.w),
                        ),
                      ),
                      child: Text(
                        comment.content,
                        style: AppTextStyle.normalRegular13
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.w),
              RichText(
                text: TextSpan(
                  text: comment.user,
                  style: AppTextStyle.normalSemiBold11.copyWith(
                    color: AppColor.fff05a29,
                  ),
                  children: [
                    TextSpan(
                      text: ' ${comment.time}',
                      style: AppTextStyle.normalSemiBold11.copyWith(
                        color: AppColor.ff747474,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildOtherMessage() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: guessColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.w),
                          topRight: Radius.circular(10.w),
                          bottomRight: Radius.circular(10.w),
                        ),
                      ),
                      child: Text(
                        comment.content,
                        style: AppTextStyle.normalRegular13,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: hasFlag,
                    child: Padding(
                      padding: EdgeInsets.only(left: 9.w),
                      child: Image.asset(
                        AppAsset.icFlag,
                        width: 7.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.w),
              RichText(
                text: TextSpan(
                  text: comment.user,
                  style: AppTextStyle.normalSemiBold11.copyWith(
                    color: AppColor.fff05a29,
                  ),
                  children: [
                    TextSpan(
                      text: ' ${comment.time}',
                      style: AppTextStyle.normalSemiBold11.copyWith(
                        color: AppColor.ff747474,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Spacer(flex: 1),
      ],
    );
  }
}

class Comment {
  final String user;
  final String content;
  final String time;

  Comment({required this.user, required this.content, required this.time});
}
