import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<String> _imageFolders = [
    'lab_photos',
    'birthdays/2021/patrick_d_silva',
    'birthdays/2022/patrick_d_silva',
    'events/2020/centenary_celebration',
    'events/2020/diwali',
    'events/2021/diwali',
    'events/2022/bybc_jncasr',
    'events/2022/diwali',
    'events/2022/independance_day',
    'events/2022/nurturance_programme',
    'events/2022/sports_day',
    'farewell/2022/abhishek',
    'farewell/2022/tejashree',
    'official_events/2018/sir_cv_raman_award',
    'official_events/2021/defence/abhishek',
    'official_events/2022/defence/tejashree',
    'official_events/2022/defence/vinaya',
  ];

  String? selectedFolder;
  List<String> currentImages = [];
  int currentIndex = 0;
  final PageController _pageController = PageController(
    viewportFraction: 0.85,
    initialPage: 0,
  );
  final ScrollController _scrollController = ScrollController();
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();
    _loadLabPhotos();
    _startAutoSlide();
  }

  Future<void> _loadLabPhotos() async {
    final images = await getImagesFromAssets('lab_photos');
    if (mounted) {
      setState(() {
        selectedFolder = 'lab_photos';
        currentImages = images;
        currentIndex = 0;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    _autoSlideTimer?.cancel();
    super.dispose();
  }

  void _startAutoSlide() {
    _autoSlideTimer?.cancel();
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentImages.isNotEmpty && mounted) {
        if (currentIndex < currentImages.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  void _stopAutoSlide() {
    _autoSlideTimer?.cancel();
  }

  void _resumeAutoSlide() {
    _startAutoSlide();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<List<String>> getImagesFromAssets(String folder) async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      final imagePaths = manifestMap.keys
          .where((String key) =>
              key.startsWith('lib/assets/images/gallery/$folder/') &&
              (key.toLowerCase().endsWith('.jpg') ||
                  key.toLowerCase().endsWith('.jpeg') ||
                  key.toLowerCase().endsWith('.png')))
          .toList();

      // print('Found ${imagePaths.length} images in $folder');
      return imagePaths;
    } catch (e) {
      // print('Error getting images from $folder: $e');
      return [];
    }
  }

  String formatPath(String path) {
    // Split by both slash and underscore
    final parts = path.split(RegExp(r'[/_]'));
    // Capitalize each word and join with spaces
    return parts
        .map((part) => part
            .split(' ')
            .map((word) => word.isNotEmpty
                ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
                : '')
            .join(' '))
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            selectedFolder != null ? formatPath(selectedFolder!) : 'Gallery'),
        leading: selectedFolder != null && selectedFolder != 'lab_photos'
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _loadLabPhotos();
                  _pageController.jumpToPage(0);
                },
              )
            : null,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Image Carousel
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: _buildImageCarousel(),
            ),
            // Album Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: _imageFolders.length,
                itemBuilder: (context, index) {
                  final folder = _imageFolders[index];
                  return FutureBuilder<List<String>>(
                    future: getImagesFromAssets(folder),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      final images = snapshot.data!;

                      return Card(
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedFolder = folder;
                              currentImages = images;
                              currentIndex = 0;
                              _pageController.jumpToPage(0);
                            });
                            _scrollToTop();
                            _startAutoSlide();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      images.first,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        // print(
                                        //     'Error loading image ${images.first}: $error');
                                        return const Center(
                                          child: Icon(Icons.image,
                                              color: Colors.grey),
                                        );
                                      },
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.7),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        formatPath(folder),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${images.length} photos',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    if (currentImages.isEmpty) {
      return const Center(
        child: Text('No images found in this folder'),
      );
    }

    final screenSize = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (_) => _stopAutoSlide(),
      onExit: (_) => _resumeAutoSlide(),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: currentImages.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = (_pageController.page! - index).abs();
                    value = (1 - (value * 0.3)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: Transform.scale(
                      scale: value,
                      child: Container(
                        width: screenSize.width * 0.9,
                        height: screenSize.height * 0.85,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black.withOpacity(0.05),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Image.asset(
                                currentImages[index],
                                fit: BoxFit.contain,
                                width: constraints.maxWidth,
                                height: constraints.maxHeight,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.error, size: 50),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          // Navigation arrows
          Positioned(
            left: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton.filled(
                onPressed: currentIndex > 0
                    ? () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton.filled(
                onPressed: currentIndex < currentImages.length - 1
                    ? () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          // Image counter
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${currentIndex + 1} / ${currentImages.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
