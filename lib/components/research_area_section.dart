import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdslab/assets/data/research-area/research_area_model.dart';
import 'package:pdslab/components/glass_container.dart';

class ResearchAreaSection extends StatefulWidget {
  const ResearchAreaSection({super.key});

  @override
  State<ResearchAreaSection> createState() => _ResearchAreaSectionState();
}

class _ResearchAreaSectionState extends State<ResearchAreaSection> {
  List<ResearchAreaModel> researchAreas = [];
  bool isLoading = true;
  String? error;
  final ScrollController _scrollController = ScrollController();
  bool _isAutoScrolling = false;
  final double _scrollSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _loadResearchAreas();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadResearchAreas() async {
    try {
      final String response = await rootBundle
          .loadString('lib/assets/data/research-area/research_area_data.json');
      final List<dynamic> jsonData = json.decode(response);

      if (mounted) {
        setState(() {
          researchAreas =
              jsonData.map((json) => ResearchAreaModel.fromJson(json)).toList();
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          error = e.toString();
          isLoading = false;
        });
      }
    }
  }

  void _startAutoScroll() {
    if (!_isAutoScrolling) {
      _isAutoScrolling = true;
      _autoScroll();
    }
  }

  void _stopAutoScroll() {
    _isAutoScrolling = false;
  }

  Future<void> _autoScroll() async {
    while (_isAutoScrolling) {
      if (!mounted || !_scrollController.hasClients) return;

      await Future.delayed(const Duration(milliseconds: 16)); // ~60fps

      final double maxScroll = _scrollController.position.maxScrollExtent;
      final double currentScroll = _scrollController.position.pixels;
      double nextScroll = currentScroll + _scrollSpeed;

      // If we're about to hit the end, jump back to start plus the overflow
      if (nextScroll >= maxScroll) {
        nextScroll = nextScroll - maxScroll;
        _scrollController.jumpTo(nextScroll);
      } else {
        _scrollController.jumpTo(nextScroll);
      }
    }
  }

  Widget _buildResearchCard(ResearchAreaModel area) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: 350, // Increased width for better text display
      child: GlassContainer(
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(12),
        backgroundColor: Theme.of(context).colorScheme.primary,
        borderColor: isDarkMode ? Colors.grey[800] : Colors.grey[300],
        opacity: isDarkMode ? 0.15 : 0.7,
        blur: isDarkMode ? 15 : 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                area.imgSrc,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color:
                        Theme.of(context).colorScheme.surface.withOpacity(0.5),
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                area.heading,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    textAlign: TextAlign.justify,
                    area.text,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(
        child: Text(
          'Error: $error',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    }

    if (researchAreas.isEmpty) {
      return const Center(child: Text('No research areas found.'));
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<ResearchAreaModel> extendedList = [
      ...researchAreas,
      ...researchAreas,
      ...researchAreas,
    ];

    return GlassContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      backgroundColor: Theme.of(context).colorScheme.surface,
      borderColor: isDarkMode ? Colors.grey[800] : Colors.grey[300],
      opacity: isDarkMode ? 0.1 : 0.5,
      blur: isDarkMode ? 20 : 15,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Research Areas',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(
            height: 500,
            child: MouseRegion(
              onEnter: (_) => _startAutoScroll(),
              onExit: (_) => _stopAutoScroll(),
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  children: extendedList.map(_buildResearchCard).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
