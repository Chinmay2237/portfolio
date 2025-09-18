import 'package:flutter/material.dart';
import 'package:porfolio/core/theme.dart';
import 'package:porfolio/data/repositories/mock_portflio_repository.dart';
import 'package:porfolio/presentation/view_models/portfolio_view_model.dart';
import 'package:porfolio/presentation/view_models/scroll_view_model.dart';
import 'package:porfolio/presentation/view_models/theme_provider.dart';
import 'package:porfolio/presentation/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollViewModel()),
        ChangeNotifierProvider(
          create: (_) => PortfolioViewModel(MockPortfolioRepository()),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: FlutterDevPortfolio(),
    ),
  );
}

class FlutterDevPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: PortfolioHomePage(),
    );
  }
}
