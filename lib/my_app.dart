import 'package:flight_app/utils/exports.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flight Booking",
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      theme: AppTheme.light(),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: const Home(),
    );
  }
}
