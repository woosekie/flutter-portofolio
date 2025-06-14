import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
      child: Column(
        children: [
          Text(
            'Get to know more',
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
          Text(
            'About Me',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              children: const [
                TextSpan(
                    text: 'Mobile Developer with a solid foundation in '),
                TextSpan(
                  text: 'computer science',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text:
                        ' and hands-on experience in building and maintaining '),
                TextSpan(
                  text: 'production-level mobile applications.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' Experienced in developing '),
                TextSpan(
                  text: 'digital banking and stock trading apps',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' using '),
                TextSpan(
                  text: 'Kotlin, Android SDK, Jetpack components',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text:
                        ' (MVVM, Navigation, Room), and third-party tools such as '),
                TextSpan(
                  text: 'Firebase, Retrofit, and CameraX.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text:
                        ' Actively involved in cross-functional teams to deliver '),
                TextSpan(
                  text: 'scalable, high-quality solutions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: ' in agile environments. Passionate about '),
                TextSpan(
                  text: 'clean architecture, performance optimization,',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text:
                        ' and continuous learning in mobile technologies. Eager to contribute to '),
                TextSpan(
                  text: 'impactful projects',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' and grow within a '),
                TextSpan(
                  text: 'dynamic engineering team.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
