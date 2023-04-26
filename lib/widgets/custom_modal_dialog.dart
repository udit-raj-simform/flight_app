import 'package:flight_app/utils/exports.dart';

class CustomTipsModal extends StatelessWidget {
  const CustomTipsModal({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.paddingSym,
      margin:
          const EdgeInsets.only(top: 15.0, bottom: 0.0, right: 12.0, left: 0.0),
      height: 120,
      width: Constants.deviceWidth - 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 5.0,
          ),
          Column(
            children: [
              const SizedBox(
                height: 12.0,
              ),
              Icon(
                icon,
                size: 35.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.tipsTitle[0],
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  MyStrings.tipsBody[0],
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
