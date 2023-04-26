import 'package:flight_app/utils/exports.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key, required this.labelText, required this.controller})
      : super(key: key);
  final String labelText;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey.shade200, width: 2.0),
      ),
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.grey.shade500, fontWeight: FontWeight.w600),
        ),
        autocorrect: true,
        focusNode: FocusNode(),
      ),
    );
  }
}
