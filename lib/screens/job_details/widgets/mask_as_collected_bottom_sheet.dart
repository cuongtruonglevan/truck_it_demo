import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:get/get.dart';
import 'package:truckit_demo/shared/widgets/dismissible_bottom_sheet.dart';

class MaskAsCollectedBottomSheet extends StatelessWidget {
  MaskAsCollectedBottomSheet({Key? key}) : super(key: key);

  final value = false.obs;
  final uploadedProofs = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    return DismissibleBottomSheet(
      dismissibleKeyValue: 'maskAsCollected',
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
            SizedBox(height: 14.w),
            Text(
              'Mark as collected',
              style: AppTextStyle.normalRegular16,
            ),
            SizedBox(height: 12.w),
            buildHorizontalDivider(),
            SizedBox(height: 16.w),
            Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'This is an optional step which helps keep track of your booking in the delivery process. If your item/s have already been delivered then you can go direct to \'Mark as Delivered\'.',
                  style: AppTextStyle.normalRegular15.copyWith(
                    color: AppColor.ff4b4b4b,
                    height: 26 / 15,
                  ),
                ),
              ),
              SizedBox(height: 5.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Text(
                      'Tracking is Enabled',
                      style: AppTextStyle.normalRegular15.copyWith(
                        height: 26 / 15,
                      ),
                    ),
                    Spacer(),
                    Obx(() => CupertinoSwitch(
                          value: value.value,
                          onChanged: (newValue) {
                            value.value = newValue;
                          },
                        )),
                  ],
                ),
              ),
              SizedBox(height: 17.w),
              Obx(() => Visibility(
                    visible: uploadedProofs.isNotEmpty,
                    child: SizedBox(
                      height: 90.w,
                      child: Obx(() => ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            scrollDirection: Axis.horizontal,
                            itemCount: uploadedProofs.length + 1,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 5.w),
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Container(
                                  width: 90.w,
                                  height: 90.w,
                                  padding:
                                      EdgeInsets.only(top: 10.w, right: 10.w),
                                  child: TextButton(
                                    onPressed: () {
                                      uploadedProofs.add([
                                        AppAsset.imgGallery1,
                                        AppAsset.imgGallery2,
                                        AppAsset.imgGallery3,
                                      ].elementAt(Random().nextInt(3)));
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: DottedBorder(
                                      color: AppColor.ffb8b7b7,
                                      dashPattern: [5.w, 5.w],
                                      child: Container(
                                        width: 80.w,
                                        height: 80.w,
                                        child: Center(
                                          child: Icon(
                                            Icons.add_sharp,
                                            size: 18.w,
                                            color: AppColor.ff505050,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                final asset =
                                    uploadedProofs.elementAt(index - 1);
                                return Stack(
                                  children: [
                                    Container(
                                      width: 90.w,
                                      height: 90.w,
                                    ),
                                    Positioned(
                                      left: 0.0,
                                      bottom: 0.0,
                                      child: Image.asset(
                                        asset,
                                        width: 80.w,
                                        height: 80.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.0,
                                      right: 0.0,
                                      child: SizedBox(
                                        width: 20.w,
                                        height: 20.w,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            uploadedProofs.removeAt(index - 1);
                                          },
                                          child: Icon(Icons.close_rounded,
                                              size: 16.w, color: Colors.white),
                                          style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.zero,
                                            primary: AppColor.fff05a29,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          )),
                    ),
                    replacement: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      width: double.infinity,
                      height: 110.w,
                      child: DottedBorder(
                        color: AppColor.ffb8b7b7,
                        dashPattern: [5.w, 5.w],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Upload proof of collection',
                                style: AppTextStyle.normalRegular14.copyWith(
                                  color: AppColor.ff737373,
                                ),
                              ),
                              SizedBox(height: 10.w),
                              Container(
                                height: 34.w,
                                width: 120.w,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColor.fff05a29,
                                    shape: RoundedRectangleBorder(),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 3.w),
                                  ),
                                  onPressed: () {
                                    uploadedProofs.add([
                                      AppAsset.imgGallery1,
                                      AppAsset.imgGallery2,
                                      AppAsset.imgGallery3,
                                    ].elementAt(Random().nextInt(3)));
                                  },
                                  child: Center(
                                    child: Text(
                                      'Upload',
                                      style: AppTextStyle.normalSemiBold15
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 25.w),
              Obx(() => Container(
                    height: 46.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: uploadedProofs.isEmpty
                            ? AppColor.ffd1cfcf
                            : AppColor.fff05a29,
                        shape: RoundedRectangleBorder(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 3.w),
                      ),
                      onPressed: uploadedProofs.isEmpty
                          ? null
                          : () {
                              Navigator.of(context).pop();
                            },
                      child: Center(
                        child: Text(
                          'Collected',
                          style: AppTextStyle.normalSemiBold15
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 39.w),
            ]),
          ],
        ),
      ),
    );
  }
}
