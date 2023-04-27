import 'package:flight_app/screens/find_flights.dart';
import 'package:flight_app/screens/profile.dart';
import 'package:flight_app/screens/trips.dart';
import 'package:flight_app/utils/exports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomSelectedIndex = 0;

  final List<Widget> screens = [
    const FindFlights(),
    const Trips(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: SizedBox(
            height: 90,
            child: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              selectedLabelStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
              selectedItemColor: MyColors.primary,
              unselectedItemColor: Colors.grey,
              // fixedColor: Theme.of(context).colorScheme.onBackground,
              currentIndex: _bottomSelectedIndex,
              onTap: (index) => setState(() => _bottomSelectedIndex = index),
              items: <BottomNavigationBarItem>[
                customBottomNavItem(
                  MyStrings.titleText,
                  Icons.flight_takeoff_rounded,
                  0,
                ),
                customBottomNavItem(
                  "Trips",
                  Icons.airplane_ticket_outlined,
                  1,
                ),
                customBottomNavItem(
                  "Profile",
                  Icons.person_2_outlined,
                  2,
                ),
              ],
            ),
          ),
          body: screens[_bottomSelectedIndex]),
    );
  }

  BottomNavigationBarItem customBottomNavItem(
          String label, IconData iconData, int index) =>
      BottomNavigationBarItem(
        icon: Container(
          decoration: BoxDecoration(
            color: (index == _bottomSelectedIndex)
                ? MyColors.markerColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 25.0,
          ),
          child: Icon(iconData),
        ),
        label: label,
      );
}
