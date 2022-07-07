import 'package:flutter/material.dart';
import '../models/album_model.dart';

class DisplayAlbums extends StatelessWidget {
  final List<Album>? albums;
  final int userId;
  const DisplayAlbums(this.albums, this.userId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Album>? currentUserAlbums =
        albums?.where((album) => album.userId == userId).toList();
    return ListView.builder(
      itemBuilder: ((context, index) {
        return Card(
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Text(
                  currentUserAlbums![index].title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        );
      }),
      itemCount: currentUserAlbums?.length,
    );
  }
}
