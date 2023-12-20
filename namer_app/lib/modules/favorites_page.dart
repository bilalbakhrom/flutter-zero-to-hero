import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/models/app_state.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  var _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    appState.favoritesKey = _key;
    var favorites = appState.favorites;

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have ${favorites.length} favorites:'),
          ),
        ),
        Expanded(
          child: AnimatedList(
            key: _key,
            initialItemCount: favorites.length,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: FavoriteRow(
                  item: favorites[index],
                  onRemove: () {
                    appState.removeFavorite(
                      favorites[index],
                      (context, animation) =>
                          _buildItem(favorites[index], animation),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildItem(WordPair item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: FavoriteRow(
        item: item,
        onRemove: () {},
      ),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.favorite),
              SizedBox(width: 12),
              Text(item.asLowerCase),
              Spacer(flex: 1),
              TextButton(
                onPressed: () {
                  onRemove();
                },
                child: Text('Remove'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
