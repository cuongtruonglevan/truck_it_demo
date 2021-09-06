import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawnQuote extends StatelessWidget {
  WithdrawnQuote({Key? key}) : super(key: key);

  final reasons = [
    Reason('I made a mistake', true.obs),
    Reason('I am placing a New Quote', false.obs),
    Reason('I am no longer going that way', false.obs),
    Reason('I have Booked another Job', false.obs),
  ];

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            buildHorizontalDivider(),
            Expanded(child: buildBody(context)),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Container(
      height: 60.w,
      child: Row(
        children: [
          SizedBox(
            width: 56.w,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Image.asset(
                  AppAsset.icBack,
                  width: 15.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Withdraw Quote',
                style: AppTextStyle.normalSemiBold20,
              ),
            ),
          ),
          SizedBox(
            width: 56.w,
          )
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.w, 26.w, 20.w, 38.w),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: reasons.length,
            separatorBuilder: (context, index) => SizedBox(height: 13.w),
            itemBuilder: (context, index) {
              final reason = reasons.elementAt(index);
              return buildReasonSelection(reason, () {
                reasons.forEach((r) {
                  r.isSelected.value = false;
                });
                reason.isSelected.value = true;
              });
            },
          ),
          SizedBox(height: 33.w),
          TextFormField(
            controller: commentController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.done,
            style: AppTextStyle.normalRegular15,
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColor.ffe9e6e6, width: 1.0),
              ),
              hintText: 'Your Comments',
              hintStyle: AppTextStyle.normalRegular15
                  .copyWith(color: AppColor.ff8e8e8e),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          Container(
            height: 46.w,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColor.fff05a29,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.w),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: AppTextStyle.normalSemiBold15
                            .copyWith(color: AppColor.fff05a29),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 19.w),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.fff05a29,
                      shape: RoundedRectangleBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.w),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'Withdrawn',
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
    );
  }

  Widget buildReasonSelection(Reason reason, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Obx(() => Visibility(
                visible: reason.isSelected.value,
                child: Icon(
                  Icons.radio_button_checked_rounded,
                  color: AppColor.fff05a29,
                ),
                replacement: Icon(
                  Icons.radio_button_unchecked_rounded,
                  color: AppColor.ffe9e6e6,
                ),
              )),
          SizedBox(width: 14.w),
          Text(reason.reason, style: AppTextStyle.normalRegular15),
        ],
      ),
    );
  }
}

class Reason {
  final String reason;
  final RxBool isSelected;

  Reason(this.reason, this.isSelected);
}
