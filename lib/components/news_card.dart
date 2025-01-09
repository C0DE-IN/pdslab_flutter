import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pdslab/assets/data/news/news_model.dart';

class NewsCard extends StatefulWidget {
  final NewsModel news;
  final bool isActive;

  const NewsCard({
    super.key,
    required this.news,
    required this.isActive,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  int columnIndex = 0;
  int headlineIndex = 0;
  int placeDateIndex = 0;
  Timer? _timer;
  bool isAnimationComplete = false;

  @override
  void initState() {
    super.initState();
    if (widget.isActive) {
      _resetAndStartAnimation();
    }
  }

  @override
  void didUpdateWidget(NewsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive) {
      if (!oldWidget.isActive || widget.news != oldWidget.news) {
        _resetAndStartAnimation();
      }
    } else {
      _stopAnimation();
    }
  }

  void _resetAndStartAnimation() {
    _stopAnimation();
    setState(() {
      columnIndex = 0;
      headlineIndex = 0;
      placeDateIndex = 0;
      isAnimationComplete = false;
    });
    _startAnimation();
  }

  void _stopAnimation() {
    _timer?.cancel();
    _timer = null;
  }

  void _startAnimation() {
    const animationSpeed = Duration(milliseconds: 30);
    _timer = Timer.periodic(animationSpeed, (timer) {
      if (!mounted || isAnimationComplete) {
        timer.cancel();
        return;
      }

      setState(() {
        // First animate column if exists
        if (widget.news.column != null &&
            columnIndex < widget.news.column!.length) {
          columnIndex++;
        }
        // Then animate headline
        else if (headlineIndex < widget.news.headline.length) {
          headlineIndex++;
        }
        // Finally animate place_date if it exists
        else if (widget.news.placeDate != null &&
            widget.news.placeDate!.isNotEmpty &&
            placeDateIndex < widget.news.placeDate!.length) {
          placeDateIndex++;
        } else {
          isAnimationComplete = true;
          timer.cancel();
        }
      });
    });
  }

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(widget.news.link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void dispose() {
    _stopAnimation();
    super.dispose();
  }

  String _safeSubstring(String text, int end) {
    if (end <= 0) return '';
    return text.substring(0, end.clamp(0, text.length));
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: _launchURL,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo at the top center
              Center(
                child: SvgPicture.asset(
                  widget.news.logo,
                  height: 60,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Column text if exists
              if (widget.news.column != null &&
                  widget.news.column!.isNotEmpty) ...[
                Text(
                  _safeSubstring(widget.news.column!, columnIndex),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
              ],
              // Headline
              Text(
                _safeSubstring(widget.news.headline, headlineIndex),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              // Poster image for blog type
              if (widget.news.type == 'blog' && widget.news.poster != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 200,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.news.poster!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              // Place and date at the bottom for paper type
              if (widget.news.type == 'paper' &&
                  widget.news.placeDate?.isNotEmpty == true) ...[
                Text(
                  _safeSubstring(widget.news.placeDate!, placeDateIndex),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.grey[300] : Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 4),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
