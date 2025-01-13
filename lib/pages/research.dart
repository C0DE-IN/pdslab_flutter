import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pdslab/assets/data/research/research_model.dart';

class ResearchPage extends StatefulWidget {
  const ResearchPage({super.key});

  @override
  State<ResearchPage> createState() => _ResearchPageState();
}

class _ResearchPageState extends State<ResearchPage> {
  final ScrollController _scrollController = ScrollController();
  late Future<List<ResearchModel>> _researchData;
  List<ResearchModel>? _loadedData;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _researchData = loadResearchData();
    _researchData.then((data) {
      setState(() {
        _loadedData = data;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_loadedData == null || !_scrollController.hasClients) return;

    final currentScroll = _scrollController.offset;
    final screenHeight = MediaQuery.of(context).size.height;
    final viewportHeight = screenHeight * 2;

    int newIndex = (currentScroll / viewportHeight).floor();
    if (newIndex != _currentIndex && newIndex < _loadedData!.length) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ResearchModel>>(
        future: _researchData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              // Simple background image without animations
              Positioned.fill(
                child: Image.asset(
                  snapshot.data![_currentIndex].imgSrc,
                  fit: BoxFit.contain,
                ),
              ),

              // Scrollable content
              NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification) {
                    _onScroll();
                  }
                  return false;
                },
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: snapshot.data!.map((topic) {
                      return Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height),
                          Container(
                            padding: const EdgeInsets.all(24),
                            color: Colors.black.withOpacity(0.85),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  topic.heading,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                ...topic.textItems.map<Widget>((textItem) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (textItem.title != null) ...[
                                        Text(
                                          textItem.title!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                      Text(
                                        textItem.content,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          height: 1.8,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      if (textItem.list != null) ...[
                                        const SizedBox(height: 16),
                                        Text(
                                          textItem.list!.heading,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        ...textItem.list!.items.map(
                                          (item) => Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              bottom: 12,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "•",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      height: 1.6,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<List<ResearchModel>> loadResearchData() async {
    final String response = await rootBundle
        .loadString('lib/assets/data/research/research_data.json');
    final List<dynamic> jsonData = json.decode(response);
    return jsonData.map((data) => ResearchModel.fromJson(data)).toList();
  }
}
