import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdslab/components/article_card.dart';
import '../assets/data/publication/publication_model.dart';

class PublicationsPage extends StatefulWidget {
  const PublicationsPage({super.key});

  @override
  State<PublicationsPage> createState() => _PublicationsPageState();
}

class _PublicationsPageState extends State<PublicationsPage> {
  List<PublicationModel> publications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadPublications();
  }

  Future<void> loadPublications() async {
    try {
      final String response = await rootBundle
          .loadString('lib/assets/data/publication/publication_data.json');
      final List<dynamic> data = json.decode(response);
      setState(() {
        publications = data
            .map((json) =>
                PublicationModel.fromJson(json as Map<String, dynamic>))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error loading publications: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      primary: false, // Prevents conflict with primary scroll controller
      physics: const NeverScrollableScrollPhysics(), // Disable outer scrolling
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: publications
                  .map((publication) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              publication.year,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode
                                    ? Colors.red[500]
                                    : Colors.red[900],
                              ),
                            ),
                          ),
                          ...publication.articles.map(
                              (article) => buildArticleCard(context, article)),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
