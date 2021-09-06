import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/shared.dart';

class ItemDetailsGallery extends StatelessWidget {
  ItemDetailsGallery({Key? key}) : super(key: key);

  final sampleItemGalleries = [
    AppAsset.sampleImageJobDetail1,
    AppAsset.sampleImageJobDetail2,
    AppAsset.sampleImageJobDetail1,
    AppAsset.sampleImageJobDetail2,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(20.w),
                      shape: CircleBorder(),
                    ),
                    child: Icon(
                      Icons.highlight_remove_rounded,
                      color: Colors.white,
                      size: 24.w,
                    ),
                  ),
                ],
              ),
              Spacer(),
              ImageSlideshow(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                indicatorColor: Colors.transparent,
                indicatorBackgroundColor: Colors.transparent,
                children: sampleItemGalleries
                    .map((e) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23.w),
                          child: Image.asset(
                            e,
                            fit: BoxFit.fitWidth,
                          ),
                        ))
                    .toList(),
              ),
              Spacer(),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      AppAsset.icSwipe,
                      width: 36.w,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: 7.w),
                    Text(
                      'Swipe to scroll images',
                      style: AppTextStyle.normalSemiBold12
                          .copyWith(color: AppColor.ffc7c7c7),
                    ),
                    SizedBox(height: 41.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
