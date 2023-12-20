import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:namer_app/models/app_state.dart';
import 'package:provider/provider.dart';

class HistoryList extends StatefulWidget {
  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final _key = GlobalKey();

  static const Gradient _maskingGradient = LinearGradient(
      colors: [Colors.transparent, Colors.black],
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    appState.historyListKey = _key;
    var historyList = appState.historyList;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        initialItemCount: historyList.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  appState.togglePairFavorite(historyList[index]);
                },
                icon: createIcon(appState, historyList[index]),
                label: Text(historyList[index].asLowerCase),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget createIcon(MyAppState appState, WordPair pair) {
    return appState.isFavorite(pair)
        ? Icon(Icons.favorite, size: 12)
        : SizedBox();
  }
}
