import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:groceries_online/const/theme_data.dart';
import 'package:groceries_online/inner_screen/feed_screen.dart';
import 'package:groceries_online/inner_screen/on_sale_screen.dart';
import 'package:groceries_online/provider/dark_theme_provider.dart';
import 'package:groceries_online/screens/btm_bar.dart';

import 'package:provider/provider.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool _isDark = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: BottomBarScreen(),
          routes: {
            OnsaleScreen.routeName: (ctx) => OnsaleScreen(),
            FeedScreen.routeName: (ctx) => FeedScreen()
          },
        );
      }),
    );
  }
}
