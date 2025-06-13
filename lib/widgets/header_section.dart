import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portofolio_flutter/controllers/home_controller.dart';
import 'package:get/get.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 760; // breakpoint: 600px

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return isMobile
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left: Title
                    Text(
                      'Portofolio',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    // Right: Modern Styled Dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text(
                            'Menu',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          onChanged: (value) {
                            switch (value) {
                              case 'About':
                                controller.scrollToSection(controller.aboutKey);
                                break;
                              case 'Experience':
                                controller
                                    .scrollToSection(controller.experienceKey);
                                break;
                              case 'Project':
                                controller
                                    .scrollToSection(controller.projectKey);
                                break;
                              case 'Contact':
                                controller
                                    .scrollToSection(controller.contactKey);
                                break;
                            }
                          },
                          items: <String>[
                            'About',
                            'Experience',
                            'Project',
                            'Contact'
                          ]
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Text(
                      'Portofolio',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        // _NavItem(title: 'Home', onTap: () => controller.scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut)),
                        _NavItem(
                            title: 'About',
                            onTap: () => controller
                                .scrollToSection(controller.aboutKey)),
                        _NavItem(
                            title: 'Experience',
                            onTap: () => controller
                                .scrollToSection(controller.experienceKey)),
                        _NavItem(
                            title: 'Project',
                            onTap: () => controller
                                .scrollToSection(controller.projectKey)),
                      ],
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () =>
                          controller.scrollToSection(controller.contactKey),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                      ),
                      child: Text(
                        'Contact',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
