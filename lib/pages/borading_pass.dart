import 'package:flight_app/designs/my_custom_clipper.dart';
import 'package:flight_app/utils/exports.dart';

class BoardingPass extends StatelessWidget {
  const BoardingPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  const Text(
                    "Boarding pass",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const SizedBox(
                      height: 25,
                      width: 25,
                      child: Icon(
                        Icons.close,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "AVA",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              "Business Class",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NZ",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 60.0,
                              height: 0.9,
                            ),
                          ),
                          const Text(
                            "New Zealand, Oceania (NZ)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                          const Text(
                            "07:00 | 03 April 2023",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Theme.of(context).colorScheme.background,
                            size: 35.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "FIJ",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontWeight: FontWeight.bold,
                              fontSize: 60.0,
                              height: 0.9,
                            ),
                          ),
                          const Text(
                            "Fiji Outer Islands (FIJ)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "19:00 | 03 April 2023",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      myDottedDivider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "Seat",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                "5B",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 1.0,
                            ),
                          ),
                          Column(
                            children: const [
                              Text(
                                "Terminal",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                "H72",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 1.0,
                            ),
                          ),
                          Column(
                            children: const [
                              Text(
                                "Flight",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                "B33",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 1.0,
                            ),
                          ),
                          Column(
                            children: const [
                              Text(
                                "Gate",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                "A12",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
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
                  onPressed: () {},
                  child: Text(
                    "Download pass",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myDottedDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(
          100,
          (index) => const SizedBox(
            width: 1,
            child: Divider(
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
