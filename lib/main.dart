import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shop_inventory_mobile/page/add_item.dart';
import 'package:shop_inventory_mobile/page/home_screen.dart';
import 'package:shop_inventory_mobile/page/item_list.dart';
import 'package:shop_inventory_mobile/provider/item_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        title: 'Shop Inventory',
        theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            scaffoldBackgroundColor: const Color(0xfff4f4f4),
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case HomeScreen.routeName:
              return PageTransition(
                child: const HomeScreen(),
                type: PageTransitionType.fade,
              );
            case AddItemScreen.routeName:
              return PageTransition(
                child: const AddItemScreen(),
                type: PageTransitionType.rightToLeft,
              );
            case ItemList.routeName:
              return PageTransition(
                child: const ItemList(),
                type: PageTransitionType.rightToLeft,
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
