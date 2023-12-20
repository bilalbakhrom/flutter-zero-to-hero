import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];
  var historyList = <WordPair>[];
  GlobalKey? historyListKey;
  GlobalKey? favoritesKey;

  bool isCurrentFavorite() {
    return favorites.contains(current);
  }

  bool isFavorite(WordPair pair) {
    return favorites.contains(pair);
  }

  void getNext() {
    historyList.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  void removeFavorite(
    WordPair element,
    Widget Function(BuildContext context, Animation<double> animation) itemBuilder) {
    if (favorites.contains(element)) {
      var index = favorites.indexOf(element);
      favorites.remove(element);

      var animatedList = favoritesKey?.currentState as AnimatedListState?;
      animatedList?.removeItem(
        index,
        (context, animation) => itemBuilder(context, animation),
      );

      notifyListeners();
    }
  }

  void remove(WordPair element) {
    if (favorites.contains(element)) {
      favorites.remove(element);
      notifyListeners();
    }
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }

    notifyListeners();
  }

  void togglePairFavorite(WordPair pair) {
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }

    notifyListeners();
  }
}
