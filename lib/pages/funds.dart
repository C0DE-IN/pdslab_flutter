import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdslab/assets/data/funds/agency_model.dart';

class FundsPage extends StatelessWidget {
  const FundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Funds Data')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFundsSection(context),
            _buildPdsFundsSection(context),
          ],
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
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
        childAspectRatio: 1,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  data[index].logo,
                  height: 200,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
