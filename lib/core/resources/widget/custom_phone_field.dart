import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField({super.key});

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  String selectedCountry = "KW";

  List<Map<String, String>> countries = [
    {'name': 'Kuwait', 'code': 'KW'},
    {'name': 'Egypt', 'code': 'EG'},
    {'name': 'Saudi', 'code': 'SA'},
    {'name': 'Oman', 'code': 'OM'},
    {'name': 'Qatar', 'code': 'QA'},
    {'name': 'Bahrain', 'code': 'BH'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF858D9A),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 51,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCountry,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    underline: const SizedBox.shrink(),
                    iconSize: 25,
                    elevation: 16,
                    items: countries.map((country) {
                      return DropdownMenuItem<String>(
                        value: country['code'],
                        child: Text(
                          country['code']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountry = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Container(height: 30, width: 2, color: Colors.grey.shade300),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                    hintStyle: TextStyle(fontSize: 14, color: AppColors.black),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
