import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdslab/routes.dart';
import 'dart:html' if (dart.library.html) 'dart:html' as html;

class MetadataManager extends StatelessWidget {
  final String currentPath;
  final Widget child;
  
  const MetadataManager({
    super.key,
    required this.currentPath,
    required this.child,
  });

  void _updateMetadata(BuildContext context) {
    if (!kIsWeb) return; // Only run on web platform
    
    final metadata = pageMetadata[currentPath] ?? pageMetadata[AppRoutes.home]!;
    
    // Update page title and meta tags
    _updateTags(
      title: metadata.title,
      description: metadata.description,
      canonicalUrl: metadata.canonicalUrl,
    );
  }
  
  void _updateTags({
    required String title,
    required String description,
    required String canonicalUrl,
  }) {
    if (!kIsWeb) return;
    
    final headElement = html.document.head;
    if (headElement == null) return;
    
    // Update title
    html.document.title = title;
    
    // Update or create meta description
    var metaDescription = html.document.querySelector('meta[name="description"]');
    if (metaDescription == null) {
      metaDescription = html.Element.tag('meta')
        ..setAttribute('name', 'description');
      headElement.children.add(metaDescription);
    }
    metaDescription.setAttribute('content', description);
    
    // Update or create canonical link
    var canonicalLink = html.document.querySelector('link[rel="canonical"]');
    if (canonicalLink == null) {
      canonicalLink = html.Element.tag('link')
        ..setAttribute('rel', 'canonical');
      headElement.children.add(canonicalLink);
    }
    canonicalLink.setAttribute('href', canonicalUrl);
    
    // Update Open Graph tags
    _updateOpenGraphTag('og:title', title);
    _updateOpenGraphTag('og:description', description);
    _updateOpenGraphTag('og:url', canonicalUrl);
  }
  
  void _updateOpenGraphTag(String property, String content) {
    if (!kIsWeb) return;
    
    final headElement = html.document.head;
    if (headElement == null) return;
    
    var tag = html.document.querySelector('meta[property="$property"]');
    if (tag == null) {
      tag = html.Element.tag('meta')
        ..setAttribute('property', property);
      headElement.children.add(tag);
    }
    tag.setAttribute('content', content);
  }

  @override
  Widget build(BuildContext context) {
    _updateMetadata(context);
    return child;
  }
}