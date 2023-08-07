import 'package:ecommerce/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData? icon;
  final String? helperText;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.icon,
      this.helperText,
      this.obscureText,
      this.onChanged,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  late FocusNode focusNode;
  late Color labelColor;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    labelColor = Colors.black;
    focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      labelColor =
          focusNode.hasFocus ? AppColors.goldcolor : AppColors.appBlack;
    });
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1,
        child: TextFormField(
          focusNode: focusNode,
          controller: widget.controller,
          // obscureText: isVisible == true ? true : false, //use flase if Null
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: labelColor),
            hintText: widget.hintText,
            suffixIcon: widget.icon != null
                ? GestureDetector(
                    onTap: () => _selectDate(context, widget.controller),
                    child: Icon(
                      widget.icon,
                      color: AppColors.greyshade,
                    ))
                : null,
            helperText: widget.helperText,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.appBlack, width: 2.0),
            ),
          ),
          onChanged: widget.onChanged,
          validator: widget.validator,
        ),
      ),
    );
  }
}
