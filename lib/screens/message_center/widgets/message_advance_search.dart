import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:truckit_demo/shared/widgets/dismissible_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageAdvanceSearch extends StatelessWidget {
  MessageAdvanceSearch({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final titleController = TextEditingController();
  final fromDateString = ''.obs;
  final toDateString = ''.obs;

  @override
  Widget build(BuildContext context) {
    return DismissibleBottomSheet(
      dismissibleKeyValue: 'messageAdvanceSearch',
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
            SizedBox(height: 18.w),
            Text(
              'Advanced Search',
              style: AppTextStyle.normalRegular16,
            ),
            SizedBox(height: 18.w),
            buildHorizontalDivider(),
            SizedBox(height: 18.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    textInputAction: TextInputAction.next,
                    style: AppTextStyle.normalRegular15
                        .copyWith(color: AppColor.ff8e8e8e, height: 22 / 14),
                    decoration: InputDecoration(
                      hintText: 'Sender username',
                      hintStyle: AppTextStyle.normalRegular15
                          .copyWith(color: AppColor.ff8e8e8e),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide:
                            BorderSide(color: AppColor.ffe9e6e6, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.w),
                  TextFormField(
                    controller: titleController,
                    textInputAction: TextInputAction.next,
                    style: AppTextStyle.normalRegular15
                        .copyWith(color: AppColor.ff8e8e8e, height: 22 / 14),
                    decoration: InputDecoration(
                      hintText: 'Subject Title',
                      hintStyle: AppTextStyle.normalRegular15
                          .copyWith(color: AppColor.ff8e8e8e),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.w),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide:
                            BorderSide(color: AppColor.ffe9e6e6, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.w),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final temp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 30)),
                              lastDate: DateTime.now().add(Duration(days: 30)),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: AppColor.fff05a29,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (temp != null) {
                              final format = DateFormat('dd/MM');
                              fromDateString.value = format.format(temp);
                            }
                          },
                          child: Container(
                            height: 46.w,
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.ffe9e6e6),
                            ),
                            child: Row(
                              children: [
                                Obx(
                                  () => Text(
                                    'From ${fromDateString.value}',
                                    style: AppTextStyle.normalRegular15
                                        .copyWith(color: AppColor.ff8e8e8e),
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  AppAsset.icCalendar,
                                  width: 20.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 19.w),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final temp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 30)),
                              lastDate: DateTime.now().add(Duration(days: 30)),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: AppColor.fff05a29,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (temp != null) {
                              final format = DateFormat('dd/MM');
                              toDateString.value = format.format(temp);
                            }
                          },
                          child: Container(
                            height: 46.w,
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.ffe9e6e6),
                            ),
                            child: Row(
                              children: [
                                Obx(
                                  () => Text(
                                    'To ${toDateString.value}',
                                    style: AppTextStyle.normalRegular15
                                        .copyWith(color: AppColor.ff8e8e8e),
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  AppAsset.icCalendar,
                                  width: 20.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.w),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AppColor.fff05a29,
                        shape: RoundedRectangleBorder(),
                        minimumSize: Size(0, 46.w)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'Search',
                        style: AppTextStyle.normalSemiBold15
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.w),
                  Text(
                    'NOTE: All read messages Auto Archive after 2 months.',
                    style: AppTextStyle.normalRegular13
                        .copyWith(color: AppColor.ff4b4b4b),
                  ),
                  SizedBox(height: 27.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
