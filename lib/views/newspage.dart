import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsItems = [];

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse('https://fortune.com/wp-json/wp/v2/posts?_embed&per_page=3'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      List<NewsItem> items = [];
      final HtmlUnescape unescape = HtmlUnescape();
      for (var data in jsonData) {
        final String title = unescape.convert(data['title']['rendered']);
        final String excerpt = unescape.convert(data['excerpt']['rendered']);
        final String url = data['link'];
        final String imageUrl = data['_embedded']['wp:featuredmedia'][0]['source_url'];

        items.add(NewsItem(title: title, excerpt: excerpt, url: url, imageUrl: imageUrl));
      }

      setState(() {
        newsItems = items;
      });
    } else {
      throw Exception('Failed to fetch news data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final item = newsItems[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Image.network(
                  item.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                title: Html(data: item.title),
                subtitle: Html(data: item.excerpt),
                onTap: () {
                  // Abrir el enlace de la noticia original
                  // Puedes usar el paquete `url_launcher` para abrir el enlace en el navegador
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class NewsItem {
  final String title;
  final String excerpt;
  final String url;
  final String imageUrl;

  NewsItem({
    required this.title,
    required this.excerpt,
    required this.url,
    required this.imageUrl,
  });
}