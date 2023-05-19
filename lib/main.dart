import 'package:flutter/material.dart';
import 'package:search/show_result_page.dart';

void main() {
  runApp(const SearchApp());
}

class SearchApp extends StatelessWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Search App',
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> sentences = [
    "This is the first sentence.",
    "Here is the second sentence.",
    "And this is the third sentence.",
    "Another sentence is here.",
    "Mangoes are sweet",
    "Oranges are of orange color",
    "Oranges are cheap",
    "Oranges are not available",
    "Oranges are here",
    "These Oranges are easy",
    "My oranges are not yellow",
  ];

  List<String> searchResults = [];
  String query = '';

  void search(String query) {
    setState(() {
      this.query = query;
      searchResults = [];
      for (String sentence in sentences) {
        if (sentence.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(sentence);
        }
      }
    });
  }

  List<TextSpan> _getHighlightSpans(String sentence, String query) {
    List<TextSpan> spans = [];

    // Check if the query is empty
    if (query.isEmpty) {
      spans.add(TextSpan(text: sentence));
      return spans;
    }

    // Find the starting index of each match
    int index = sentence.toLowerCase().indexOf(query.toLowerCase());

    // If there is a match, create a TextSpan for each match
    while (index >= 0) {
      // Add the non-matching text before the match
      if (index > 0) {
        spans.add(TextSpan(text: sentence.substring(0, index)));
      }

      // Add the matching text with a different style
      spans.add(
        TextSpan(
          text: sentence.substring(index, index + query.length),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red, // Customize the highlight color here
          ),
        ),
      );

      // Remove the matched text from the sentence
      sentence = sentence.substring(index + query.length);

      // Find the starting index of the next match
      index = sentence.toLowerCase().indexOf(query.toLowerCase());
    }

    // Add any remaining non-matching text
    if (sentence.isNotEmpty) {
      spans.add(TextSpan(text: sentence));
    }

    return spans;
  }

  void showSearchResult(String sentence) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultPage(sentence: sentence),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
                search(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                String sentence = searchResults[index];
                List<TextSpan> spans = _getHighlightSpans(sentence, query);
                return ListTile(
                  title: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: spans,
                    ),
                  ),
                  onTap: () {
                    showSearchResult(sentence);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
