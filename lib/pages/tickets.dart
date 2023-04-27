import 'package:flight_app/utils/exports.dart';
import 'package:flight_app/widgets/custom_card_container.dart';
import 'package:flight_app/widgets/custom_ticket_card.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage(
      {Key? key, required this.from, required this.to, required this.className})
      : super(key: key);
  final String from;
  final String to;
  final String className;

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  late final Image myCardImage;

  @override
  void initState() {
    myCardImage = Image.network(
      "https://bit.ly/40IBHcb",
      fit: BoxFit.cover,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(myCardImage.image, context, onError: (object, stackTrace) {
      debugPrint("Object : $object \n StackTrace : $stackTrace");
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.from,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 30.0,
                          ),
                        ),
                        Text(
                          widget.to,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.filter_list,
                            size: 30.0,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 400,
                  width: Constants.deviceWidth,
                  padding: const EdgeInsets.all(0.0),
                  child: CustomCardContainer(
                    child: Card(
                        color: Theme.of(context).colorScheme.background,
                        margin: const EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: Constants.deviceWidth,
                                height: 400 * 0.4,
                                child: myCardImage,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: CustomTicketCard(
                                className: widget.className,
                                airways: 'AVA',
                                to: widget.to,
                                from: widget.from,
                                inTime: '06:00',
                                outTime: '18:10',
                                totalTime: '12h 10min',
                                price: 550,
                                hasDiscount: true,
                                planeId: 'AVA772',
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "All Deals",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ...List.generate(
                  10,
                  (index) => Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: CustomCardContainer(
                      child: CustomTicketCard(
                        className: widget.className,
                        airways: 'AVA',
                        to: widget.to,
                        from: widget.from,
                        inTime: '06:00',
                        outTime: '18:10',
                        totalTime: '12h 10min',
                        price: 550,
                        hasDiscount: true,
                        planeId: 'AVA772',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
