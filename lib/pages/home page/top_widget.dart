import 'package:flutter/material.dart';
import 'package:sky_view/pages/home%20page/info_bar.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 10, 98, 230),
            Color.fromARGB(255, 11, 3, 94),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: Scaffold.of(context).appBarMaxHeight! + 20),
        child: Column(
          children: [
            SizedBox(
              width: 125,
              child: Image.asset('assets/images/cloudy.png'),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '29°',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[200],
                fontSize: 65,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sunny Morning',
              style: TextStyle(color: Colors.grey[200], fontSize: 16),
            ),
            const SizedBox(
              height: 32,
            ),
            const InfoBar(),
          ],
        ),
      ),
    );
  }
}
