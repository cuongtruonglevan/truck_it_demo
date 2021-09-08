import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/app_color.dart';

Widget buildHorizontalDivider() =>
    Container(height: 1.w, color: AppColor.ffe0e0e0);
Widget buildVerticalDivider() =>
    Container(width: 1.w, color: AppColor.ffe0e0e0);

Widget appTransitionBuilder(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
