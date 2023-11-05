import 'package:flutter/material.dart';
import 'package:qutoes/quote.dart';

class QuoteCard extends StatelessWidget {
  Quote quote;
  void Function() delete;

  QuoteCard(this.quote, this.delete);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              quote.author,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            IconButton(
              onPressed: delete,
              icon: const Icon(Icons.delete),
              iconSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}