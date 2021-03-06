import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import '../blocs/stories_provider.dart';
import '../widgets/news_list_tile.dart';
import '../widgets/refresh.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Top News')),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Refresh(
            ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, int index) {
                  bloc.fetchItem(snapshot.data[index]);
                  return NewsListTile(
                    itemId: snapshot.data[index],
                  );
                }),
          );
        }
      },
      stream: bloc.topIds,
    );
  }
}
