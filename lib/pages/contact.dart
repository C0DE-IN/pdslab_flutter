import 'dart:convert';
import 'dart:ui_web';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdslab/assets/data/contact/contact_model.dart';
import 'package:web/web.dart' as web_lib;

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<ContactModel> loadContactData() async {
    final String response = await rootBundle.loadString(
      'lib/assets/data/contact/contact_data.json',
    );
    final data = ContactModel.fromJson(json.decode(response));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Theme.of(context).colorScheme.surface,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: const Text(
              'Contact Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<ContactModel>(
            future: loadContactData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final contact = snapshot.data!;
                // Use a Row on wide screens and a Column for narrow screens.
                if (screenWidth > 800) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactCard(context, contact)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildMapCard(context, contact)),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildContactCard(context, contact),
                        const SizedBox(height: 16),
                        _buildMapCard(context, contact),
                      ],
                    ),
                  );
                }
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, ContactModel contact) {
    // final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(contact.name, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(contact.position),
            Text(contact.labName),
            Text(contact.labNumber),
            Text(contact.department),
            Text(contact.division),
            Text(contact.institute),
            const SizedBox(height: 8),
            Text('Address:', style: Theme.of(context).textTheme.titleMedium),
            Text(contact.address.join(', ')),
            const SizedBox(height: 8),
            Text('Contact:', style: Theme.of(context).textTheme.titleMedium),
            Text('Email: ${contact.email}'),
            Text('Tel: ${contact.tel}'),
          ],
        ),
      ),
    );
  }

  Widget _buildMapCard(BuildContext context, ContactModel contact) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 4,
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: IframeWidget(src: contact.map),
          ),
        ],
      ),
    );
  }
}

class IframeWidget extends StatelessWidget {
  final String src;

  const IframeWidget({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    const String viewType = 'iframe-view';

    if (kIsWeb) {
      platformViewRegistry.registerViewFactory(viewType, (int viewId) {
        final iframe = web_lib.HTMLIFrameElement()
          ..setAttribute('src', src)
          ..style.setProperty('border', 'none')
          ..style.setProperty('width', '100%')
          ..style.setProperty('height', '100%');
        return iframe;
      });
    }
    return const HtmlElementView(viewType: viewType);
  }
}
