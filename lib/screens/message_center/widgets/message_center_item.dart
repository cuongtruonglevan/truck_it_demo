import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/shared.dart';

class MessageCenterItem extends StatelessWidget {
  const MessageCenterItem(
      {Key? key, required this.message, required this.onPressed})
      : super(key: key);

  final AppMessage message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(21.w, 10.w, 20.w, 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: message.unRead,
              child: Container(
                height: 20.w,
                child: Center(
                  child: Image.asset(
                    AppAsset.icUnread,
                    width: 20.w,
                    height: 15.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              replacement: Image.asset(
                AppAsset.icRead,
                width: 20.w,
                height: 20.w,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.title,
                    style: message.unRead
                        ? AppTextStyle.normalSemiBold16
                        : AppTextStyle.normalRegular16,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    message.fromTo,
                    style: message.unRead
                        ? AppTextStyle.normalSemiBold13
                        : AppTextStyle.normalRegular13,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(height: 10.w),
                  Row(
                    children: [
                      Text(
                        message.name,
                        style: AppTextStyle.normalRegular13.copyWith(
                          color: AppColor.ff8e8e8e,
                        ),
                      ),
                      Spacer(),
                      Text(
                        message.time,
                        style: AppTextStyle.normalRegular13.copyWith(
                          color: AppColor.ff8e8e8e,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppMessage {
  final String title;
  final String fromTo;
  final String name;
  final String time;
  final bool unRead;

  AppMessage(
      {required this.title,
      required this.fromTo,
      required this.name,
      required this.time,
      required this.unRead});
}
