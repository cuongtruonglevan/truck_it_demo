import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/shared.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int rating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => buildStar(context, index),
        ),
      ),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Widget icon;
    if (index >= rating) {
      icon = Image.asset(
        AppAsset.icRatingEmpty,
        width: 18.w,
        height: 18.w,
        fit: BoxFit.fitWidth,
      );
    } else {
      icon = Image.asset(
        AppAsset.icRatingFilled,
        width: 18.w,
        height: 18.w,
        fit: BoxFit.fitWidth,
      );
    }
    return InkResponse(
      onTap: () {
        setState(() {
          rating = index + 1;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 5),
        child: icon,
      ),
    );
  }
}
