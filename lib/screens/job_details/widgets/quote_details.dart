import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/shared.dart';

class QuoteDetails extends StatelessWidget {
  const QuoteDetails({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 9.w),
                  Center(
                    child: Container(
                      width: 32.w,
                      height: 3.w,
                      decoration: BoxDecoration(
                        color: AppColor.ffc4c4c4,
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 19.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(children: [
                      Text(
                        'Matt796790',
                        style: AppTextStyle.normalSemiBold17,
                      ),
                      SizedBox(width: 10.w),
                      Image.asset(
                        AppAsset.icStar,
                        width: 18.w,
                        fit: BoxFit.fitWidth,
                      ),
                      Spacer(),
                      Text(
                        '\$1920',
                        textAlign: TextAlign.right,
                        style: AppTextStyle.normalSemiBold15
                            .copyWith(color: AppColor.fff05a29),
                      ),
                    ]),
                  ),
                  SizedBox(height: 15.w),
                  buildHorizontalDivider(),
                  SizedBox(height: 13.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.ffe7e7e7)),
                            child: Row(children: [
                              Image.asset(
                                AppAsset.icDashboardMyQuotes,
                                width: 14.w,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Withdraw',
                                style: AppTextStyle.normalRegular13,
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.ffe7e7e7)),
                          child: Row(children: [
                            Image.asset(
                              AppAsset.icCopy,
                              width: 14.w,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Copy Quote',
                              style: AppTextStyle.normalRegular13,
                            ),
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.ffe7e7e7)),
                          child: Row(children: [
                            Image.asset(
                              AppAsset.icMessage,
                              width: 16.w,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Message',
                              style: AppTextStyle.normalRegular13,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 23.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(children: [
                      Text('Provider Type',
                          style: AppTextStyle.normalRegular15
                              .copyWith(color: AppColor.ff747474)),
                      Spacer(),
                      Image.asset(
                        AppAsset.icTruckOwner,
                        width: 20.w,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(width: 4.w),
                      Text('Truck Owner', style: AppTextStyle.normalRegular15),
                    ]),
                  ),
                  SizedBox(height: 17.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(children: [
                      Text('Quote Status',
                          style: AppTextStyle.normalRegular15
                              .copyWith(color: AppColor.ff747474)),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 3.w),
                        decoration: BoxDecoration(
                          color: AppColor.ffffdfdf,
                          border: Border.all(
                            color: AppColor.ffff6363,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AppAsset.icClock,
                              width: 12.w,
                              fit: BoxFit.fitWidth,
                              color: AppColor.ff505050,
                            ),
                            SizedBox(width: 4.w),
                            Text('Withdrawn',
                                style: AppTextStyle.normalRegular10),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: 17.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(children: [
                      Text('Positive Feedback',
                          style: AppTextStyle.normalRegular15
                              .copyWith(color: AppColor.ff747474)),
                      Spacer(),
                      Text('67%', style: AppTextStyle.normalRegular15),
                    ]),
                  ),
                  SizedBox(height: 9.w),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: buildHorizontalDivider(),
                  ),
                  SizedBox(height: 16.w),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Collection Date',
                                      style: AppTextStyle.normalRegular15
                                          .copyWith(color: AppColor.ff747474)),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(height: 5.w),
                              Text('As per Quote Specific Terms',
                                  style: AppTextStyle.normalRegular15),
                              SizedBox(height: 9.w),
                              Text('Delivery Date',
                                  style: AppTextStyle.normalRegular15
                                      .copyWith(color: AppColor.ff747474)),
                              SizedBox(height: 5.w),
                              Text('Within 2 weeks of Collecting',
                                  style: AppTextStyle.normalRegular15),
                              SizedBox(height: 9.w),
                              Text('Mode Of Transport',
                                  style: AppTextStyle.normalRegular15
                                      .copyWith(color: AppColor.ff747474)),
                              SizedBox(height: 5.w),
                              Text('Rail Transport',
                                  style: AppTextStyle.normalRegular15),
                              SizedBox(height: 9.w),
                              Text('Payments Terms',
                                  style: AppTextStyle.normalRegular15
                                      .copyWith(color: AppColor.ff747474)),
                              SizedBox(height: 5.w),
                              Text('On Collection',
                                  style: AppTextStyle.normalRegular15),
                            ]),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Row(
                          children: [
                            Image.asset(
                              AppAsset.icFlag,
                              width: 9.w,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(width: 7.w),
                            Text(
                              'Report Violation',
                              style: AppTextStyle.normalRegular12
                                  .copyWith(color: AppColor.ff888888),
                            ),
                            SizedBox(width: 17.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 39.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
