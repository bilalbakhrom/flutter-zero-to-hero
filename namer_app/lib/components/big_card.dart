import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class BigCard extends StatefulWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  State<BigCard> createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: AnimatedSize(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 200),
          child: Text(
            widget.pair.asLowerCase,
            style: style,
            semanticsLabel: "${widget.pair.first} ${widget.pair.second}",
          ),
        ),
      ),
    );
  }
}
