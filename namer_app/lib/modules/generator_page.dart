import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/models/app_state.dart';
import 'package:namer_app/components/big_card.dart';
import 'package:namer_app/components/history_list.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryList(),
          ),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: appState.isCurrentFavorite()
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                label: appState.isCurrentFavorite()
                    ? Text('Unlike')
                    : Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }
}
