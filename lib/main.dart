import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './utils/app_routes.dart';

import './views/product_detail_screen.dart';
import './views/cart_screen.dart';
import './views/orders_screen.dart';
import './views/products_screen.dart';
import './views/product_form_screen.dart';

import './views/auth_home_screen.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import 'package:shop/providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => new Products(null, []),
          update: (ctx, auth, previuosProducts) =>
              new Products(auth.token, previuosProducts.items),
        ),
        ChangeNotifierProvider(create: (_) => new Cart()),
        ChangeNotifierProvider(create: (_) => new Orders()),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        // home: ProductOverviewScreen(),
        routes: {
          AppRoutes.AUTH_HOME: (ctx) => AuthOrHomeScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.ORDERS: (ctx) => OrdersScreen(),
          AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormScreen(),
        },
      ),
    );
  }
}
