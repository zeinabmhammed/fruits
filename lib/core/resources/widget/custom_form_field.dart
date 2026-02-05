import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';

typedef Validator = String? Function(String?);
class CustomFormField extends StatefulWidget {
  String? label;
  String? hintText;
  Widget? prefixIcon;
  TextInputType keyboardType;
  bool isPassword;
  Validator? validator;
  TextEditingController? controller;
  int? maxLines;

  CustomFormField({
    this.label,
    this.prefixIcon,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.maxLines=1,
    this.validator,
    this.controller,
    super.key,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool secureText = true ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 9.0),
          child: TextFormField(
            controller: widget.controller ,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword && secureText,
            maxLines: widget.maxLines,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hintText,
              filled: true,
              fillColor: AppColors.white,
              hintStyle: TextStyle(
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                padding: const EdgeInsets.all(10),
                child: widget.prefixIcon,
              )
                  : null,
              suffixIcon: widget.isPassword==true ?
              InkWell(
                onTap: () {
                  setState(() {
                    secureText = !secureText;
                  });
                },
                child: Icon(
                  secureText ?
                  Icons.visibility_off_rounded :
                  Icons.visibility_rounded,
                  color: AppColors.grey,
                ),
              ):null,
            ),
          ),
        ),
      ],
    );
  }
}