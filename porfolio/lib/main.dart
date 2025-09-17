import 'package:flutter/material.dart';
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
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF007AFF),
        primaryColorDark: Color(0xFF0066CC),
        hintColor: Color(0xFF5856D6),
        scaffoldBackgroundColor: Color(0xFFF5F5F7),
        fontFamily: 'Inter',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1D1D1F),
          ),
          displayMedium: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1D1D1F),
          ),
          displaySmall: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1D1D1F),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF86868B),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF86868B),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF0A84FF),
        primaryColorDark: Color(0xFF0066CC),
        hintColor: Color(0xFF5E5CE6),
        scaffoldBackgroundColor: Color(0xFF000000),
        fontFamily: 'Inter',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: Color(0xFFFFFFFF),
          ),
          displayMedium: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFFFFF),
          ),
          displaySmall: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF8D8D93),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF8D8D93),
          ),
        ),
      ),
      home: PortfolioHomePage(),
    );
  }
}
