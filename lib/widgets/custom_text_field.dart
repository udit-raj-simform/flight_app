import 'package:flight_app/utils/exports.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.onFocusChange,
    this.onEditingComplete,
    this.focusNode,
  }) : super(key: key);
  final String labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final void Function(bool)? onFocusChange;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;

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
      child: Stack(
        children: <Widget>[
          TextFormField(
            controller: widget.controller,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 80),
            onEditingComplete: widget.onEditingComplete,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w600,
              ),
            ),
            autocorrect: true,
            focusNode: widget.focusNode,
            keyboardAppearance: Brightness.dark,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            cursorHeight: 12.0,
          ),
          suffixIconWidget()
        ],
      ),
    );
  }

  Widget suffixIconWidget() {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon!;
    } else {
      return const SizedBox();
    }
  }
}
