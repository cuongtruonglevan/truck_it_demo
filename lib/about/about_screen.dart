import 'dart:math';

import 'package:flutter/material.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  final bodyController = TextEditingController(
      text:
          'Robert Russell has spent his life using his personal truck to help his clients overcome freight services and provide them with the support they need to improve trust and better experiences.');
  final yearController =
      TextEditingController(text: DateTime.now().year.toString());

  final galleries = [
    AppAsset.imgGallery1,
    AppAsset.imgGallery2,
    AppAsset.imgGallery3,
    AppAsset.imgGallery1,
    AppAsset.imgGallery2,
    AppAsset.imgGallery3,
  ].obs;

  final selectedTransport = 'Transport Organisation'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDivider(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(0, 20.w, 0, 38.w),
              child: Column(
                children: [
                  buildBody(),
                  SizedBox(height: 16.w),
                  buildGallery(),
                  SizedBox(height: 18.w),
                  buildProviderType(),
                  SizedBox(height: 17.w),
                  buildSaveButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Image.asset(AppAsset.icBack),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'About',
        style: AppTextStyle.normalSemiBold20,
      ),
      centerTitle: true,
      elevation: 0.0,
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Body',
            style: AppTextStyle.normalSemiBold16,
          ),
          SizedBox(height: 10.w),
          TextFormField(
            controller: bodyController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.done,
            style: AppTextStyle.normalRegular14
                .copyWith(color: AppColor.ff343434, height: 22 / 14),
            maxLines: 4,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColor.ffe9e6e6, width: 1.0),
              ),
              hintText: 'Body content',
              hintStyle: AppTextStyle.normalRegular14
                  .copyWith(color: AppColor.ff646464, height: 22 / 14),
            ),
          ),
          SizedBox(height: 13.w),
          buildToolTip(
              'Do not enter personal or business related contact details!'),
        ],
      ),
    );
  }

  Widget buildGallery() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Text(
              'Gallery',
              style: AppTextStyle.normalSemiBold16,
            ),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColor.fff05a29,
                minimumSize: Size.zero,
                shape: RoundedRectangleBorder(),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.w),
              ),
              onPressed: () {
                galleries.add([
                  AppAsset.imgGallery1,
                  AppAsset.imgGallery2,
                  AppAsset.imgGallery3,
                ].elementAt(Random().nextInt(3)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    color: Colors.white,
                    size: 16.w,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'ADD MORE',
                    style: AppTextStyle.normalSemiBold10
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 16.w),
      SizedBox(
        height: 90.w,
        child: Obx(
          () => ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            scrollDirection: Axis.horizontal,
            itemCount: galleries.length,
            separatorBuilder: (context, index) => SizedBox(width: 5.w),
            itemBuilder: (context, index) {
              final asset = galleries.elementAt(index);
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
                          galleries.removeAt(index);
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
            },
          ),
        ),
      ),
    ]);
  }

  Widget buildProviderType() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Provider Type',
            style: AppTextStyle.normalSemiBold16,
          ),
          SizedBox(height: 14.w),
          Container(
            height: 46.w,
            width: double.infinity,
            decoration:
                BoxDecoration(border: Border.all(color: AppColor.ffe9e6e6)),
            child: Row(
              children: [
                Expanded(
                    child: Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconSize: 24.w,
                      items: <String>[
                        'Transport Organisation',
                        'Transport Organisation',
                        'Transport Organisation',
                        'Transport Organisation'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: AppTextStyle.normalRegular15,
                          ),
                        );
                      }).toList(),
                      hint: Padding(
                        padding: EdgeInsets.only(left: 13.w),
                        child: Text(
                          selectedTransport.value,
                          style: AppTextStyle.normalRegular15,
                        ),
                      ),
                      icon: Padding(
                        padding: EdgeInsets.only(right: 17.w),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      ),
                      onChanged: (value) {
                        selectedTransport.value = value!;
                      },
                    ),
                  ),
                )),
                Container(
                  width: 1.w,
                  color: AppColor.ffe9e6e6,
                ),
                SizedBox(
                  width: 46.w,
                  child: Center(
                    child: Icon(Icons.info_outline_rounded,
                        color: AppColor.fff05a29),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.w),
          TextFormField(
            controller: yearController,
            textInputAction: TextInputAction.done,
            style: AppTextStyle.normalRegular14
                .copyWith(color: AppColor.ff343434, height: 22 / 14),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColor.ffe9e6e6, width: 1.0),
              ),
            ),
          ),
          SizedBox(height: 7.w),
          buildToolTip('In which year did your business commence?'),
        ],
      ),
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: AppColor.fff05a29,
            shape: RoundedRectangleBorder(),
            minimumSize: Size(0, 46.w)),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Text(
            'Save changes',
            style: AppTextStyle.normalSemiBold15.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildToolTip(String content) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: Image.asset(AppAsset.icTriangle),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.w),
          color: AppColor.fffff5f2,
          child: Text(
            content,
            style: AppTextStyle.normalRegular13,
          ),
        ),
      ],
    );
  }

  Widget buildDivider() => Container(height: 1.w, color: AppColor.ffe0e0e0);
}
