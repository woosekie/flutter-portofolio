import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portofolio_flutter/controllers/home_controller.dart';
import 'dart:html' as html;
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:url_launcher/url_launcher.dart';

class BodySection extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 760; // breakpoint: 600px

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/your_photo.png'),
                ),
                const SizedBox(height: 24),
                buildTextSection(context, isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: buildTextSection(context, isMobile),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        child: SizedBox(
                
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                              child: Image.asset(
                                'assets/your_photo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildTextSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Nanda Permana',
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'From idea to app \nlet’s build something ',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'great.',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isMobile ? 700 : 700),
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              children: const [
                TextSpan(text: 'Experienced in crafting '),
                TextSpan(
                    text: 'mobile apps ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'that deliver performance and design. '),
                TextSpan(text: 'I build apps that deliver '),
                TextSpan(
                    text: 'performance ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'and seamless user experience.'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  '4+',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Projects Completed',
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(width: 32),
            Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  '1+',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Years Experience',
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton(
              onPressed: downloadFileWeb,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              child: Text(
                'Download CV',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  controller.scrollToSection(controller.contactKey),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              child: Text(
                'Contact Info',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          children: [
            _buildSocialIcon(FontAwesomeIcons.linkedin,
                "https://www.linkedin.com/in/rizkynuansa/"),
            _buildSocialIcon(
                FontAwesomeIcons.dribbble, "https://dribbble.com/woosekie"),
            _buildSocialIcon(
                FontAwesomeIcons.github, "https://github.com/woosekie/"),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.black,
      child: IconButton(
        icon: FaIcon(icon, color: Colors.white, size: 18),
        onPressed: () => _launchURL(url),
      ),
    );
  }
}

void downloadFileWeb() {
  const url = 'assets/your_photo.png';
  // ignore: unused_local_variable
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', 'cv.pdf')
    ..click();
}

void _launchURL(String url) async {
  final uri = Uri.parse(url);
  const launchMode =
      kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication;

  if (!await launchUrl(uri, mode: launchMode)) {
    throw 'Could not launch $url';
  }
}
