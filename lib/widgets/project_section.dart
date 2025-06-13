import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portofolio_flutter/data/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectSection extends StatelessWidget {

  ProjectSection({super.key});

  final List<ProjectItem> projects = [
    ProjectItem(
        title: 'DIGI by Bank BJB',
        description:
            'DIGI service by bank bjb in the form of mobile banking. Perform e-banking transactions in real time.',
        imagePath: 'assets/overview_digi.jpg',
        playstoreUrl:
            'https://play.google.com/store/apps/details?id=gurilap.bjbmobile&hl=id'),

    ProjectItem(
        title: 'bjb BiSA!',
        description:
            'Laku Pandai bjb BiSA! application is a mobile application developed for use by Laku Pandai bjb BiSA Agents.',
        imagePath: 'assets/overview_lakpan.jpg',
        playstoreUrl:
            'https://play.google.com/store/apps/details?id=io.lakupandai&hl=id'),
    ProjectItem(
      title: 'Pokebuddy',
      description:
          'Pokemon-themed application with flutter for submission on the dicoding platform class.',
      imagePath: 'assets/overview_pokebuddy.jpg',
      githubUrl:
          'https://github.com/woosekie/Belajar-Membuat-Aplikasi-Flutter-untuk-Pemula-Submission',
      dribbbleUrl: 'https://dribbble.com/shots/22935703-Pokebuddy',
    ),
    ProjectItem(
      title: 'Catering Apps',
      description:
          'Catering ordering application, allowing ordering food to be provided at events on certain days.',
      imagePath: 'assets/overview_catering.jpg',
      githubUrl: 'https://github.com/woosekie/KedaiMbakTimApp',
      dribbbleUrl:
          'https://dribbble.com/shots/22224803-UI-Design-Catering-Ordering-App',
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Browse my recent',
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
          Text(
            'Projects',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: projects
                .map((project) => ProjectCard(project: project))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectItem project;

  const ProjectCard({required this.project, super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageWidget = project.isAssetImage
        ? Image.asset(
            project.imagePath,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          )
        : Image.network(
            project.imagePath,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 160,
              color: Colors.grey[200],
              child: const Center(child: Icon(Icons.broken_image)),
            ),
          );
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 👇 Gambar Preview
          ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: imageWidget),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 54,
                  child: Text(
                    project.description,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (project.githubUrl != null)
                      IconButton(
                        onPressed: () => _launchURL(project.githubUrl!),
                        icon: const Icon(FontAwesomeIcons.github),
                        tooltip: 'View on GitHub',
                        color: Colors.black,
                      ),
                    if (project.dribbbleUrl != null)
                      IconButton(
                        onPressed: () => _launchURL(project.dribbbleUrl!),
                        icon: const Icon(FontAwesomeIcons.dribbble),
                        tooltip: 'View on Dribbble',
                        color: Colors.pink,
                      ),
                    if (project.playstoreUrl != null)
                      IconButton(
                        onPressed: () => _launchURL(project.playstoreUrl!),
                        icon: const Icon(FontAwesomeIcons.googlePlay),
                        tooltip: 'View on Playstore',
                        color: const Color(0xFF01875F),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
