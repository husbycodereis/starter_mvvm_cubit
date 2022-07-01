import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    this.isCapitalized = false,
    this.isObscure = false,
    this.toggleIsObscure,
  }) : super(key: key);
  final String title;
  final bool isCapitalized;
  final bool? isObscure;
  final void Function()? toggleIsObscure;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscureChanged = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      obscureText: isObscureChanged,
      cursorHeight: 20,
      autocorrect: false,
      textCapitalization: widget.isCapitalized ? TextCapitalization.words : TextCapitalization.none,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget.title,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.transparent)),
          suffixIcon: widget.isObscure!
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureChanged = !isObscureChanged;
                    });
                  },
                  child: Icon(isObscureChanged ? Icons.visibility_off : Icons.visibility))
              : null),
    );
  }
}
