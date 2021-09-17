import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/screens/job_details/widgets/comment_message.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:get/get.dart';

class ChatRoomScreen extends StatefulWidget {
  ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final newMessageController = TextEditingController();

  final newMessageNode = FocusNode();

  final showTools = false.obs;

  final comments = [
    Comment(
        user: 'christie', content: 'When can you pickup?', time: '25/12 16:33'),
    Comment(
        user: 'me',
        content: 'Are you flexible on Sunday? I can quote you a best price',
        time: '26/12 12:50'),
    Comment(user: 'christie', content: 'No, I’m in hurry', time: '26/12 17:10'),
    Comment(
        user: 'christie',
        content: 'Or latest by this weekend?',
        time: '27/12 17:39'),
    Comment(user: 'me', content: 'Okay, I’ll try my best', time: '26/12 12:50'),
  ];

  @override
  initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
          showTools.value = false;
        },
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppBar(context),
                  buildRoad(),
                  buildTabs(),
                  buildTime(),
                  buildHorizontalDivider(),
                  buildViewListingButton(),
                  buildHorizontalDivider(),
                  Expanded(
                    child: Container(
                      color: AppColor.fff4f2f1,
                      child: ListView.separated(
                        itemCount: comments.length,
                        padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 100.w),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.w),
                        itemBuilder: (context, index) {
                          final comment = comments.elementAt(index);
                          return CommentMessage(comment: comment);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Obx(
                  () => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.w),
                        height: 80.w,
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.add_circle_outline_rounded,
                              color: AppColor.ff505050,
                              size: 20.w,
                            ),
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                  controller: newMessageController,
                                  focusNode: newMessageNode,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  maxLines: 5,
                                  style: AppTextStyle.normalSemiBold13
                                      .copyWith(color: AppColor.ff343434),
                                  scrollPadding: EdgeInsets.zero,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 11.w),
                                    hintText: 'Write your message',
                                    hintStyle: AppTextStyle.normalSemiBold13
                                        .copyWith(color: AppColor.ff9b9a9a),
                                    border: InputBorder.none,
                                  ),
                                  onTap: () {
                                    showTools.value = true;
                                  },
                                  onEditingComplete: () {
                                    showTools.value = false;
                                  },
                                  onFieldSubmitted: (text) {
                                    showTools.value = false;
                                  },
                                  onSaved: (text) {
                                    showTools.value = false;
                                  },

                                  /// TODO: DELETE AFTER ANDREW CONFIRMED
                                  // onChanged: (text) {
                                  //   if (text.isNotEmpty) {
                                  //     showTools.value = true;
                                  //   } else {
                                  //     showTools.value = false;
                                  //   }
                                  // },
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                newMessageController.clear();
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus &&
                                    currentFocus.focusedChild != null) {
                                  currentFocus.focusedChild!.unfocus();
                                  showTools.value = false;
                                }
                              },
                              child: Image.asset(
                                AppAsset.icSendMessage,
                                width: 20.w,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: showTools.value,
                          child: buildHorizontalDivider()),
                      Visibility(
                        visible: showTools.value,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.fromLTRB(22.w, 9.w, 22.w, 9.w),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.fff3f3f3,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        AppAsset.icPhoto,
                                        width: 20.w,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Text('Photos',
                                      style: AppTextStyle.normalRegular13),
                                ],
                              ),
                              SizedBox(width: 20.w),
                              Column(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.fff3f3f3,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        AppAsset.icAttach,
                                        width: 20.w,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Text('Attachment',
                                      style: AppTextStyle.normalRegular13),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
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
                'XT14 Electric Caravan',
                style: AppTextStyle.normalSemiBold20,
              ),
            ),
          ),
          SizedBox(width: 56.w)
        ],
      ),
    );
  }

  Widget buildRoad() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAsset.icMapLocation,
          width: 8.w,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(width: 5.w),
        Text(
          'Surrey Hills, NSW 2040',
          style:
              AppTextStyle.normalSemiBold12.copyWith(color: AppColor.ff6b6b6b),
        ),
        SizedBox(width: 5.w),
        Icon(
          Icons.arrow_right_alt_sharp,
          size: 12.w,
        ),
        SizedBox(width: 5.w),
        Image.asset(
          AppAsset.icMapLocation,
          width: 8.w,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(width: 5.w),
        Text(
          'Sunny Park, ACT 3350',
          style:
              AppTextStyle.normalSemiBold12.copyWith(color: AppColor.ff6b6b6b),
        ),
      ],
    );
  }

  Widget buildTabs() {
    return DefaultTabController(
      length: 4,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Spacer(),
                buildHorizontalDivider(),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: getTabBar(
              onTap: (i) {},
              tabs: [
                Tab(
                  text: '\$4215',
                ),
                Tab(
                  text: '\$4304',
                ),
                Tab(
                  child: Text(
                    '\$3720',
                    style: AppTextStyle.normalSemiBold13.copyWith(
                        color: AppColor.ff8e8e8e,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
                Tab(
                  text: 'My Comments',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TabBar getTabBar({required List<Widget> tabs, required void onTap(int)}) {
    return TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.symmetric(horizontal: 20),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelStyle: AppTextStyle.normalSemiBold13,
      unselectedLabelStyle: AppTextStyle.normalSemiBold13,
      indicator: BoxDecoration(
          image: DecorationImage(
        alignment: Alignment.bottomCenter,
        image: AssetImage('assets/samples/img_custom_indicator.png'),
      )),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.only(top: 30.w),
      // indicatorWeight: 2,
      // indicatorColor: AppColor.ff5cb85c,
      tabs: tabs,
      onTap: onTap,
    );
  }

  Widget buildTime() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 35.w,
      child: Row(
        children: [
          Text(
            'QUOTE ON 18 DEC 20',
            style: AppTextStyle.normalSemiBold10
                .copyWith(color: AppColor.ff878787),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 9.w),
            width: 4.w,
            height: 4.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.ff848484,
            ),
          ),
          Text(
            'EXPIRES IN 5 DAYS 12 HOURS',
            style: AppTextStyle.normalSemiBold10
                .copyWith(color: AppColor.ff878787),
          ),
        ],
      ),
    );
  }

  Widget buildViewListingButton() {
    return SizedBox(
      height: 35.w,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          minimumSize: Size.zero,
          shape: RoundedRectangleBorder(),
        ),
        child: Row(
          children: [
            Image.asset(
              AppAsset.icBack,
            ),
            SizedBox(width: 10.w),
            Text(
              'View Listing',
              style: AppTextStyle.normalSemiBold13,
            ),
          ],
        ),
      ),
    );
  }
}
