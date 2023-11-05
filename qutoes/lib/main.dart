import 'package:flutter/material.dart';
import 'package:qutoes/quote.dart';


void main() {
  runApp(const MaterialApp(
    home: QuoteList(),
  ));
}


class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote('Be yourself, everyone else is already taken', 'Oscar Wilde'),
    Quote('Be yourself, everyone else is already taken', 'Oscar Wilde'),
    Quote('I have nothing to declare except my genius', 'Umar Yusuf'),
    Quote('The truth is rarely pure and never simple', 'Abdullah Bobur'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        title: const Text(
          "Awesome Quotes",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quotes.map((quote) => QuoteCard(quote)).toList(),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  Quote quote;

  QuoteCard(this.quote, {super.key});

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
            )
          ],
        ),
      ),
    );
  }
}
