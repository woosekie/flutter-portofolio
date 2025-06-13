import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Get in touch',
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
          Text(
            'Contact Me',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 18,
            runSpacing: 16,
            children: [
              ContactItem(
                icon: Icons.email,
                label: 'Email',
                url: 'mailto:your.rizkynuansa2@gmail.com',
              ),
              ContactItem(
                icon: FontAwesomeIcons.whatsapp,
                label: 'WhatsApp',
                url: 'https://wa.me/6288235928812',
              ),
              ContactItem(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                url: 'https://www.linkedin.com/in/rizkynuansa',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const ContactItem({
    required this.icon,
    required this.label,
    required this.url,
    super.key,
  });

  void _launchURL() async {
    final uri = Uri.parse(url);
    final launchMode = kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication;

    if (!await launchUrl(uri, mode: launchMode)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 210,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.black,
              child: Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
