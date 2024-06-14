import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/models/recent_location.dart';
import 'package:sky_view/pages/search%20page/recent_location_card.dart';
import 'package:sky_view/providers/recent_locations_provider.dart';
import 'package:sky_view/utils/shimmer_widget.dart';

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
        Consumer<RecentLocationsProvider>(
          builder: (context, value, child) {
            return FutureBuilder(
                future: value.getRecentLocations(),
                initialData: [],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: ShimmerWidget.rectangular(
                              height: 40.h,
                              width: double.infinity,
                              shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasData) {
                    var recentLocations = snapshot.data as List<RecentLocation>;
                    if (recentLocations.isEmpty) {
                      return SizedBox(
                        height: 10.h,
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: recentLocations.length,
                          itemBuilder: (context, index) {
                            return RecentLocationCard(
                              recentLocation: recentLocations[index],
                            );
                          },
                        ),
                      );
                    }
                  } else {
                    return Container(
                      padding: EdgeInsets.only(top: 32.h),
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.grey,
                            size: 120.w,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            snapshot.error.toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    );
                  }
                });
          },
        )
      ],
    );
  }
}
