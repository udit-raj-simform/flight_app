import 'package:flight_app/utils/exports.dart';
import 'package:intl/intl.dart';

class FindFlights extends StatefulWidget {
  const FindFlights({Key? key}) : super(key: key);

  @override
  State<FindFlights> createState() => _FindFlightsState();
}

class _FindFlightsState extends State<FindFlights> {
  bool _hasReturnFlight = true;
  late final TextEditingController departureController;
  late final TextEditingController arrivalController;
  late final TextEditingController classController;
  late final TextEditingController dateController;
  late final TextEditingController travellersController;

  FocusNode arrivalNode = FocusNode();
  FocusNode classNode = FocusNode();
  FocusNode dateNode = FocusNode();
  FocusNode travellerNode = FocusNode();

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
  void dispose() {
    departureController.dispose();
    arrivalController.dispose();
    classController.dispose();
    dateController.dispose();
    travellersController.dispose();
    super.dispose();
  }

  swapDestination() {
    String tempController;
    setState(() {
      tempController = departureController.text;
      departureController.text = arrivalController.text;
      arrivalController.text = tempController;
    });
  }

  final _date = DateTime.now();

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: _date,
      lastDate: DateTime(_date.year, _date.month + 3, _date.day),
    ).then((value) {
      String formattedDate = DateFormat('E, d MMM').format(value!).toString();
      dateController.text = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
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
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                          arrivalNode.requestFocus();
                        },
                      ),
                      CustomTextField(
                        labelText: MyStrings.arrival,
                        controller: arrivalController,
                        focusNode: arrivalNode,
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                          classNode.requestFocus();
                        },
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
                        child: InkWell(
                          onTap: () => swapDestination(),
                          child: Icon(
                            Constants.arrowUpArrowDownCircleFill,
                            size: 20.0,
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                labelText: MyStrings.classTag,
                focusNode: classNode,
                controller: classController,
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                  dateNode.requestFocus();
                },
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomTextField(
                      labelText: "Travel dates",
                      controller: dateController,
                      onFocusChange: (hasFocus) {
                        if (hasFocus) {
                          _showDatePicker();
                        }
                      },
                      focusNode: dateNode,
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                        travellerNode.requestFocus();
                      },
                      suffixIcon: Positioned(
                        top: 15,
                        right: -14,
                        child: IconButton(
                          onPressed: () => _showDatePicker(),
                          icon: Icon(
                            Icons.calendar_today_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: CustomTextField(
                      labelText: "Travellers",
                      controller: travellersController,
                      focusNode: travellerNode,
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
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
                      builder: (context) => TicketsPage(
                        from: 'NZ',
                        to: 'FIJ',
                        className: classController.text,
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
    );
  }
}
