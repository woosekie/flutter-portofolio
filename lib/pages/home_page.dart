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
import 'package:animate_do/animate_do.dart';

import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 760; 
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        }

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFE0B2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.topLeft,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: isMobile ? const EdgeInsets.only(top: 104) : const EdgeInsets.only(top: 80),
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    children: [
                      FadeInUp(child: BodySection()),
                      FadeOnScroll(child: AboutSection(key: controller.aboutKey)),
                      FadeOnScroll(child: ExperienceSection(key: controller.experienceKey)),
                      FadeOnScroll(child: ProjectSection(key: controller.projectKey)),
                      FadeOnScroll(child: ContactSection(key: controller.contactKey)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          'managed by rizky',
                          style: GoogleFonts.pacifico(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: HeaderSection(),
              ),
            ],
          ),
        );
      }),
    );
  }
}


class FadeOnScroll extends StatefulWidget {
  final Widget child;

  const FadeOnScroll({super.key, required this.child});

  @override
  State<FadeOnScroll> createState() => _FadeOnScrollState();
}

class _FadeOnScrollState extends State<FadeOnScroll>
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.2 && !_visible) {
      _controller.forward();
      _visible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? UniqueKey(),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _animation,
        child: widget.child,
      ),
    );
  }
}
