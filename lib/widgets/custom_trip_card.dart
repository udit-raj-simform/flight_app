import 'package:flight_app/utils/exports.dart';
import 'package:flight_app/widgets/custom_card_container.dart';

class CustomTripCard extends StatelessWidget {
  const CustomTripCard({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomCardContainer(
      child: Container(
        color: color,
        padding: const EdgeInsets.all(20.0),
        height: 221,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NZ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    height: 0.9,
                  ),
                ),
                Text(
                  "07:00 | 03 April 2023",
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Icon(
                  Icons.arrow_downward_sharp,
                  color: Theme.of(context).colorScheme.background,
                  size: 35.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "FIJ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "19:00 | 03 April 2023",
                      style: TextStyle(
                        color: Colors.grey.shade200,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: Constants.deviceWidth / 2 - 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
