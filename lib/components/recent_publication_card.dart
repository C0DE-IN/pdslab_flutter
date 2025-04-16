import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdslab/assets/data/publication/publication_model.dart';
import 'package:pdslab/components/glass_container.dart';

class RecentPublicationCard extends StatefulWidget {
  final Article article;
  final bool isActive;
  final VoidCallback onAnimationComplete;

  const RecentPublicationCard({
    super.key,
    required this.article,
    required this.isActive,
    required this.onAnimationComplete,
  });

  @override
  State<RecentPublicationCard> createState() => _RecentPublicationCardState();
}

class _RecentPublicationCardState extends State<RecentPublicationCard> {
  int titleIndex = 0;
  int authorsIndex = 0;
  int journalIndex = 0;
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
  void didUpdateWidget(RecentPublicationCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive) {
      if (!oldWidget.isActive || widget.article != oldWidget.article) {
        _resetAndStartAnimation();
      }
    } else {
      _stopAnimation();
    }
  }

  void _resetAndStartAnimation() {
    _stopAnimation();
    setState(() {
      titleIndex = 0;
      authorsIndex = 0;
      journalIndex = 0;
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
        // First animate title
        if (titleIndex < widget.article.title.length) {
          titleIndex++;
        }
        // Then animate authors
        else if (authorsIndex < widget.article.authors.join(', ').length) {
          authorsIndex++;
        }
        // Finally animate journal info
        else if (journalIndex <
            '${widget.article.journal}, ${widget.article.issue}'.length) {
          journalIndex++;
        } else {
          isAnimationComplete = true;
          timer.cancel();
          widget.onAnimationComplete();
        }
      });
    });
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

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(widget.article.link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildGlowButton({required String name, required String link}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () async {
          final Uri url = Uri.parse(link);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: name == 'Highlight'
              ? Colors.blue.withOpacity(0.1)
              : Colors.amber.withOpacity(0.1),
          foregroundColor:
              name == 'Highlight' ? Colors.blue : Colors.amber[900],
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        child: Text(name),
      ),
    );
  }

  Widget _buildIconButton(
      {String? svgPath, IconData? icon, required String link}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final color = isDarkMode ? Colors.grey[300] : Colors.grey[700];

    return IconButton(
      icon: svgPath != null
          ? SvgPicture.asset(
              svgPath,
              height: 24,
              colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
            )
          : Icon(
              icon!,
              color: color,
            ),
      onPressed: () async {
        final Uri url = Uri.parse(link);
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GlassContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      backgroundColor: Theme.of(context).colorScheme.primary,
      borderColor: isDarkMode ? Colors.grey[800] : Colors.grey[300],
      opacity: isDarkMode ? 0.15 : 0.7,
      blur: isDarkMode ? 15 : 10,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.article.highlight != null)
                  _buildGlowButton(
                      name: 'Highlight', link: widget.article.highlight!),
                if (widget.article.preprint == true)
                  _buildGlowButton(name: 'Preprint', link: widget.article.link),
                if (widget.article.pubmed != null)
                  _buildIconButton(
                    svgPath: 'lib/assets/icons/pubmed_logo.svg',
                    link: widget.article.pubmed!,
                  ),
                if (widget.article.pdf != null)
                  _buildIconButton(
                    svgPath: 'lib/assets/icons/picture_as_pdf.svg',
                    link: widget.article.pdf!,
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _safeSubstring(widget.article.title, titleIndex),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _safeSubstring(
                        widget.article.authors.join(', '), authorsIndex),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color:
                              isDarkMode ? Colors.grey[300] : Colors.grey[700],
                        ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: _launchURL,
                    child: Text(
                      _safeSubstring(
                        '${widget.article.journal}, ${widget.article.issue}',
                        journalIndex,
                      ),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: isDarkMode
                                ? Colors.blue[300]
                                : Colors.blue[900],
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
