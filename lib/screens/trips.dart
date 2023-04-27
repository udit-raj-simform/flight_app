import 'package:flight_app/dialogs/custom_dialogs.dart';
import 'package:flight_app/pages/borading_pass.dart';
import 'package:flight_app/utils/exports.dart';
import 'package:flight_app/widgets/custom_trip_card.dart';

class Trips extends StatelessWidget {
  const Trips({Key? key}) : super(key: key);

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
                    "Trips",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BoardingPass(),
                  ),
                ),
                child: CustomTripCard(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Upcoming Trips",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 447,
                child: Stack(
                  children: const [
                    CustomDialog(
                      child: CustomTripCard(
                        color: MyColors.cardColor1,
                      ),
                    ),
                    Positioned(
                      top: 90,
                      child: CustomDialog(
                        child: CustomTripCard(
                          color: MyColors.cardColor2,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 175,
                      child: CustomDialog(
                        child: CustomTripCard(
                          color: MyColors.cardColor3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
