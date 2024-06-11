import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/providers/navigation_provider.dart';
import 'package:sky_view/utils/app_exception.dart';

class ErrorInfo extends StatelessWidget {
  final AppException appException;
  const ErrorInfo({super.key, required this.appException});

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigation = Provider.of<NavigationProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 223, 27, 27),
            Color.fromARGB(255, 106, 28, 28),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 125.w,
            child: Image.asset('assets/icons/error.png'),
          ),
          SizedBox(height: 8.w),
          Text(
            appException.message,
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(width: 2.w, color: Colors.white),
            ),
            child: const Text("Try again"),
            onPressed: () {
              navigation.changePage(1);
            },
          )
        ]),
      ),
    );
  }
}
