import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../assets/data/news/news_model.dart';
import 'news_card.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  List<NewsModel> news = [];
  bool isLoading = true;
  String? error;
  int activeNewsIndex = 0;
  Timer? _newsTimer;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  @override
  void dispose() {
    _newsTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadNews() async {
    try {
      final String response = await rootBundle.loadString('lib/assets/data/news/news_data.json');
      final List<dynamic> jsonData = json.decode(response);
      
      if (mounted) {
        setState(() {
          news = jsonData.map((json) => NewsModel.fromJson(json)).toList();
          isLoading = false;
        });

        // Start cycling through news items
        _startNewsTimer();
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

  void _startNewsTimer() {
    _newsTimer?.cancel();
    _newsTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (mounted) {
        setState(() {
          activeNewsIndex = (activeNewsIndex + 1) % news.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Error: $error',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.red,
                ),
          ),
        ),
      );
    }

    if (news.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No news available'),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'News',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        NewsCard(
          news: news[activeNewsIndex],
          isActive: true,
        ),
      ],
    );
  }
}
