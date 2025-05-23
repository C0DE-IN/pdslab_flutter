import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:pdslab/components/glass_container.dart';

class ModelSection extends StatefulWidget {
  const ModelSection({super.key});

  @override
  State<ModelSection> createState() => _ModelSectionState();
}

class _ModelSectionState extends State<ModelSection> {
  Map<String, List<String>> modelFolderImages = {};
  bool isLoading = true;

  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isAutoScrolling = true;
  static const int _duplicateCount = 3; // Number of times to duplicate the list

  @override
  void initState() {
    super.initState();
    _loadModelImages();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadModelImages() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      // Group images by their folder
      final modelPaths = manifestMap.keys.where((String key) =>
          key.startsWith('lib/assets/images/models/') &&
          (key.toLowerCase().endsWith('.webp') ||
              key.toLowerCase().endsWith('.jpeg') ||
              key.toLowerCase().endsWith('.png')));

      for (final path in modelPaths) {
        final folderName = path.split('/')[4]; // Get folder name from path
        modelFolderImages.putIfAbsent(folderName, () => []);
        modelFolderImages[folderName]!.add(path);
      }

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        // Jump to middle set of items
        if (modelFolderImages.isNotEmpty) {
          final middleIndex =
              (modelFolderImages.length * (_duplicateCount ~/ 2));
          _pageController.jumpToPage(middleIndex);
          _currentPage = middleIndex;
        }

        _startAutoScroll();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _startAutoScroll() async {
    while (_isAutoScrolling) {
      await Future.delayed(const Duration(seconds: 5));
      if (!mounted || !_isAutoScrolling) return;

      final nextPage = _currentPage + 1;
      if (!mounted) return;

      await _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handlePageChange(int page) {
    setState(() => _currentPage = page);

    final itemCount = modelFolderImages.length;
    if (itemCount <= 1) return;

    // If we're at the end of the duplicated sets, jump to the middle set
    if (page >= itemCount * (_duplicateCount - 1)) {
      final middleIndex =
          itemCount * (_duplicateCount ~/ 2) + (page % itemCount);
      _pageController.jumpToPage(middleIndex);
      _currentPage = middleIndex;
    }
    // If we're at the start of the duplicated sets, jump to the middle set
    else if (page < itemCount) {
      final middleIndex = itemCount * (_duplicateCount ~/ 2) + page;
      _pageController.jumpToPage(middleIndex);
      _currentPage = middleIndex;
    }
  }

  Widget _buildCollage(List<String> images) {
    return Container(
      color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: images.map((path) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  path,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
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
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (modelFolderImages.isEmpty) {
      return const Center(child: Text('No models found'));
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final folders = modelFolderImages.entries.toList();

    // Create duplicated list for infinite scroll
    final duplicatedFolders = List.generate(_duplicateCount, (_) => folders)
        .expand((x) => x)
        .toList();

    return GlassContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      backgroundColor: Theme.of(context).colorScheme.surface,
      borderColor: isDarkMode ? Colors.grey[800] : Colors.grey[300],
      opacity: isDarkMode ? 0.1 : 0.5,
      blur: isDarkMode ? 20 : 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 24, bottom: 24),
            child: Text(
              'Our Models',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          MouseRegion(
            onEnter: (_) => setState(() => _isAutoScrolling = false),
            onExit: (_) {
              setState(() => _isAutoScrolling = true);
              _startAutoScroll();
            },
            child: SizedBox(
              height: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: _handlePageChange,
                    children: duplicatedFolders
                        .map((entry) => _buildCollage(entry.value))
                        .toList(),
                  ),
                  Positioned(
                    left: 8,
                    child: GlassContainer(
                      margin: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(20),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      opacity: isDarkMode ? 0.15 : 0.7,
                      blur: isDarkMode ? 15 : 10,
                      child: IconButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    child: GlassContainer(
                      margin: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(20),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      opacity: isDarkMode ? 0.15 : 0.7, // Fixed opacity value
                      blur: isDarkMode ? 15 : 10,
                      child: IconButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: folders.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                  activeDotColor: Theme.of(context).colorScheme.secondary,
                  dotColor: isDarkMode
                      ? Colors.grey[700]!.withOpacity(0.5)
                      : Colors.grey[400]!.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
