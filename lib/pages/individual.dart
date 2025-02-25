import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:pdslab/assets/data/people/people_model.dart';
import 'package:pdslab/assets/data/people/pi_model.dart';
import 'package:pdslab/assets/data/publication/publication_model.dart';
import 'package:pdslab/components/article_card.dart';

class Individual extends StatelessWidget {
  const Individual({super.key, required this.name});
  final String name;

  Future<PeopleModel?> _loadPersonData() async {
    final List<String> paths = [
      'lib/assets/data/people/pdfs_data.json',
      'lib/assets/data/people/phds_data.json',
      'lib/assets/data/people/mscs_data.json',
      'lib/assets/data/people/staffs_data.json',
    ];

    for (String path in paths) {
      final String response = await rootBundle.loadString(path);
      final List<dynamic> jsonData = json.decode(response);
      for (var person in jsonData) {
        final PeopleModel model = PeopleModel.fromJson(person);
        if (model.name.replaceAll(' ', '-').toLowerCase() == name) {
          return model;
        }
      }
    }
    return null;
  }

  Future<PiModel> _loadPiData() async {
    final String response =
        await rootBundle.loadString('lib/assets/data/people/pi_data.json');
    final dynamic jsonData = json.decode(response);
    return PiModel.fromJson(jsonData);
  }

  Future<List<Article>> _loadArticlesForPerson(String person) async {
    final String response = await rootBundle
        .loadString('lib/assets/data/publication/publication_data.json');
    final List<dynamic> jsonData = json.decode(response);
    final List<Article> articles = [];
    for (var publication in jsonData) {
      for (var articleData in publication['articles']) {
        // Adjust the condition as needed to match your data
        if ((articleData['authors'] as List).contains(person)) {
          articles.add(Article.fromJson(articleData as Map<String, dynamic>));
        }
      }
    }
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false, // Prevents conflict with primary scroll controller
      physics: const NeverScrollableScrollPhysics(), // Disable outer scrolling
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          appBar: AppBar(
            // title: Text(name),
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  context.go('/people');
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            // Inner scrolling enabled
            child: name == 'patrick-d-silva'
                ? _buildPiCard(context)
                : _buildPeopleCard(context),
          ),
        ),
      ),
    );
  }

  Widget _buildPeopleCard(BuildContext context) {
    return FutureBuilder<PeopleModel?>(
      future: _loadPersonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return const Center(
              child: Text('Error loading data or person not found.'));
        } else {
          final person = snapshot.data!;
          return FutureBuilder<List<Article>>(
            future: _loadArticlesForPerson(person.name),
            builder: (context, pubSnapshot) {
              if (pubSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (pubSnapshot.hasError) {
                return const Center(child: Text('Error loading publications.'));
              } else {
                final articles = pubSnapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Person Info Card
                      Card(
                        child: Row(
                          children: [
                            Image.asset(
                              person.imgSrc!,
                              fit: BoxFit.cover,
                              width: 240,
                              height: 320,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    person.name,
                                    style: const TextStyle(fontSize: 36),
                                  ),
                                  Text(
                                    person.position,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  if (person.fellowships != null &&
                                      person.fellowships!.isNotEmpty)
                                    Text(
                                      'Fellowships: ${person.fellowships}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  if (person.credentials != null &&
                                      person.credentials!.isNotEmpty) ...[
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Credentials:',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    ...person.credentials!
                                        .map((cred) => Text(cred))
                                        .toList(),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Research Summary Section
                      if (person.summary != null && person.summary!.isNotEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Research Summary:',
                                    style: TextStyle(fontSize: 20)),
                                const SizedBox(height: 16),
                                ...person.summary!.map(
                                  (text) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      text,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      // Publications Section
                      if (articles.isNotEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Publications:',
                                    style: TextStyle(fontSize: 20)),
                                const SizedBox(height: 16),
                                ...articles
                                    .map((article) =>
                                        buildArticleCard(context, article))
                                    .toList(),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
            },
          );
        }
      },
    );
  }

  Widget _buildPiCard(BuildContext context) {
    return FutureBuilder<PiModel?>(
      future: _loadPiData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return const Center(
              child: Text('Error loading PI data or PI not found.'));
        } else {
          final piData = snapshot.data!;
          return FutureBuilder<List<Article>>(
            future: _loadArticlesForPerson(
                piData.name), // Use PI's name as identifier
            builder: (context, pubSnapshot) {
              if (pubSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (pubSnapshot.hasError) {
                return const Center(child: Text('Error loading publications.'));
              } else {
                final articles = pubSnapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display PI image and credentials
                      Card(
                        child: Row(
                          children: [
                            Image.asset(
                              piData.imgSrc!,
                              fit: BoxFit.fitHeight,
                              height: 420.0,
                              width: 380.0,
                              alignment: Alignment.topCenter,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${piData.position} ${piData.name}',
                                    style: const TextStyle(fontSize: 36),
                                  ),
                                  const SizedBox(height: 10),
                                  if (piData.credentials != null)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Credentials:',
                                            style: TextStyle(fontSize: 20)),
                                        ...piData.credentials!
                                            .map((cred) => Text(cred))
                                            .toList(),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Optionally display PI summary if available
                      if (piData.summary != null)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Research Summary:',
                                    style: TextStyle(fontSize: 20)),
                                const SizedBox(height: 16),
                                ...piData.summary!.map((content) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...content.text.map((text) => Text(text)),
                                      const SizedBox(height: 16),
                                      if (content.list != null)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            DataTable(
                                              columns: const [
                                                DataColumn(
                                                    label: Text('Highlights')),
                                              ],
                                              rows: content.list!.array!
                                                  .map((item) => DataRow(
                                                        cells: [
                                                          DataCell(Text(item)),
                                                        ],
                                                      ))
                                                  .toList(),
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        ),
                                      if (content.imgSrc != null)
                                        Image.asset(
                                          content.imgSrc!,
                                          fit: BoxFit.fitWidth,
                                          alignment: Alignment.topCenter,
                                        ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 16),
                      // Publications section using _buildArticleCard
                      if (articles.isNotEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Publications:',
                                    style: TextStyle(fontSize: 20)),
                                const SizedBox(height: 16),
                                ...articles.map((article) =>
                                    buildArticleCard(context, article)),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
            },
          );
        }
      },
    );
  }
}
