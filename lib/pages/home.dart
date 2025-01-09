import 'package:flutter/material.dart';
import '../components/image_carousel.dart';
import '../components/news_section.dart';
import '../components/recent_publications.dart';
import '../components/research_area_section.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> albumImages = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadAlbumImages();
  }

  Future<void> _loadAlbumImages() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });

      // Hardcode the image paths since we know they exist
      final List<String> images = List.generate(
        23,
        (index) => 'lib/assets/images/album/${index + 1}.jpg',
      );

      setState(() {
        albumImages = images;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          if (isLoading)
            const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (error != null)
            SizedBox(
              height: 400,
              child: Center(
                child: Text('Error: $error'),
              ),
            )
          else if (albumImages.isEmpty)
            const SizedBox(
              height: 400,
              child: Center(
                child: Text('No images found in album'),
              ),
            )
          else
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ImageCarousel(
                images: albumImages,
                viewportFraction: 0.85,
                autoSlideDuration: const Duration(seconds: 3),
              ),
            ),
          const SizedBox(height: 32),
          const NewsSection(),
          const SizedBox(height: 32),
          const RecentPublications(),
          const SizedBox(height: 20),
          const ResearchAreaSection(),
        ],
      ),
    );
  }
}
