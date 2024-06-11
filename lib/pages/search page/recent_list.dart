import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_view/pages/search%20page/recent_location_card.dart';

class RecentList extends StatelessWidget {
  const RecentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent locations',
          style: TextStyle(color: Colors.grey, fontSize: 16.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const RecentLocationCard();
            },
          ),
        )
      ],
    );
  }
}
