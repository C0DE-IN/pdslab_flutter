import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pdslab/assets/data/people/people_model.dart';
import 'package:pdslab/assets/data/people/pi_model.dart';
import 'package:pdslab/assets/data/people/alumni_model.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false, // Prevents conflict with primary scroll controller
      physics: const NeverScrollableScrollPhysics(), // Disable outer scrolling
      child: SizedBox(
        // Constrain height to viewport
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            // Inner scrolling enabled
            child: Column(
              children: [
                _buildSegment(context, 'Principal Investigator',
                    'lib/assets/data/people/pi_data.json'),
                _buildSegment(context, 'Post Doctoral Fellow',
                    'lib/assets/data/people/pdfs_data.json'),
                _buildSegment(context, 'PhD Students',
                    'lib/assets/data/people/phds_data.json'),
                _buildSegment(context, 'Masters Student',
                    'lib/assets/data/people/mscs_data.json'),
                _buildSegment(context, 'Project Staffs',
                    'lib/assets/data/people/staffs_data.json'),
                _buildSegment(context, 'Alumni',
                    'lib/assets/data/people/alumnus_data.json'),
                _buildSegment(context, 'Alumni Staffs',
                    'lib/assets/data/people/alumnus_staff_data.json'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSegment(BuildContext context, String title, String dataPath) {
    if (title == 'Principal Investigator') {
      return FutureBuilder<PiModel>(
        future: _loadPiJsonData(dataPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                _buildPiCard(context, snapshot.data!),
              ],
            );
          }
        },
      );
    } else if (title == 'Alumni' || title == 'Alumni Staffs') {
      return FutureBuilder<List<AlumniModel>>(
        future: _loadAlumniData(dataPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                _buildAlumniTable(context, snapshot.data!, title),
              ],
            );
          }
        },
      );
    } else {
      return FutureBuilder<List<PeopleModel>>(
        future: _loadJsonData(dataPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                _buildCardGrid(context, snapshot.data!),
              ],
            );
          }
        },
      );
    }
  }

  Widget _buildPiCard(BuildContext context, PiModel piData) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        final formattedName =
            piData.name.replaceAll(' ', '-').replaceAll('\'', '').toLowerCase();
        context.go('/people/$formattedName');
      },
      child: Card(
        color: isDarkMode
            ? Colors.grey[850]?.withAlpha(180)
            : Colors.white.withAlpha(180),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  piData.imgSrc!,
                  fit: BoxFit.fitHeight,
                  height: 420.0,
                  width: 380.0,
                  alignment: Alignment.topCenter,
                ),
                Positioned(
                  bottom: 8.0,
                  left: 16.0,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${piData.title} ${piData.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          piData.position,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardGrid(BuildContext context, List<PeopleModel> data) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    // Determine grid layout based on screen width
    int crossAxisCount;
    double childAspectRatio;
    double fontSize;

    if (width < 600) {
      crossAxisCount = 1; // Mobile: single column
      childAspectRatio = 0.85;
      fontSize = 14;
    } else if (width < 1024) {
      crossAxisCount = 2; // Tablet: two columns
      childAspectRatio = 0.8;
      fontSize = 15;
    } else {
      crossAxisCount = 3; // Desktop: three columns
      childAspectRatio = 0.75;
      fontSize = 16;
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            final formattedName = data[index]
                .name
                .replaceAll(' ', '-')
                .replaceAll('\'', '')
                .toLowerCase();
            context.go('/people/$formattedName');
          },
          child: Card(
            color: isDarkMode
                ? Colors.grey[850]?.withAlpha(180)
                : Colors.white.withAlpha(180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        data[index].imgSrc!,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                data[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                data[index].position,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontSize - 2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAlumniTable(
      BuildContext context, List<AlumniModel> alumniData, String title) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.grey[850]?.withAlpha(180)
            : Colors.white.withAlpha(180),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: title == 'Alumnus'
            ? DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Graduation Year')),
                  DataColumn(label: Text('Position')),
                  DataColumn(label: Text('Place')),
                ],
                rows: alumniData.map((alumnus) {
                  return DataRow(
                    cells: [
                      DataCell(Text(alumnus.name)),
                      DataCell(Text(alumnus.passout.toString())),
                      DataCell(Text(alumnus.position)),
                      DataCell(Text(alumnus.place)),
                    ],
                  );
                }).toList(),
              )
            : DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Position')),
                  DataColumn(label: Text('Place')),
                ],
                rows: alumniData.map((staff) {
                  return DataRow(
                    cells: [
                      DataCell(Text(staff.name)),
                      DataCell(Text(staff.position)),
                      DataCell(Text(staff.place)),
                    ],
                  );
                }).toList(),
              ),
      ),
    );
  }

  Future<List<PeopleModel>> _loadJsonData(String path) async {
    final String response = await rootBundle.loadString(path);
    final List<dynamic> jsonData = json.decode(response);
    return jsonData.map((data) => PeopleModel.fromJson(data)).toList();
  }

  Future<PiModel> _loadPiJsonData(String path) async {
    final String response = await rootBundle.loadString(path);
    final dynamic jsonData = json.decode(response);
    return PiModel.fromJson(jsonData);
  }

  Future<List<AlumniModel>> _loadAlumniData(String path) async {
    final String response = await rootBundle.loadString(path);
    final List<dynamic> jsonData = json.decode(response);
    return jsonData.map((data) => AlumniModel.fromJson(data)).toList();
  }
}
