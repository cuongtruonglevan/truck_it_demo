import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/app_text_style.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:truckit_demo/shared/utils.dart';
import 'package:get/get.dart';
import 'package:truckit_demo/shared/widgets/dismissible_bottom_sheet.dart';

class OptionBottomSheet extends StatelessWidget {
  OptionBottomSheet({Key? key}) : super(key: key);

  final value = false.obs;

  @override
  Widget build(BuildContext context) {
    return DismissibleBottomSheet(
      dismissibleKeyValue: 'optionMenu',
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 9.w),
            Container(
              width: 32.w,
              height: 3.w,
              decoration: BoxDecoration(
                color: AppColor.ffc4c4c4,
                borderRadius: BorderRadius.circular(10.w),
              ),
            ),
            buildOptionItem(
              context,
              Image.asset(
                AppAsset.icWatching,
                width: 20.w,
                fit: BoxFit.fitWidth,
              ),
              'Watch this listing',
              false,
            ),
            buildCustomDivider(),
            buildOptionItem(
              context,
              Image.asset(
                AppAsset.icSendMessage,
                width: 20.w,
                fit: BoxFit.fitWidth,
              ),
              'Send a message',
              false,
            ),
            buildCustomDivider(),
            buildOptionItem(
              context,
              Image.asset(
                AppAsset.icDashboardMyQuotes,
                color: AppColor.ff505050,
                width: 15.w,
                fit: BoxFit.fitWidth,
              ),
              'Withdraw my quote',
              false,
            ),
            buildCustomDivider(),
            buildOptionItem(
              context,
              Icon(
                Icons.check_circle_outline_rounded,
                color: AppColor.ff505050,
                size: 20.w,
              ),
              'Mark as collected',
              false,
            ),
            buildCustomDivider(),
            buildOptionItem(
              context,
              Icon(
                Icons.check_circle_outline_rounded,
                color: AppColor.ff505050,
                size: 20.w,
              ),
              'Mark as delivered',
              false,
            ),
            buildCustomDivider(),
            buildOptionItem(
              context,
              Icon(
                Icons.check_circle_outline_rounded,
                color: AppColor.ff505050,
                size: 20.w,
              ),
              'Request amount Increase',
              false,
            ),
            buildCustomDivider(),
            buildOptionItem(
              context,
              Icon(
                Icons.highlight_remove_rounded,
                color: AppColor.ff505050,
                size: 20.w,
              ),
              'Request cancellation',
              false,
            ),
            buildCustomDivider(),
            buildOptionItem(
              context,
              Icon(
                Icons.check_circle_outline_rounded,
                color: AppColor.ff505050,
                size: 20.w,
              ),
              'Allow customer to track me',
              true,
            ),
            buildCustomDivider(),
          ],
        ),
      ),
    );
  }

  Widget buildOptionItem(
      BuildContext context, Widget leading, String label, bool isTrack) {
    return TextButton(
      onPressed: isTrack
          ? null
          : () {
              Navigator.pop(context, label);
            },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(),
        padding: EdgeInsets.zero,
      ),
      child: Container(
        height: 56.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 22.w),
            SizedBox(width: 20.w, child: leading),
            SizedBox(width: 12.w),
            Text(label, style: AppTextStyle.normalRegular15),
            Spacer(),
            Obx(() => Visibility(
                  visible: isTrack,
                  child: CupertinoSwitch(
                    value: value.value,
                    onChanged: (newValue) {
                      value.value = newValue;
                    },
                  ),
                )),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }

  Widget buildCustomDivider() {
    return Padding(
        padding: EdgeInsets.only(left: 50.w), child: buildHorizontalDivider());
  }
}
