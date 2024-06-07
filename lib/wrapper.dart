import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sky_view/pages/home%20page/home.dart';
import 'package:sky_view/pages/search%20page/search.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<Widget> _pages = const [Home(), Search()];
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: _currentPageIndex == 0
          ? AppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              title: Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 10, 98, 230),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/degree_c.png',
                          width: 20.w,
                          height: 20.h,
                          color: Colors.grey[100],
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.0.w),
                        child: Column(
                          children: [
                            Text(
                              'Addis Ababa, Ethiopia',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[200],
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              'Thursday, 05 June 2024',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[300],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 10, 98, 230),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/pin.png',
                          width: 20.w,
                          height: 20.h,
                          color: Colors.grey[100],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: _pages[_currentPageIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(100.w, 0, 100.w, 8.h),
        child: GNav(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          tabBackgroundColor: Colors.white,
          tabBorderRadius: 12.r,
          color: Colors.white,
          activeColor: Colors.grey.shade900,
          tabs: const [
            GButton(
              icon: Icons.home,
              iconColor: Colors.white,
              text: '',
            ),
            GButton(
              icon: Icons.search,
              iconColor: Colors.white,
              text: '',
            )
          ],
          selectedIndex: _currentPageIndex,
          onTabChange: (value) {
            setState(() {
              _currentPageIndex = value;
            });
          },
        ),
      ),
    );
  }
}
