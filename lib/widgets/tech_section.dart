import 'package:flutter/material.dart';

class FamiliarTechnologySection extends StatelessWidget {
  const FamiliarTechnologySection({super.key});

  final List<Map<String, String>> skills = const [
    {'name': 'Android Studio', 'level': 'Experienced'},
    {'name': 'Figma', 'level': 'Intermediate'},
    {'name': 'Firebase', 'level': 'Intermediate'},
    {'name': 'Kotlin', 'level': 'Experienced'},
    {'name': 'Java', 'level': 'Intermediate'},
    {'name': 'MySQL', 'level': 'Intermediate'},
    {'name': 'SQLite', 'level': 'Intermediate'},
    {'name': 'Git', 'level': 'Intermediate'},
    {'name': 'RESTful APIs', 'level': 'Intermediate'},
    {'name': 'Flutter Framework', 'level': 'Basic'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Explore my',
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 4),
          // Text(
          //   'Experience',
          //   style: Theme.of(context).textTheme.headline5?.copyWith(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 32,
          //       ),
          // ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Familiar Technology',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 40,
                  runSpacing: 24,
                  children: skills.map((skill) {
                    return SizedBox(
                      width: 140,
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.black),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                skill['name']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                skill['level']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
