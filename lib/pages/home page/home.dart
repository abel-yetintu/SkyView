import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sky_view/pages/home%20page/bottom_widget.dart';
import 'package:sky_view/pages/home%20page/top_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
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
                    width: 22,
                    height: 22,
                    color: Colors.grey[100],
                  ),
                  onPressed: () {},
                ),
              ),
              Column(
                children: [
                  Text(
                    'Yogyakarta, Indonesia',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Thursday, 05 June 2024',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[300],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 10, 98, 230),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.location_on,
                  color: Colors.grey[100],
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TopWidget(),
          ),
          BottomWidget(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(100, 0, 100, 8),
        child: GNav(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          tabBackgroundColor: Colors.white,
          tabBorderRadius: 12,
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
        ),
      ),
    );
  }
}
