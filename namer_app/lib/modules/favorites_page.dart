import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/models/app_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    return ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have ${favorites.length} favorites:'),
          ),
        ),
        for (var element in favorites)
          FavoriteRow(
            item: element,
            onRemove: () {
              appState.remove(element);
            },
          ),
      ],
    );
  }
}

class FavoriteRow extends StatelessWidget {
  WordPair item;
  Function onRemove;

  FavoriteRow({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.favorite),
            SizedBox(width: 12),
            Text(item.asLowerCase),
            Expanded(child: Container()),
            TextButton(
              onPressed: () {
                onRemove();
              },
              child: Text('Remove'),
            ),
          ],
        ),
      ),
    );
  }
}
