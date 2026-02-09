import 'package:flutter/material.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/CustomDropdownField.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/custom_selection_tile.dart';


class DeliveryTimeSection extends StatelessWidget {
  const DeliveryTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSelectionTile(title: "Now", isSelected: true),
        SizedBox(height: responsive.scaleHeight(20)),
        Container(
          height: responsive.scaleHeight(170),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: responsive.scaleWidth(10),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(responsive.scaleWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Delivery Time",
                  style: TextStyle(
                    fontSize: responsive.scaleWidth(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(10)),
                Text(
                  "Select Date",
                  style: TextStyle(fontSize: responsive.scaleWidth(14)),
                ),
                SizedBox(height: responsive.scaleHeight(10)),
              CustomDropdownField(selectedDate: "09-15-2021"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
