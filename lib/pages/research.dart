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
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int _currentSection = 0;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isScrolling) return;

    final screenHeight = MediaQuery.of(context).size.height;
    final currentScroll = _scrollController.offset;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final sectionIndex = (currentScroll / screenHeight).floor();

    if (currentScroll >= maxScroll && sectionIndex == _currentSection) {
      setState(() {
        _isScrolling = true;
        _currentSection++;
        _pageController
            .nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        )
            .then((_) {
          _scrollController.jumpTo(0);
          _isScrolling = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ResearchModel>>(
        future: loadResearchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else {
            return PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final topic = snapshot.data![index];
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        topic.imgSrc,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SingleChildScrollView(
                      controller: _scrollController,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  const SizedBox(height: 24),
                                ],
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
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
