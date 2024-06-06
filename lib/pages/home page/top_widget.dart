import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_view/pages/home%20page/info_bar.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 10, 98, 230),
            Color.fromARGB(255, 11, 3, 94),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: Scaffold.of(context).appBarMaxHeight! + 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 125.w,
              child: Image.asset('assets/images/cloudy.png'),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '29°',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[200],
                fontSize: 60.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sunny Morning',
              style: TextStyle(color: Colors.grey[200], fontSize: 14.sp),
            ),
            SizedBox(
              height: 24.h,
            ),
            const InfoBar(),
          ],
        ),
      ),
    );
  }
}
