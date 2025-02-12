import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdslab/assets/data/funds/agency_model.dart';

class FundsPage extends StatelessWidget {
  const FundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Center(
                    child: Text(
                      'Funds Data',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                _buildFundsSection(context),
                _buildPdsFundsSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFundsSection(BuildContext context) {
    return FutureBuilder<List<AgencyModel>>(
      future: _loadJsonData('lib/assets/data/funds/funds_data.json'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return _buildCardGrid(context, snapshot.data!);
        }
      },
    );
  }

  Widget _buildPdsFundsSection(BuildContext context) {
    return FutureBuilder<List<AgencyModel>>(
      future: _loadJsonData('lib/assets/data/funds/pdf_funds_data.json'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return _buildCardGrid(context, snapshot.data!);
        }
      },
    );
  }

  Future<List<AgencyModel>> _loadJsonData(String path) async {
    final String response = await rootBundle.loadString(path);
    final List<dynamic> jsonData = json.decode(response);
    return jsonData.map((data) => AgencyModel.fromJson(data)).toList();
  }

  Widget _buildCardGrid(BuildContext context, List<AgencyModel> data) {
    final double width = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (width < 600) {
      crossAxisCount = 1;
    } else if (width < 1024) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }

    double aspectRatio;
    if (crossAxisCount == 1) {
      aspectRatio = 1.2;
    } else {
      aspectRatio = 1.0;
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          color: Theme.of(context).colorScheme.primary,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: SvgPicture.asset(
                          data[index].logo,
                          height: crossAxisCount == 1 ? 150 : 200,
                          fit: BoxFit.contain,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          data[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: crossAxisCount == 1 ? 16 : 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
