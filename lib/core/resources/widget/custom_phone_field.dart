import 'package:flutter/material.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
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
    final responsive = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone Number",
          style: TextStyle(
            fontSize: responsive.scaleWidth(14),
            fontWeight: FontWeight.w500,
            color: const Color(0xFF858D9A),
          ),
        ),
        SizedBox(height: responsive.scaleHeight(10)),
        Container(
          height: responsive.scaleHeight(51),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.scaleWidth(15),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCountry,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: responsive.scaleWidth(25),
                    ),
                    elevation: 16,
                    items: countries.map((country) {
                      return DropdownMenuItem<String>(
                        value: country['code'],
                        child: Text(
                          country['code']!,
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(14),
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
              Container(
                height: responsive.scaleHeight(30),
                width: responsive.scaleWidth(2),
                color: Colors.grey.shade300,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: responsive.scaleWidth(14),
                  ),
                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                    hintStyle: TextStyle(
                      fontSize: responsive.scaleWidth(14),
                      color: AppColors.black,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: responsive.scaleWidth(15),
                    ),
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
