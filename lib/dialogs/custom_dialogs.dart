import 'package:flight_app/utils/exports.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          titlePadding: const EdgeInsets.all(0.0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          contentPadding: EdgeInsets.zero,
          children: [
            SizedBox(
              width: Constants.deviceWidth,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: child,
              ),
            ),
          ],
        ),
      ),
      child: child,
    );
  }
}
