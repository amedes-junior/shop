import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

import '../providers/products.dart';

import 'package:provider/provider.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Products products = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorite) {
                products.showFavoriteOnly();
              } else {
                products.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              )
            ],
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
