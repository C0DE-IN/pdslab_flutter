import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:pdslab/assets/data/people/people_model.dart';
import 'package:pdslab/assets/data/people/pi_model.dart';

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
      // Search for the person by name
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

  Future<List<String>> _loadPublications(String person) async {
    final String response = await rootBundle
        .loadString('lib/assets/data/publication/publication_data.json');
    final List<dynamic> jsonData = json.decode(response);
    List<String> filteredPublications = [];

    for (var yearData in jsonData) {
      for (var article in yearData['articles']) {
        if (article['authors'].contains(person)) {
          filteredPublications.add(article['title']);
        }
      }
    }
    return filteredPublications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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
        child: name == 'patrick-d-silva'
            ? _buildPiCard(context)
            : _buildPeopleCard(context),
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
          return FutureBuilder<List<String>>(
            future: _loadPublications(person.name),
            builder: (context, pubSnapshot) {
              if (pubSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (pubSnapshot.hasError) {
                return const Center(child: Text('Error loading publications.'));
              } else {
                final publications = pubSnapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Row(
                          children: [
                            Image.asset(
                              person.imgSrc!,
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text('Position: ${person.position}',
                                      style: const TextStyle(fontSize: 20)),
                                  const SizedBox(height: 10),
                                  Text('Details about ${person.name}...',
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (person.summary != null)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                                'Research Summary: ${person.summary}',
                                style: const TextStyle(fontSize: 16)),
                          ),
                        ),
                      const SizedBox(height: 16),
                      if (publications.isNotEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Publications:',
                                    style: TextStyle(fontSize: 20)),
                                ...publications.map((pub) => Text(pub)),
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
              child: Text('Error loading data or person not found.'));
        } else {
          final person = snapshot.data!;
          return FutureBuilder<List<String>>(
            future: _loadPublications(person.name),
            builder: (context, pubSnapshot) {
              if (pubSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (pubSnapshot.hasError) {
                return const Center(child: Text('Error loading publications.'));
              } else {
                final publications = pubSnapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Row(
                          children: [
                            Image.asset(
                              person.imgSrc!,
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text('Position: ${person.position}',
                                      style: const TextStyle(fontSize: 20)),
                                  const SizedBox(height: 10),
                                  Text('Details about ${person.name}...',
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (person.summary != null)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Research Summary: ${person.summary}',
                                style: const TextStyle(fontSize: 16)),
                          ),
                        ),
                      const SizedBox(height: 16),
                      if (publications.isNotEmpty)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Publications:',
                                    style: TextStyle(fontSize: 20)),
                                ...publications.map((pub) => Text(pub)),
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
