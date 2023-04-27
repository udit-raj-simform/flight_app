import 'package:flight_app/utils/exports.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 140); // start path

    var firstStart = Offset(50.0, size.height - 100);
    var firstEnd = Offset(0.0, size.height - 50);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, size.height - 50);
    var secondStart = Offset(size.width - 50.0, size.height - 100);
    var secondEnd = Offset(size.width, size.height - 140);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    // path.lineTo(size.width, size.height - 140);

    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
