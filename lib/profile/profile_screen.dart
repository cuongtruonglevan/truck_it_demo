import 'package:flutter/material.dart';
import 'package:truckit_demo/about/about_screen.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final galleries = [
    AppAsset.imgGallery1,
    AppAsset.imgGallery2,
    AppAsset.imgGallery3,
    AppAsset.imgGallery1,
    AppAsset.imgGallery2,
    AppAsset.imgGallery3,
  ];

  final categoriesServiced = [
    'Cars',
    'Motorcycles',
    'Boats',
    'Other Vehicles',
    'Moving Hoe or Office',
    'Furniture or Household',
    'Oversize Freight',
    'Shipping Containers',
  ];

  final acceptedPaymentMethods = [
    'Credit Card',
    'PayPal',
  ];

  final acceptedTerms = [
    'Payment up Front',
    'Payment on Delivery',
    'Part Payment up Front',
    'Truckit Pay',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 15.w, 0, 31.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfile(),
            SizedBox(height: 16.w),
            buildLevel(),
            SizedBox(height: 37.w),
            buildAbout(),
            SizedBox(height: 14.w),
            buildProviderType(),
            SizedBox(height: 18.w),
            buildDivider(),
            SizedBox(height: 20.w),
            buildGallery(),
            SizedBox(height: 28.w),
            buildSummary(),
            SizedBox(height: 10.w),
            buildDivider(),
            SizedBox(height: 30.w),
            buildCategoryServiced(),
            SizedBox(height: 31.w),
            buildAcceptedPaymentMethods(),
            SizedBox(height: 31.w),
            buildAcceptedTerms(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Image.asset(AppAsset.icBack),
        onPressed: () {},
      ),
      title: Text(
        'Profile',
        style: AppTextStyle.normalSemiBold20,
      ),
      centerTitle: true,
      elevation: 0.0,
      actions: [
        TextButton(
          child: Row(
            children: [
              Image.asset(AppAsset.icEdit),
              SizedBox(width: 5.w),
              Text(
                'Edit',
                style: AppTextStyle.normalRegular13
                    .copyWith(color: AppColor.ff505050),
              ),
              SizedBox(width: 10.w),
            ],
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AboutScreen()));
          },
        ),
      ],
    );
  }

  Widget buildProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Image.asset(
            AppAsset.imgProfile,
            width: 60.w,
            height: 60.w,
          ),
          SizedBox(width: 16.w),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Robert Russell',
                    style: AppTextStyle.normalSemiBold18,
                  ),
                  SizedBox(width: 8.w),
                  Image.asset(
                    AppAsset.icStar,
                    width: 14.w,
                    height: 14.w,
                  ),
                ],
              ),
              SizedBox(height: 8.w),
              Text(
                'rob@truckit.net',
                style: AppTextStyle.normalRegular13
                    .copyWith(color: AppColor.ff505050),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLevel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 6.w,
              decoration: BoxDecoration(
                color: AppColor.ff5cb85c,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.w),
                  bottomLeft: Radius.circular(5.w),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 6.w,
              decoration: BoxDecoration(
                color: AppColor.ffe0e0e0,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.w),
                  bottomRight: Radius.circular(5.w),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAbout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: AppTextStyle.normalSemiBold16,
          ),
          SizedBox(height: 7.w),
          Text(
            'Robert Russell has spent his life using his personal truck to help his clients overcome freight services and provide them with the support they need to improve trust and better experiences.',
            style: AppTextStyle.normalRegular14
                .copyWith(color: AppColor.ff343434, height: 22 / 14),
          ),
        ],
      ),
    );
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
          Row(
            children: [
              Image.asset(AppAsset.icTransportProvider),
              SizedBox(width: 7.w),
              Text(
                'Transport Organisation',
                style: AppTextStyle.normalRegular14
                    .copyWith(color: AppColor.ff343434, height: 22 / 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildGallery() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text(
          'Gallery',
          style: AppTextStyle.normalSemiBold16,
        ),
      ),
      SizedBox(height: 20.w),
      Container(
        height: 80.w,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          scrollDirection: Axis.horizontal,
          itemCount: galleries.length,
          separatorBuilder: (context, index) => SizedBox(width: 13.w),
          itemBuilder: (context, index) {
            final asset = galleries.elementAt(index);
            return Image.asset(
              asset,
              width: 80.w,
              height: 80.w,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
      SizedBox(height: 28.w),
      Container(
        height: 1.w,
        decoration: BoxDecoration(
          color: AppColor.ffe0e0e0,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              offset: Offset(0, 2),
              spreadRadius: 2.w,
              blurRadius: 2.w,
            ),
          ],
        ),
      ),
    ]);
  }

  Widget buildSummary() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary',
            style: AppTextStyle.normalSemiBold16,
          ),
          SizedBox(height: 10.w),
          summaryItem('Username', 'Instant'),
          summaryItem('Member Since', 'January 2019'),
          summaryItem('Completed Jobs', '32'),
          summaryItem('Positive Feedback', '50%'),
          summaryItem('Membership Status', true),
          summaryItem('GST Registered', 'Registered (2000-07-01)'),
          summaryItem('Year Established', '2005'),
          summaryItem('No. of Employees', '50+'),
          summaryItem('No. of Vehicles', '3'),
          summaryItem('Provider has Insurance?', 'No'),
        ],
      ),
    );
  }

  Widget buildCategoryServiced() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category serviced',
            style: AppTextStyle.normalSemiBold16,
          ),
          SizedBox(height: 18.w),
          Wrap(
            spacing: 9.w,
            runSpacing: 9.w,
            children: categoriesServiced
                .map((category) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.w),
                      color: AppColor.ffe1e0df,
                      child: Text(
                        category,
                        style: AppTextStyle.normalSemiBold12
                            .copyWith(color: AppColor.ff414141),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildAcceptedPaymentMethods() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Accepted Payment Methods',
            style: AppTextStyle.normalSemiBold16,
          ),
          SizedBox(height: 18.w),
          Wrap(
            spacing: 9.w,
            runSpacing: 9.w,
            children: acceptedPaymentMethods
                .map((method) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.w),
                      color: AppColor.ff5cb85c,
                      child: Text(
                        method,
                        style: AppTextStyle.normalSemiBold12
                            .copyWith(color: Colors.white),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildAcceptedTerms() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Accepted Terms',
            style: AppTextStyle.normalSemiBold16,
          ),
          SizedBox(height: 18.w),
          Wrap(
            spacing: 9.w,
            runSpacing: 9.w,
            children: acceptedTerms
                .map((term) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.w),
                      color: term == 'Truckit Pay'
                          ? AppColor.ff31b3f0
                          : AppColor.ff646464,
                      child: Text(
                        term,
                        style: AppTextStyle.normalSemiBold12
                            .copyWith(color: Colors.white),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() => Container(height: 1.w, color: AppColor.ffe0e0e0);

  Widget summaryItem(String label, dynamic content) {
    Widget _content;
    if (content is bool) {
      _content = Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
        color: AppColor.ff5cb85c,
        child: Row(
          children: [
            Icon(Icons.check_circle_outline_rounded,
                size: 14.w, color: Colors.white),
            SizedBox(width: 6.w),
            Text(
              'VERIFIED',
              style:
                  AppTextStyle.normalSemiBold10.copyWith(color: Colors.white),
            ),
          ],
        ),
      );
    } else {
      _content = Text(
        content.toString(),
        style: AppTextStyle.normalSemiBold15,
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w),
      child: Row(
        children: [
          Text(
            label,
            style:
                AppTextStyle.normalRegular15.copyWith(color: AppColor.ff747474),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: FittedBox(child: _content),
            ),
          ),
        ],
      ),
    );
  }
}
