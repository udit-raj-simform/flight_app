import 'package:flight_app/utils/exports.dart';

class CustomTicketCard extends StatelessWidget {
  const CustomTicketCard({
    Key? key,
    required this.className,
    required this.airways,
    required this.to,
    required this.from,
    required this.inTime,
    required this.outTime,
    required this.totalTime,
    required this.planeId,
    required this.price,
    required this.hasDiscount,
  }) : super(key: key);
  final String className;
  final String airways;
  final String to;
  final String from;
  final String inTime;
  final String outTime;
  final String totalTime;
  final String planeId;
  final int price;
  final bool hasDiscount;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: Constants.paddingAll,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    airways,
                    style: const TextStyle(
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
                  "$className Class",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                inTime,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              Text(
                totalTime,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                outTime,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                from,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
              Text(
                to,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Divider(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 2.0,
                  endIndent: 10,
                ),
              ),
              Icon(
                Constants.airplane,
                color: Theme.of(context).colorScheme.primary,
                size: 35.0,
              ),
              Expanded(
                child: Divider(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 2.0,
                  indent: 10,
                ),
              ),
            ],
          ),
          (hasDiscount)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${(price * 0.6363).toStringAsFixed(0)}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                planeId,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 19.0,
                ),
              ),
              Text(
                "\$${price.toString()}",
                style: (hasDiscount)
                    ? const TextStyle(
                        color: Colors.black54,
                        fontSize: 19.0,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.black54)
                    : TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
