import 'package:flutter/material.dart';
import 'package:news_app/data/dummy_news_json.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/widgets/news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsResponse _response = NewsResponse.fromJson(newsJson);
  String _query = '';

  List<NewsModel> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return _response.data;
    return _response.data.where((n) {
      return n.title.toLowerCase().contains(q) ||
          n.description.toLowerCase().contains(q) ||
          n.category.toLowerCase().contains(q);
    }).toList();
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;

    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
      
          TextField(
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText: 'Search news...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),

          if (_query.trim().isEmpty) ...[
            _sectionTitle('Breaking News'),
            NewsCard(news: _response.breakingNews),
          ],

          _sectionTitle('Other News'),
          if (items.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('No news found')),
            )
          else
            ...items.map((news) => NewsCard(news: news)),
        ],
      ),
    );
  }
}
