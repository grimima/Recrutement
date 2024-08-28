import 'package:flutter/material.dart';
import 'widgets/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localization/flutter_localization.dart';

// Define AppLocale
mixin AppLocale {
  static const String title = 'title';
  static const String thisIs = 'thisIs';

  static const Map<String, dynamic> EN = {
    title: 'Localization',
    thisIs: 'This is %a package, version %a.',
  };
  static const Map<String, dynamic> FR = {
    title: 'Localisation',
    thisIs: 'Ceci est un package %a, version %a.',
  };
}

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    _localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN,
            countryCode: 'US', fontFamily: 'Font EN'),
        const MapLocale('fr', AppLocale.FR,
            countryCode: 'FR', fontFamily: 'Font FR'),
        // Add more locales if needed
      ],
      initLanguageCode: 'en',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
