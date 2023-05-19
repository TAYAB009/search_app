import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  final String sentence;

  const SearchResultPage({Key? key, required this.sentence}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
        title: const Text('Search Result'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200], // Customize the background color here
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              'Search Result',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: Colors
                    .white, // Customize the container background color here
                borderRadius: BorderRadius.circular(
                    8.0), // Customize the container border radius here
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    sentence,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    height: 1.0,
                    color:
                        Colors.grey, // Customize the separator line color here
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 40.0,
                    ),
                    label: const Text(
                      'Back',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .orange, // Customize the button background color here
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
