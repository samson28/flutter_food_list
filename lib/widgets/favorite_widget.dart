import 'package:flutter/material.dart';
import '../utilities/favorite_change_notifier.dart';
import 'package:provider/provider.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

/*  const FavoriteWidget(
      {Key? key, required this.isFavorite, required this.favoriteCount})
      : super(key: key);

  final bool isFavorite;
  final int favoriteCount;*/

  @override
  State<FavoriteWidget> createState() =>
      _FavoriteWidgetState(/*isFavorite, favoriteCount*/);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  late bool _isFavorite;
  //late int _favoriteCount;

  //_FavoriteWidgetState(this._isFavorite, this._favoriteCount);

  void _toggleFavorite(FavoriteChangeNotifier _notifier) {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        //_favoriteCount -= 1;
      } else {
        _isFavorite = true;
        // _favoriteCount += 1;
      }

      _notifier.isFavorite = _isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteChangeNotifier _notifier =
        Provider.of<FavoriteChangeNotifier>(context);
    _isFavorite = _notifier.isFavorite;
    return Row(
      children: [
        IconButton(
          icon: _isFavorite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          color: Theme.of(context).primaryColor,
          onPressed: () => _toggleFavorite(_notifier),
        ),
        Consumer<FavoriteChangeNotifier>(
            builder: (context, notifier, _) =>
                Text(notifier.favoriteCount.toString()))
      ],
    );
  }
}
