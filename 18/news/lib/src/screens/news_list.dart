import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import '../blocs/stories_provider.dart';
import '../widgets/news_list_tile.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    // THIS IS BAD!!
    // temporary
    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(title: Text('News Feed')),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                bloc.fetchItem(snapshot.data[index]);
                return NewsListTile(
                  itemId: snapshot.data[index],
                );
              });
        }
      },
      stream: bloc.topIds,
    );
  }
}
