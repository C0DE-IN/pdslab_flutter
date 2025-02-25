import 'package:flutter/material.dart';
import 'package:pdslab/assets/data/publication/publication_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildArticleCard(BuildContext context, Article article) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: isDarkMode ? Colors.grey[900] : Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (article.highlight != null)
              _buildGlowButton(name: 'Highlight', link: article.highlight!),
            if (article.preprint == true)
              _buildGlowButton(name: 'Preprint', link: article.link),
          ],
        ),
        if (article.highlight != null || article.preprint == true)
          const SizedBox(height: 8),
        Text(
          article.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          article.authors.join(', '),
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => _launchURL(article.link),
                child: Text(
                  '${article.journal}, ${article.issue}',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: isDarkMode ? Colors.blue[400] : Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                if (article.pubmed != null)
                  IconButton(
                    onPressed: () => _launchURL(article.pubmed!),
                    icon: SvgPicture.asset(
                      'lib/assets/icons/pubmed_logo.svg',
                      height: 24,
                      width: 96,
                      colorFilter: ColorFilter.mode(
                        isDarkMode ? Colors.blue[400]! : Colors.blue[900]!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                if (article.pdf != null)
                  IconButton(
                    onPressed: () => _launchURL(article.pdf!),
                    icon: SvgPicture.asset(
                      'lib/assets/icons/picture_as_pdf.svg',
                      height: 24,
                      width: 96,
                      colorFilter: ColorFilter.mode(
                        isDarkMode ? Colors.blue[400]! : Colors.blue[900]!,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Future<void> _launchURL(String url) async {
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    debugPrint('Error launching URL: $e');
  }
}

Widget _buildGlowButton({required String name, required String link}) {
  return Padding(
    padding: const EdgeInsets.only(right: 8),
    child: ElevatedButton(
      onPressed: () => _launchURL(link),
      style: ElevatedButton.styleFrom(
        backgroundColor: name == 'Highlight'
            ? Colors.amber.withOpacity(0.2)
            : Colors.blue.withOpacity(0.2),
        foregroundColor: name == 'Highlight' ? Colors.amber : Colors.blue,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: name == 'Highlight' ? Colors.amber : Colors.blue,
            width: 1,
          ),
        ),
      ),
      child: Text(name),
    ),
  );
}
