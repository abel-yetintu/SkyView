import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentLocationCard extends StatelessWidget {
  const RecentLocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      color: const Color.fromARGB(255, 18, 18, 18),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Addis Ababa, Ethiopia',
                style: TextStyle(
                  color: Colors.grey[200],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.clear,
                size: 24.r,
                color: Colors.grey[200],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
