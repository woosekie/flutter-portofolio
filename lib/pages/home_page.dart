import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portofolio_flutter/widgets/about_section.dart';
import 'package:my_portofolio_flutter/widgets/body_section.dart';
import 'package:my_portofolio_flutter/widgets/contact_section.dart';
import 'package:my_portofolio_flutter/widgets/experience_section.dart';
import 'package:my_portofolio_flutter/widgets/header_section.dart';
import 'package:my_portofolio_flutter/widgets/project_section.dart';
import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            const HeaderSection(),
            const Divider(color: Colors.black12, thickness: 1, height: 8),
            BodySection(),
            AboutSection(key: controller.aboutKey),
            ExperienceSection(key: controller.experienceKey),
            ProjectSection(key: controller.projectKey),
            ContactSection(key: controller.contactKey),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(
                'managed by rizky',
                style: GoogleFonts.pacifico(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
