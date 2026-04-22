import 'package:qirb_garage/src/imports/core_imports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Widget current = _buildMaterialApp(context);

    current = ScreenUtilWrapper(child: current);

    return current;
  }

  Widget _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      title: 'Qirb Garage',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(primaryColorHex: '#10b981'), // Green accent
      darkTheme: buildDarkTheme(primaryColorHex: '#10b981'),
      themeMode: ThemeMode.light, // Force light mode for white background
      routerConfig: appRouter,
      builder: (context, child) {
        Widget current = child!;
        current = SkeletonWrapper(child: current);
        // SessionListenerWrapper removed - session handling now in splash screen
        return current;
      },
    );
  }
}
