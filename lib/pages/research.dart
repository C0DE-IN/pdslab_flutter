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
  final List<GlobalKey> _sectionKeys = [];
  double _lastScrollPosition = 0;
  bool _showFooter = false;

  @override
  void initState() {
    super.initState();
    _researchData = loadResearchData();
    _researchData.then((data) {
      setState(() {
        _loadedData = data;
        _sectionKeys.addAll(List.generate(data.length, (_) => GlobalKey()));
      });
    });

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;
        if (currentScroll >= maxScroll - 100) {
          if (!_showFooter) {
            setState(() {
              _showFooter = true;
            });
          }
        } else {
          if (_showFooter) {
            setState(() {
              _showFooter = false;
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_loadedData == null || !_scrollController.hasClients) return;

    final screenHeight = MediaQuery.of(context).size.height;
    final scrollOffset = _scrollController.offset;
    final isScrollingUp = scrollOffset < _lastScrollPosition;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final key = _sectionKeys[i];
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        final bottomEdge = position.dy + box.size.height;
        final topEdge = position.dy;

        if (isScrollingUp) {
          if (topEdge <= 0 && topEdge > -box.size.height) {
            if (_currentIndex != i && i >= 0) {
              setState(() {
                _currentIndex = i;
              });
            }
            break;
          }
        } else {
          if (bottomEdge <= screenHeight && bottomEdge > 0) {
            if (_currentIndex != i + 1 && i + 1 < _loadedData!.length) {
              setState(() {
                _currentIndex = i + 1;
              });
            }
            break;
          }
        }
      }
    }

    _lastScrollPosition = scrollOffset;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          body: FutureBuilder<List<ResearchModel>>(
            future: _researchData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: Image.asset(
                      snapshot.data![_currentIndex].imgSrc,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                      // color: Colors.white,
                    ),
                  ),
                  NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollUpdateNotification) {
                        _onScroll();
                      }
                      return false;
                    },
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ...snapshot.data!.asMap().entries.map((entry) {
                              final index = entry.key;
                              final topic = entry.value;
                              return Column(
                                key: _sectionKeys[index],
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height),
                                  Container(
                                    padding: const EdgeInsets.all(24),
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          topic.heading,
                                          style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        ...topic.textItems
                                            .map<Widget>((textItem) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (textItem.title != null) ...[
                                                Text(
                                                  textItem.title!,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                              ],
                                              Text(
                                                textItem.content,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary,
                                                  height: 1.8,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              if (textItem.list != null) ...[
                                                const SizedBox(height: 16),
                                                Text(
                                                  textItem.list!.heading,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                ...textItem.list!.items.map(
                                                  (item) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 20,
                                                      bottom: 12,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "•",
                                                          style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onPrimary,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 12),
                                                        Expanded(
                                                          child: Text(
                                                            item,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onPrimary,
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
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
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
