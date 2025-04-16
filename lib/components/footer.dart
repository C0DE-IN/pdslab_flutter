import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<Map<String, dynamic>> socialMediaData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSocialMediaData();
  }

  Future<void> _loadSocialMediaData() async {
    try {
      final String jsonString = await rootBundle
          .loadString('lib/assets/data/social-media/social_media_data.json');
      final List<dynamic> jsonData = json.decode(jsonString);

      if (mounted) {
        setState(() {
          socialMediaData = jsonData.cast<Map<String, dynamic>>();
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildSocialIcon(Map<String, dynamic> data) {
    final String iconPath = data['imgSrc'];
    final String link = data['link'];
    final double padd = data['padding'] ?? 0;
    final Color textColor =
        Color(int.parse(data['txtColor'].replaceFirst('#', '0xFF')));
    final String text = data['text'] ?? data['id'] ?? '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Tooltip(
        message: text,
        child: InkWell(
          onTap: () => _launchUrl(link),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 48,
            height: 48,
            padding: EdgeInsets.all(padd),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.contain,
                  placeholderBuilder: (BuildContext context) {
                    return Center(
                      child: Text(
                        text.substring(0, 1),
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  semanticsLabel: text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 100,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: socialMediaData.map((data) {
              return _buildSocialIcon(data);
            }).toList(),
          ),
          const SizedBox(height: 16),
          Text(
            ' ${DateTime.now().year} Mitochondrial Biology Lab. All rights reserved.',
            style: TextStyle(
              color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
