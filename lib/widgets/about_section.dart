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
               children: [
                 const TextSpan(text: 'Experienced in crafting '),
                 TextSpan(
                   text: 'mobile apps ',
                   style: const TextStyle(fontWeight: FontWeight.bold),
                 ),
                 const TextSpan(text: 'that deliver performance and design. '),
                 const TextSpan(text: 'e apps the apps that deliver '),
                 TextSpan(
                   text: 'performance',
                   style: const TextStyle(fontWeight: FontWeight.bold),
                 ),
                 const TextSpan(text: ' andat deliver performance and e apps that deliver '),
                 TextSpan(
                   text: 'performance',
                   style: const TextStyle(fontWeight: FontWeight.bold),
                 ),
                 const TextSpan(text: ' e apps that deliver performance andand. '),
                 const TextSpan(text: 'Experienced in crafting '),
                 TextSpan(
                   text: 'mobile apps ',
                   style: const TextStyle(fontWeight: FontWeight.bold),
                 ),
                 const TextSpan(text: 'that deliver performance and design. e apps the apps that deliver '),
                 TextSpan(
                   text: 'performance',
                   style: const TextStyle(fontWeight: FontWeight.bold),
                 ),
                 const TextSpan(text: ' andat deliver performance and e apps that deliver '),
                 TextSpan(
                   text: 'performance',
                   style: const TextStyle(fontWeight: FontWeight.bold),
                 ),
                 const TextSpan(text: ' e apps that deliver performance andand.'),
               ],
             ),
           ),
                const SizedBox(height: 24),
         
        ],
      ),
    );
  }
}