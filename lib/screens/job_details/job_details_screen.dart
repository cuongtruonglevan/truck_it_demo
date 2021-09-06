import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:truckit_demo/screens/job_details/widgets/comment_message.dart';
import 'package:truckit_demo/screens/job_details/widgets/item_details_gallery.dart';
import 'package:truckit_demo/screens/job_details/widgets/mask_as_collected_bottom_sheet.dart';
import 'package:truckit_demo/screens/job_details/widgets/mask_as_delivered_bottom_sheet.dart';
import 'package:truckit_demo/screens/job_details/widgets/option_bottom_sheet.dart';
import 'package:truckit_demo/screens/job_details/widgets/quote_details.dart';
import 'package:truckit_demo/screens/job_details/widgets/request_amount_increase_bottom_sheet.dart';
import 'package:truckit_demo/screens/job_details/widgets/withdrawn_quote.dart';
import 'package:truckit_demo/shared/expandable_widget.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:truckit_demo/shared/widgets/app_bottom_bar.dart';

enum JobStatus {
  Active,
  Booked,
  ReadyForCollect,
  Collected,
  InTransit,
  ReadyForDelivery,
  Delivered
}

class JobDetailsScreen extends StatelessWidget {
  JobDetailsScreen({Key? key}) : super(key: key);

  final screenTitle = 'Active'.obs;
  final actionTitle = 'ADD A QUOTE'.obs;
  final jobStatus = JobStatus.Active.obs;
  final contactExpanded = false.obs;
  final jobDetailsExpanded = false.obs;
  final itemDetailsExpanded = false.obs;
  final quotesExpanded = false.obs;
  final commentsExpanded = false.obs;

  final sampleItemGalleries = [
    AppAsset.sampleImageJobDetail1,
    AppAsset.sampleImageJobDetail2,
    AppAsset.sampleImageJobDetail1,
    AppAsset.sampleImageJobDetail2,
  ];

  final preferences = [
    'Dry Pantechs',
    'Car Carriers',
    'Livestock Truck',
  ];

  final quotes = [
    Quote(
        type: QuoteType.Agency,
        name: 'Instantcar',
        status: QuoteStatus.Accepted,
        amount: 3200),
    Quote(
        type: QuoteType.TruckOwner,
        name: 'Matt796790',
        status: QuoteStatus.Withdrawn,
        amount: 1920),
    Quote(
        type: QuoteType.TruckOwner,
        name: 'Andrew796224',
        status: QuoteStatus.Active,
        amount: 800),
    Quote(
        type: QuoteType.Agency,
        name: 'Captivafreight',
        status: QuoteStatus.Active,
        amount: 12728),
    Quote(
        type: QuoteType.TruckOwner,
        name: 'Kevin8902',
        status: QuoteStatus.Withdrawn,
        amount: 1920),
  ];

  final comments = [
    Comment(
        user: 'kiwicar',
        content: 'Do you have more photos?',
        time: '25/12 16:33'),
    Comment(
        user: 'me',
        content: 'Are you flexible on Sunday? I can quote you a best price',
        time: '26/12 12:50'),
    Comment(
        user: 'bluebell', content: 'Are you in a rush?', time: '26/12 17:10'),
    Comment(
        user: 'Instantcar',
        content: 'How might we move by this weekend?',
        time: '27/12 17:39'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCustomNotificationSection(),
            buildAppBar(context),
            buildHorizontalDivider(),
            Expanded(child: buildBody(context)),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }

  Widget buildCustomNotificationSection() {
    return Container();
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
              onPressed: () {},
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
              child: Obx(
                () => Text(
                  screenTitle.value,
                  style: AppTextStyle.normalSemiBold15,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 56.w,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (_, __, ___) => OptionBottomSheet(),
                  ),
                );
                await Future.delayed(Duration(milliseconds: 300));
                if (result == 'Request amount Increase') {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) =>
                          RequestAmountIncreaseBottomSheet(),
                    ),
                  );
                } else if (result == 'Withdraw my quote') {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => WithdrawnQuote(),
                    ),
                  );
                }
              },
              child: Center(
                child: Image.asset(
                  AppAsset.icMoreOption,
                  width: 15.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildJobStatusWidget(context),
          buildHorizontalDivider(),
          Obx(() => Visibility(
                visible: jobStatus.value != JobStatus.Active,
                child: buildJobDetailItem(
                    label: 'Contact Details',
                    content: buildContactDetailsContent(),
                    expanded: contactExpanded),
              )),
          buildHorizontalDivider(),
          buildJobDetailItem(
              label: 'Job Details',
              content: buildJobDetailsContent(),
              expanded: jobDetailsExpanded),
          buildHorizontalDivider(),
          buildJobDetailItem(
              label: 'Item Details',
              content: buildItemDetailsContent(),
              expanded: itemDetailsExpanded),
          buildHorizontalDivider(),
          buildJobDetailItem(
              label: 'Quotes',
              content: buildQuotesContent(),
              expanded: quotesExpanded),
          buildHorizontalDivider(),
          buildJobDetailItem(
              label: 'Comments',
              content: buildCommentsContent(),
              expanded: commentsExpanded),
          buildHorizontalDivider(),
        ],
      ),
    );
  }

  Widget buildJobStatusWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 23.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// STATUS DETAILS
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.w),
                height: 26.w,
                child: Row(
                  children: [
                    Wrap(
                      spacing: 6.w,
                      runSpacing: 6.w,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 3.w),
                          color: AppColor.ffe1e0df,
                          child: Text(
                            'Cars',
                            style: AppTextStyle.normalSemiBold12
                                .copyWith(color: AppColor.ff414141),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 3.w),
                          color: AppColor.fffb9a2b,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppAsset.icEdited,
                                width: 12.w,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'EDITED',
                                style: AppTextStyle.normalSemiBold12
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Obx(() => Visibility(
                              visible: jobStatus.value == JobStatus.Active,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.w, vertical: 3.w),
                                color: AppColor.ffff8383,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      AppAsset.icClock,
                                      width: 12.w,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      'EXpires in 5 Days 12 Hours',
                                      style: AppTextStyle.normalSemiBold12
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Obx(() => Visibility(
                    visible: jobStatus.value != JobStatus.Active,
                    child: Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Row(
                        children: [
                          Image.asset(
                            AppAsset.icCall,
                            width: 26.w,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Saurav',
                            style: AppTextStyle.normalSemiBold15,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(height: 15.w),

          /// JOB NAME
          Text('XT14 Electric Caravan', style: AppTextStyle.normalSemiBold22),
          SizedBox(height: 15.w),

          /// DESTINATIONS
          Row(
            children: [
              Image.asset(
                AppAsset.icMapLocation,
                width: 8.w,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 5.w),
              Text(
                'Surrey Hills, NSW 2040',
                style: AppTextStyle.normalSemiBold12
                    .copyWith(color: AppColor.ff6b6b6b),
              ),
              SizedBox(width: 5.w),
              Icon(Icons.arrow_right_alt_sharp),
              SizedBox(width: 5.w),
              Image.asset(
                AppAsset.icMapLocation,
                width: 8.w,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 5.w),
              Text(
                'Sunny Park, ACT 3350',
                style: AppTextStyle.normalSemiBold12
                    .copyWith(color: AppColor.ff6b6b6b),
              ),
            ],
          ),
          SizedBox(height: 15.w),

          /// STATUS CHANGE ACTION
          buildStatusChangeButton(context),
        ],
      ),
    );
  }

  Widget buildJobDetailItem(
      {required String label,
      required Widget content,
      required RxBool expanded}) {
    return Obx(
      () => Column(
        children: [
          /// ITEM LABEL
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
            ),
            onPressed: () {
              expanded.value = !expanded.value;
            },
            child: SizedBox(
              height: 60.w,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: AppTextStyle.normalSemiBold17
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(width: 15.w),
                  Visibility(
                    visible: label == 'Quotes',
                    child: Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: AppColor.fff3f3f3,
                        border: Border.all(
                          color: AppColor.ffbfbebe,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAsset.icDashboardMyQuotes,
                            width: 9.w,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '5 Quotes (\$4500-\$7200)',
                            style: AppTextStyle.normalSemiBold10
                                .copyWith(color: AppColor.ff494747),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Visibility(
                    visible: expanded.value,
                    child: Icon(Icons.remove, color: Colors.black),
                    replacement: Icon(Icons.add, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),

          /// ITEM CONTENT
          ExpandableWidget(child: content, expand: expanded.value),
        ],
      ),
    );
  }

  Widget buildContactDetailsContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContactDetailsItem('Customer username', 'saura816260'),
          SizedBox(height: 15.w),
          buildContactDetailsItem('Customer name', 'Saurav  Rawal'),
          SizedBox(height: 15.w),
          buildContactDetailsItem('Customer type', 'Agency / Broker'),
          SizedBox(height: 15.w),
          buildContactDetailsItem('Customer Phone Number', '0468754419'),
          SizedBox(height: 15.w),
          buildContactDetailsItem('Primary Phone Number', '0468754419'),
          SizedBox(height: 30.w),
          buildContactDetailsAddress('Collection address',
              '817 Logan Road, Holland Park West QLD 4121'),
          SizedBox(height: 15.w),
          buildContactDetailsAddress('Delivery address',
              '1/17 Clinton Street, Coopers Plains QLD 4018'),
          SizedBox(height: 15.w),
          buildHorizontalDivider(),
          SizedBox(height: 24.w),
          buildContactDetailsOweAmount(),
          SizedBox(height: 27.w),
        ],
      ),
    );
  }

  Widget buildJobDetailsContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Listing ID',
                style: AppTextStyle.normalRegular15.copyWith(
                  color: AppColor.ff747474,
                ),
              ),
              Spacer(),
              Text(
                '1873',
                style: AppTextStyle.normalSemiBold15.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 11.w),
          Row(
            children: [
              Text(
                'Listed on',
                style: AppTextStyle.normalRegular15.copyWith(
                  color: AppColor.ff747474,
                ),
              ),
              Spacer(),
              Text(
                '11 Nov 2020',
                style: AppTextStyle.normalSemiBold15.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 11.w),
          Row(
            children: [
              Text(
                'Customer Info',
                style: AppTextStyle.normalRegular15.copyWith(
                  color: AppColor.ff747474,
                ),
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  text: '(rob796790) ',
                  style: AppTextStyle.normalSemiBold15.copyWith(
                    color: AppColor.fff05a29,
                  ),
                  children: [
                    TextSpan(
                      text: 'Robert',
                      style: AppTextStyle.normalBold15.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 17.w),
          buildHorizontalDivider(),
          SizedBox(height: 20.w),

          /// DISTANCE
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.w),
                color: AppColor.ffe7e5e5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAsset.icRoad,
                      width: 12.w,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '996 Km',
                      style: AppTextStyle.normalSemiBold13
                          .copyWith(color: AppColor.ff414141),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.w),
                color: AppColor.ff666666,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAsset.icClock,
                      width: 12.w,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '11 Hours',
                      style: AppTextStyle.normalSemiBold13
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 30.w),

          /// FROM
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.w),
                    child: Image.asset(
                      AppAsset.icMapLocation,
                      height: 12.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Surrey Hills, NSW 2040',
                        style: AppTextStyle.normalSemiBold15
                            .copyWith(color: AppColor.ff6b6b6b),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '11 Nov 2020',
                          style: AppTextStyle.normalRegular12.copyWith(
                            color: AppColor.fff05a29,
                          ),
                          children: [
                            TextSpan(
                              text: ' /  Residential',
                              style: AppTextStyle.normalRegular12.copyWith(
                                color: AppColor.ff747474,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 24.w),

          /// TO
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.w),
                    child: Image.asset(
                      AppAsset.icMapLocation,
                      height: 12.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Surrey Hills, NSW 2040',
                        style: AppTextStyle.normalSemiBold15
                            .copyWith(color: AppColor.ff6b6b6b),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '12 Nov 2020',
                          style: AppTextStyle.normalRegular12.copyWith(
                            color: AppColor.fff05a29,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '  /  Commercial without loading facilities',
                              style: AppTextStyle.normalRegular12.copyWith(
                                color: AppColor.ff747474,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 24.w),
        ],
      ),
    );
  }

  Widget buildItemDetailsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'What needs moving?',
            style: AppTextStyle.normalRegular13.copyWith(
              color: AppColor.ff747474,
            ),
          ),
        ),
        SizedBox(height: 7.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'XT14 Electric Caravan',
            style: AppTextStyle.normalSemiBold16.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 5.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'I really need to move my damaged Caravan. Please do it at any cost.',
            style: AppTextStyle.normalRegular15.copyWith(
              color: Colors.black,
              height: 24 / 15,
            ),
          ),
        ),
        SizedBox(height: 18.w),
        Container(
          height: 80.w,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            scrollDirection: Axis.horizontal,
            itemCount: sampleItemGalleries.length,
            separatorBuilder: (context, index) => SizedBox(width: 13.w),
            itemBuilder: (context, index) {
              final asset = sampleItemGalleries.elementAt(index);
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => ItemDetailsGallery(),
                    ),
                  );
                },
                child: Image.asset(
                  asset,
                  width: 80.w,
                  height: 80.w,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 19.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Truck/Trailer preference',
            style: AppTextStyle.normalRegular13.copyWith(
              color: AppColor.ff747474,
            ),
          ),
        ),
        SizedBox(height: 10.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Wrap(
            spacing: 9.w,
            runSpacing: 9.w,
            children: preferences
                .map((preference) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.w),
                      color: AppColor.ffe1e0df,
                      child: Text(
                        preference,
                        style: AppTextStyle.normalSemiBold12
                            .copyWith(color: AppColor.ff414141),
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(height: 22.w),
      ],
    );
  }

  Widget buildQuotesContent() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            final quote = quotes.elementAt(index);
            final backgroundColor =
                quote.status == QuoteStatus.Accepted ? AppColor.ffdfffdf : null;
            final leadingIcon = quote.type == QuoteType.Agency
                ? Image.asset(
                    AppAsset.icAgency,
                    width: 18.w,
                    fit: BoxFit.fitWidth,
                  )
                : Image.asset(
                    AppAsset.icTruckOwner,
                    width: 20.w,
                    fit: BoxFit.fitWidth,
                  );
            String statusLabel = 'Accepted';
            Color statusPrimaryColor = Colors.white;
            Color statusBackgroundColor = AppColor.ff5cb85c;
            Color statusBorderColor = AppColor.ff5cb85c;
            switch (quote.status) {
              case QuoteStatus.Active:
                statusLabel = 'Active';
                statusPrimaryColor = Colors.black;
                statusBackgroundColor = AppColor.ffdfffdf;
                statusBorderColor = AppColor.ff5cb85c;
                break;
              case QuoteStatus.Withdrawn:
                statusLabel = 'Withdrawn';
                statusPrimaryColor = Colors.black;
                statusBackgroundColor = AppColor.ffffdfdf;
                statusBorderColor = AppColor.ffff6363;
                break;
              default:
            }
            return Container(
              height: 50.w,
              color: backgroundColor,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => QuoteDetails(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  shape: RoundedRectangleBorder(),
                ),
                child: Row(
                  children: [
                    leadingIcon,
                    SizedBox(width: 15.w),

                    /// QUOTE NAME
                    Expanded(
                      child: Text(
                        quote.name,
                        style: AppTextStyle.normalRegular15.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),

                    /// QUOTE STATUS
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.w),
                      decoration: BoxDecoration(
                        color: statusBackgroundColor,
                        border: Border.all(
                          color: statusBorderColor,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            AppAsset.icClock,
                            color: statusPrimaryColor,
                            width: 12.w,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            statusLabel,
                            style: AppTextStyle.normalSemiBold12
                                .copyWith(color: statusPrimaryColor),
                          ),
                        ],
                      ),
                    ),

                    /// QUOTE AMOUNT
                    SizedBox(
                      width: 65.w,
                      child: Text(
                        '\$${quote.amount.toStringAsFixed(0)}',
                        textAlign: TextAlign.right,
                        style: AppTextStyle.normalSemiBold15
                            .copyWith(color: AppColor.fff05a29),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 10.w),
      ],
    );
  }

  Widget buildCommentsContent() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: comments.length,
            separatorBuilder: (context, index) => SizedBox(height: 15.w),
            itemBuilder: (context, index) {
              final comment = comments.elementAt(index);
              return CommentMessage(comment: comment);
            },
          ),
        ),
        SizedBox(height: 20.w),
        buildHorizontalDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.w),
          child: Container(
            height: 46.w,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColor.fff05a29,
                shape: RoundedRectangleBorder(),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.w),
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  'Reply in conversation',
                  style: AppTextStyle.normalSemiBold15
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContactDetailsItem(String label, String data) {
    return Row(
      children: [
        Text(
          label,
          style:
              AppTextStyle.normalRegular15.copyWith(color: AppColor.ff747474),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Row(
            children: [
              Spacer(),
              Visibility(
                visible: label == 'Customer type',
                child: Image.asset(
                  AppAsset.icAgency,
                  width: 18.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                data,
                style: AppTextStyle.normalSemiBold15.copyWith(
                    color: label == 'Customer Phone Number'
                        ? AppColor.fff05a29
                        : Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContactDetailsAddress(String label, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              AppTextStyle.normalRegular15.copyWith(color: AppColor.ff747474),
        ),
        SizedBox(height: 5.w),
        Text(
          data,
          style: AppTextStyle.normalRegular15.copyWith(color: Colors.black),
        ),
      ],
    );
  }

  Widget buildContactDetailsOweAmount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Remaining Amount owe to you is',
          style: AppTextStyle.normalSemiBold15,
        ),
        SizedBox(height: 21.w),
        Text(
          '\$453.00',
          style: AppTextStyle.normalBold36.copyWith(color: AppColor.ff31b3f0),
        ),
      ],
    );
  }

  Widget buildStatusChangeButton(BuildContext context) {
    Widget leading = Icon(
      Icons.add_circle_outline_rounded,
      color: Colors.white,
      size: 18.w,
    );
    return SizedBox(
      height: 34.w,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColor.ff5cb85c,
          shape: RoundedRectangleBorder(),
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
        ),
        onPressed: () async {
          switch (jobStatus.value) {
            case JobStatus.Active:
              jobStatus.value = JobStatus.Booked;
              screenTitle.value = 'Booked';
              actionTitle.value = 'START NAVIGATION FOR COLLECTION';
              leading = Container(
                width: 18.w,
                height: 18.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Image.asset(
                    AppAsset.icNavigate,
                    width: 10.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
              break;
            case JobStatus.Booked:
              jobStatus.value = JobStatus.Collected;
              actionTitle.value = 'MARK AS COLLECTED';
              leading = Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
                size: 18.w,
              );
              break;
            case JobStatus.Collected:
              await Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (_, __, ___) => MaskAsCollectedBottomSheet(),
                ),
              );
              jobStatus.value = JobStatus.ReadyForDelivery;
              screenTitle.value = 'In Transit';
              actionTitle.value = 'START NAVIGATION FOR DELIVERY';
              leading = Container(
                width: 18.w,
                height: 18.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Image.asset(
                    AppAsset.icNavigate,
                    width: 10.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
              break;
            case JobStatus.ReadyForDelivery:
              jobStatus.value = JobStatus.InTransit;
              actionTitle.value = 'MARK AS DELIVERED';
              leading = Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
                size: 18.w,
              );
              break;
            case JobStatus.InTransit:
              await Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (_, __, ___) => MaskAsDeliveredBottomSheet(),
                ),
              );
              jobStatus.value = JobStatus.Delivered;
              screenTitle.value = 'Delivered';
              actionTitle.value = 'RESTART';
              break;
            case JobStatus.Delivered:
              jobStatus.value = JobStatus.Active;
              screenTitle.value = 'Active';
              actionTitle.value = 'ADD A QUOTE';
              leading = Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.white,
                size: 18.w,
              );
              break;
            default:
          }
        },
        child: Obx(() => Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leading,
                  SizedBox(width: 5.w),
                  Text(
                    actionTitle.value,
                    style: AppTextStyle.normalSemiBold12
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

enum QuoteStatus { Active, Withdrawn, Accepted }
enum QuoteType { Agency, TruckOwner }

class Quote {
  final QuoteType type;
  final String name;
  final QuoteStatus status;
  final double amount;

  Quote({
    required this.type,
    required this.name,
    required this.status,
    required this.amount,
  });
}
