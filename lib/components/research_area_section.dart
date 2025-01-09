import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdslab/assets/data/research-area/research_area_model.dart';

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
  double _scrollSpeed = 1.0;

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
    return Container(
      width: 300,
      margin: const EdgeInsets.all(8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              area.imgSrc,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, size: 50),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                area.heading,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                  area.text,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
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

    // Create a list that repeats the cards three times for smooth infinite scrolling
    final List<ResearchAreaModel> extendedList = [
      ...researchAreas,
      ...researchAreas,
      ...researchAreas,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: 400,
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
    );
  }
}
