import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/app_text_style.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:truckit_demo/shared/utils.dart';
import 'package:get/get.dart';

class RequestAmountIncreaseBottomSheet extends StatelessWidget {
  RequestAmountIncreaseBottomSheet({Key? key}) : super(key: key);

  final value = false.obs;
  final amountController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Spacer(),
            Container(
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
                  SizedBox(height: 14.w),
                  Text(
                    'Request to increase job amount',
                    style: AppTextStyle.normalRegular15,
                  ),
                  SizedBox(height: 12.w),
                  buildHorizontalDivider(),
                  Container(
                    padding: EdgeInsets.fromLTRB(20.w, 16.w, 20.w, 39.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount',
                          style: AppTextStyle.normalRegular15
                              .copyWith(height: 26 / 15),
                        ),
                        SizedBox(height: 6.w),
                        TextFormField(
                          controller: amountController,
                          textInputAction: TextInputAction.done,
                          style: AppTextStyle.normalRegular15,
                          decoration: InputDecoration(
                            hintText: 'In AU\$',
                            hintStyle: AppTextStyle.normalRegular15
                                .copyWith(color: AppColor.ff8e8e8e),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.w),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                  color: AppColor.ffe9e6e6, width: 1.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.w),
                        Text(
                          'Reason',
                          style: AppTextStyle.normalRegular15
                              .copyWith(height: 26 / 15),
                        ),
                        SizedBox(height: 9.w),
                        TextFormField(
                          controller: reasonController,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          style: AppTextStyle.normalRegular15,
                          maxLines: 4,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.w),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                  color: AppColor.ffe9e6e6, width: 1.0),
                            ),
                            hintText: 'Write your message',
                            hintStyle: AppTextStyle.normalRegular15
                                .copyWith(color: AppColor.ff8e8e8e),
                          ),
                        ),
                        SizedBox(height: 19.w),
                        Container(
                          height: 46.w,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColor.fff05a29,
                              shape: RoundedRectangleBorder(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.w, vertical: 3.w),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text(
                                'Request',
                                style: AppTextStyle.normalSemiBold15
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
