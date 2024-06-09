import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/providers/navigation_provider.dart';
import 'pages/home page/home.dart';
import 'pages/search page/search.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  final List<Widget> _pages = const [Home(), Search()];

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigation = Provider.of<NavigationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: _pages[navigation.pageIndex],
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
          selectedIndex: navigation.pageIndex,
          onTabChange: (value) {
            navigation.changePage(value);
          },
        ),
      ),
    );
  }
}
