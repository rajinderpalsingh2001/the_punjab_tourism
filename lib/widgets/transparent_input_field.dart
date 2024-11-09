import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransparentInputField extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? icon;
  final bool obscureText;
  final Widget? suffixWidget;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const TransparentInputField({
    this.margin,
    this.onTap,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.icon,
    this.obscureText = false,
    this.suffixWidget,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  _EstimatedPriceInputFieldState createState() =>
      _EstimatedPriceInputFieldState();
}

class _EstimatedPriceInputFieldState extends State<TransparentInputField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        autofocus: true,
        key: widget.key,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        maxLines: 1,
        cursorColor: Colors.black,
        obscureText: _obscureText,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent, // Set background color to transparent
          border: InputBorder.none, // No border
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintStyle: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon == null
              ? null
              : Icon(
                  widget.prefixIcon,
                  color: Colors.black,
                  size: 40.0,
                ),
          icon: widget.icon == null ? null : Icon(widget.icon),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffixWidget,
          contentPadding: const EdgeInsets.all(20.0),
        ),
        buildCounter: (context,
            {required currentLength, required isFocused, required maxLength}) {
          return widget.maxLength == null
              ? null
              : Text(
                  '$currentLength / ${widget.maxLength}',
                  style: TextStyle(
                    color: currentLength > (widget.maxLength ?? 0)
                        ? Colors.red
                        : null,
                  ),
                );
        },
        textCapitalization: widget.textCapitalization,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Days is required';
          }
          String pattern = r'^[1-9][0-9]*$';
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(value)) {
            return 'Enter valid Day';
          }
          return null;
        },
        maxLength: widget.maxLength,
      ),
    );
  }
}
