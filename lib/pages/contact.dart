import 'dart:convert';
import 'dart:ui_web';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdslab/assets/data/contact/contact_model.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/foundation.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<ContactModel> loadContactData() async {
    final String response = await rootBundle
        .loadString('lib/assets/data/contact/contact_data.json');
    final data = ContactModel.fromJson(await json.decode(response));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Information')),
      body: FutureBuilder<ContactModel>(
        future: loadContactData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final contact = snapshot.data!;
            return LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop = constraints.maxWidth > 800;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: isDesktop
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: _buildContactCard(context, contact),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildMapCard(context, contact),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              _buildContactCard(context, contact),
                              const SizedBox(height: 16),
                              _buildMapCard(context, contact),
                            ],
                          ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, ContactModel contact) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact Information',
                style: Theme.of(context).textTheme.headlineSmall),
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

  // Custom Iframe Widget

  Widget _buildMapCard(BuildContext context, ContactModel contact) {
    return Card(
      elevation: 4,
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
      // Register the view factory for web
      platformViewRegistry.registerViewFactory(
        viewType,
        (int viewId) {
          final iframe = html.IFrameElement()
            ..src = src
            ..style.border = 'none'
            ..style.width = '100%'
            ..style.height = '100%';
          return iframe;
        },
      );
    }

    // Return the HtmlElementView for web
    return const HtmlElementView(viewType: viewType);
  }
}
