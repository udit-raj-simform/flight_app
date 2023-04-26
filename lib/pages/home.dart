import 'package:flight_app/pages/tickets.dart';
import 'package:flight_app/utils/exports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomSelectedIndex = 0;
  bool _hasReturnFlight = true;
  late final TextEditingController departureController;
  late final TextEditingController arrivalController;
  late final TextEditingController classController;
  late final TextEditingController dateController;
  late final TextEditingController travellersController;

  @override
  void initState() {
    departureController =
        TextEditingController(text: "New Zealand, Oceania (NZ)");
    arrivalController = TextEditingController(text: "Fiji Outer Islands (FIJ)");
    classController = TextEditingController(text: MyStrings.classNames[0]);
    dateController = TextEditingController(text: "Fri, 31st Mar");
    travellersController = TextEditingController(text: "2");
    super.initState();
  }

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Find flights",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      MyStrings.returnFlight,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      // sized box is used to remove the default margin/padding form all sides
                      height: 20.0,
                      width: 20.0,
                      child: Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: _hasReturnFlight,
                        onChanged: (value) => setState(
                            () => _hasReturnFlight = !(_hasReturnFlight)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        CustomTextField(
                          labelText: MyStrings.depart,
                          controller: departureController,
                        ),
                        CustomTextField(
                          labelText: MyStrings.arrival,
                          controller: arrivalController,
                        ),
                      ],
                    ),
                    Positioned(
                      top: 56.0,
                      right: 20.0,
                      child: ClipOval(
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Constants.arrowUpArrowDownCircleFill,
                            size: 20.0,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: MyStrings.classTag,
                  controller: classController,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        labelText: "Travel dates",
                        controller: dateController,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: CustomTextField(
                        labelText: "Travellers",
                        controller: travellersController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: Constants.deviceWidth,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TicketsPage(
                          from: 'NZ',
                          to: 'FIJ',
                        ),
                      ),
                    ),
                    child: Text(
                      MyStrings.titleText,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Tips for your trip",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        10,
                        (index) => CustomTipsModal(
                          icon: Constants.tipsIcon[index],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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
