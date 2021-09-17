import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/screens/chat_room/chat_room_screen.dart';
import 'package:truckit_demo/screens/message_center/widgets/message_advance_search.dart';
import 'package:truckit_demo/screens/message_center/widgets/message_center_item.dart';
import 'package:truckit_demo/screens/message_center/widgets/message_filter_bottom_sheet.dart';
import 'package:truckit_demo/shared/shared.dart';

class MessageCenterScreen extends StatelessWidget {
  MessageCenterScreen({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  final List<AppMessage> messages = [
    AppMessage(
        title: 'XT14 Electric Caravan',
        fromTo: 'Surrey Hills, NSW 2040 to Sunny Park, ACT 3350',
        name: 'christie',
        time: '26 Dec',
        unRead: false),
    AppMessage(
        title: 'Mitsubishi Cordia 2015',
        fromTo: 'Mount Gravatt, QLD 2040 to Wellington Park,',
        name: 'Victoria',
        time: '25 Dec',
        unRead: true),
    AppMessage(
        title: 'Austin A/40',
        fromTo: 'Cannon Hills, QLD 4040 Darlington, VIC 335',
        name: 'Flemington',
        time: '19 Dec',
        unRead: true),
    AppMessage(
        title: 'Asia motor rockstars',
        fromTo: 'Surrey Hills, NSW 2040 to Sunny Park, ACT 3350',
        name: 'Smith',
        time: '15 Dec',
        unRead: false),
    AppMessage(
        title: 'Audi 90',
        fromTo: 'Surrey Hills, NSW 2040 to Sunny Park, ACT 3350',
        name: 'Jonathan',
        time: '13 Dec',
        unRead: false),
    AppMessage(
        title: 'Ford Falcon',
        fromTo: 'Cannon Hills, QLD 4040 Darlington, VIC 335',
        name: 'Rachael',
        time: '07 Dec',
        unRead: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(context),
            buildHorizontalDivider(),
            buildSearchBar(),
            buildAdvanceSearch(context),
            Expanded(child: buildMessagesList()),
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
          SizedBox(width: 56.w),
          Expanded(
            child: Center(
              child: Text(
                'Messages Center',
                style: AppTextStyle.normalSemiBold20,
              ),
            ),
          ),
          SizedBox(
            width: 56.w,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (_, __, ___) => MessageFilterBottomSheet(),
                    transitionsBuilder: appTransitionBuilder,
                  ),
                );
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

  Widget buildSearchBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 12.w, 20.w, 0.0),
      child: SizedBox(
        height: 32.w,
        child: TextFormField(
          controller: searchController,
          textInputAction: TextInputAction.done,
          style:
              AppTextStyle.normalRegular13.copyWith(color: AppColor.ff616161),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 17.w),
            filled: true,
            fillColor: AppColor.ffe4e4e4,
            hintText: 'Search Message',
            hintStyle:
                AppTextStyle.normalRegular13.copyWith(color: AppColor.ff616161),
            suffixIcon:
                Image.asset(AppAsset.icSearch, width: 18.w, height: 18.w),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.w),
              borderSide: BorderSide(color: AppColor.ffe9e6e6, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.w),
              borderSide: BorderSide(color: AppColor.ffe9e6e6, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAdvanceSearch(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (_, __, ___) => MessageAdvanceSearch(),
                transitionsBuilder: appTransitionBuilder,
              ),
            );
          },
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.w),
          ),
          child: Text(
            'Advanced Search',
            style:
                AppTextStyle.normalRegular13.copyWith(color: AppColor.fff05a29),
          ),
        ),
      ],
    );
  }

  Widget buildMessagesList() {
    return ListView.separated(
      itemCount: messages.length,
      padding: EdgeInsets.symmetric(vertical: 10.w),
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: 20),
        child: buildHorizontalDivider(),
      ),
      itemBuilder: (context, index) => MessageCenterItem(
        message: messages.elementAt(index),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChatRoomScreen()));
        },
      ),
    );
  }
}
