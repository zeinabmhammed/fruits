import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class CancelOrderPopup extends StatefulWidget {
  const CancelOrderPopup({super.key});

  @override
  State<CancelOrderPopup> createState() => _CancelOrderPopupState();
}

class _CancelOrderPopupState extends State<CancelOrderPopup> {
  String? selectedReason;
  final List<String> reasons = [
    "Changed my mind",
    "Ordered by mistake",
    "Delivery is too late",
    "Found a better price elsewhere",
    "Incorrect items in cart",
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(responsive.scaleWidth(20)),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.scaleWidth(20),
          vertical: responsive.scaleHeight(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsive.scaleHeight(20)),
            Center(
              child: Text(
                "Cancel Order",
                style: TextStyle(
                  fontSize: responsive.scaleWidth(18),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(10)),

            Text(
              "Reason",
              style: TextStyle(
                fontSize: responsive.scaleWidth(14),
                color: const Color(0xff858D9A),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: responsive.scaleHeight(8)),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.scaleWidth(15),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(
                    "Please select reason",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: responsive.scaleWidth(14),
                    ),
                  ),
                  value: selectedReason,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                    size: responsive.scaleWidth(35),
                  ),
                  items: reasons.map((String reason) {
                    return DropdownMenuItem<String>(
                      value: reason,
                      child: Text(
                        reason,
                        style: TextStyle(fontSize: responsive.scaleWidth(14)),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => selectedReason = value);
                  },
                ),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(20)),

            Text(
              "Notes",
              style: TextStyle(
                fontSize: responsive.scaleWidth(14),
                color: const Color(0xff858D9A),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: responsive.scaleHeight(8)),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: responsive.scaleWidth(10),
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(responsive.scaleWidth(30)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.all(responsive.scaleWidth(12)),
                ),
              ),
            ),
            SizedBox(height: responsive.scaleHeight(30)),

            Center(
              child: SizedBox(
                width: responsive.scaleWidth(224),
                height: responsive.scaleHeight(45),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(responsive.scaleWidth(25)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Confirm Cancellation",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.scaleWidth(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: responsive.scaleWidth(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
