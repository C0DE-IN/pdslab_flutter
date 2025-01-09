import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../assets/data/publication/publication_model.dart';
import 'recent_publication_card.dart';

class RecentPublications extends StatefulWidget {
  const RecentPublications({super.key});

  @override
  State<RecentPublications> createState() => _RecentPublicationsState();
}

class _RecentPublicationsState extends State<RecentPublications> {
  List<Article> recentPublications = [];
  int currentIndex = 0;
  bool isLoading = true;
  String? error;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadPublications();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _loadPublications() async {
    try {
      final String response = await rootBundle
          .loadString('lib/assets/data/publication/publication_data.json');
      final List<dynamic> jsonData = json.decode(response);
      
      // Get publications across years until we have 5
      List<Article> allRecentArticles = [];
      for (var yearData in jsonData) {
        final publication = PublicationModel.fromJson(yearData);
        allRecentArticles.addAll(publication.articles);
        if (allRecentArticles.length >= 5) {
          break;
        }
      }

      // Take the first 5 articles (or all if less than 5)
      final recentArticles = allRecentArticles.take(5).toList();

      if (mounted) {
        setState(() {
          recentPublications = recentArticles;
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

  void _moveToNextPublication() {
    if (mounted) {
      setState(() {
        currentIndex = (currentIndex + 1) % recentPublications.length;
      });
    }
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

    if (recentPublications.isEmpty) {
      return const Center(child: Text('No recent publications found.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Recent Publications',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        RecentPublicationCard(
          article: recentPublications[currentIndex],
          isActive: true,
          onAnimationComplete: () {
            Future.delayed(const Duration(seconds: 3), _moveToNextPublication);
          },
        ),
      ],
    );
  }
}
