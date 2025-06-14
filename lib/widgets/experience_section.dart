import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({super.key});

  final List<ExperienceItem> experiences = [
    ExperienceItem(
      title: 'Information Technology Degrees',
      subtitle: 'Universitas Brawijaya',
      duration: '2019 - 2023',
      description:
          'Learn the basics of programming, data structures, databases, and mobile and web application development.',
    ),
    ExperienceItem(
      title: 'Mobile Developer Participant',
      subtitle: 'Bangkit Academy by Google & Goto',
      duration: '2022',
      description:
          'Bangkit is an educational program designed to prepare students with skills for a career in the world of technology.',
    ),
    ExperienceItem(
      title: 'Mobile Developer',
      subtitle: 'PT Reka Cipta Solusi',
      duration: '2024 - 2025',
      description:
          'Develop Android applications using Flutter and Kotlin, integrate with Back-End, and assist testing of developed features.',
    ),
  ];

  final List<Technology> technologies = [
    Technology(name: 'Android', icon: SimpleIcons.androidstudio),
    Technology(name: 'Flutter', icon: SimpleIcons.flutter),
    Technology(name: 'Kotlin', icon: SimpleIcons.kotlin),
    Technology(name: 'Firebase', icon: SimpleIcons.firebase),
    Technology(name: 'Git', icon: SimpleIcons.git),
    Technology(name: 'Figma', icon: SimpleIcons.figma),
    Technology(name: 'Postman', icon: SimpleIcons.postman),
    Technology(name: 'JSON', icon: SimpleIcons.json),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1200;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
      child: Column(
        children: [
          // Header
          Text(
            'Explore my',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            'Experience & Tools',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),

          // Responsive Layout
          isMobile
              ? Column(
                  children: [
                    _buildExperienceCard(),
                    const SizedBox(height: 24),
                    _buildTechnologyWrap(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _buildExperienceCard()),
                    const SizedBox(width: 32),
                    Expanded(flex: 2, child: _buildTechnologyWrap()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard() {
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < experiences.length; i++)
            _ExperienceTile(
              item: experiences[i],
              isFirst: i == 0,
              isLast: i == experiences.length - 1,
            ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }

  Widget _buildTechnologyWrap() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children:
          technologies.map((tech) => _TechnologyCard(tech: tech)).toList(),
    );
  }
}

class ExperienceItem {
  final String title;
  final String subtitle;
  final String duration;
  final String description;

  ExperienceItem({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.description,
  });
}

class _ExperienceTile extends StatelessWidget {
  final ExperienceItem item;
  final bool isFirst;
  final bool isLast;

  const _ExperienceTile({
    required this.item,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline visual
        Column(
          children: [
            if (!isFirst)
              Container(
                height: isMobile ? 7 : 8,
                width: 2,
                color: Colors.orange,
              ),
            Container(
              width: 12,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                height: isMobile ? 112 : 90,
                width: 2,
                color: Colors.orange,
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${item.subtitle} • ${item.duration}',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  item.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Technology {
  final String name;
  final IconData icon;

  Technology({required this.name, required this.icon});
}

class _TechnologyCard extends StatelessWidget {
  final Technology tech;

  const _TechnologyCard({required this.tech});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
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
      child: Column(
        children: [
          Icon(
            tech.icon,
            size: 28,
            color: Colors.black,
          ),
          const SizedBox(height: 12),
          Text(
            tech.name,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
