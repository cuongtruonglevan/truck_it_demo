import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/app_text_style.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:truckit_demo/shared/utils.dart';
import 'package:truckit_demo/shared/widgets/dismissible_bottom_sheet.dart';

class MessageFilterBottomSheet extends StatelessWidget {
  MessageFilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissibleBottomSheet(
      dismissibleKeyValue: 'messageFilter',
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
            buildOptionItem(context, AppAsset.icAllInbox, 'All Inbox'),
            buildCustomDivider(),
            buildOptionItem(context, AppAsset.icSent, 'Sent'),
            buildCustomDivider(),
            buildOptionItem(context, AppAsset.icRead, 'Read'),
            buildCustomDivider(),
            buildOptionItem(context, AppAsset.icUnread, 'Unread'),
            buildCustomDivider(),
            buildOptionItem(context, AppAsset.icArchive, 'Archived'),
          ],
        ),
      ),
    );
  }

  Widget buildOptionItem(
      BuildContext context, String leadingAsset, String label) {
    return TextButton(
      onPressed: () {
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
            SizedBox(
              width: 20.w,
              child: Image.asset(
                leadingAsset,
                fit: BoxFit.fitWidth,
                color: AppColor.ff505050,
              ),
            ),
            SizedBox(width: 12.w),
            Text(label, style: AppTextStyle.normalRegular15),
            Spacer(),
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
