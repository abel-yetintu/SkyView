import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 24, 24, 24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
        child: Column(
          children: [
            const SizedBox(
              width: 24,
              height: 24,
              child: Image(
                image: AssetImage('assets/images/cloudy.png'),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              '21°',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              '10 AM',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
