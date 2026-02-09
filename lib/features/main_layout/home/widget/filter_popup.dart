import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class FilterPopup {
  static void show(BuildContext context) {
    bool offers = false;
    bool freeDelivery = false;
    String selectedArea = "All Areas";

    final responsive = Responsive(context);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(responsive.scaleWidth(20)),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(responsive.scaleWidth(20)),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(responsive.scaleWidth(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Filter by",
                      style: TextStyle(
                        fontSize: responsive.scaleWidth(18),
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: responsive.scaleHeight(20)),

                    Row(
                      children: [
                        Text(
                          "Delivered To",
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(15),
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ),
                        SizedBox(width: responsive.scaleWidth(8)),
                        SvgPicture.asset(
                          AppAssets.deliveryIcon,
                          height: responsive.scaleHeight(18),
                          color: AppColors.green,
                        ),
                      ],
                    ),
                    SizedBox(height: responsive.scaleHeight(20)),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: responsive.scaleWidth(15),
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(responsive.scaleWidth(25)),
                        border: Border.all(
                          color: const Color(0xff858D9A),
                          width: responsive.scaleWidth(1),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedArea,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          iconSize: responsive.scaleWidth(30),
                          elevation: 16,
                          items: const [
                            DropdownMenuItem(
                              value: "All Areas",
                              child: Text("All Areas"),
                            ),
                            DropdownMenuItem(
                              value: "Area 1",
                              child: Text("Area 1"),
                            ),
                            DropdownMenuItem(
                              value: "Area 2",
                              child: Text("Area 2"),
                            ),
                          ],
                          onChanged: (val) {
                            setState(() {
                              selectedArea = val!;
                            });
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: offers,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(responsive.scaleWidth(20)),
                          ),
                          onChanged: (val) {
                            setState(() {
                              offers = val!;
                            });
                          },
                          activeColor: AppColors.grey,
                        ),
                        Text(
                          "Offers",
                          style: TextStyle(fontSize: responsive.scaleWidth(15)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: freeDelivery,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(responsive.scaleWidth(20)),
                          ),
                          onChanged: (val) {
                            setState(() {
                              freeDelivery = val!;
                            });
                          },
                          activeColor: AppColors.green,
                        ),
                        Text(
                          "Free Delivery",
                          style: TextStyle(fontSize: responsive.scaleWidth(15)),
                        ),
                      ],
                    ),
                    SizedBox(height: responsive.scaleHeight(20)),
                    SizedBox(
                      width: responsive.scaleWidth(244),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(responsive.scaleWidth(25)),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: responsive.scaleHeight(14),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Apply Filter",
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(16),
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: responsive.scaleHeight(12)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: Text(
                          "Close",
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(16),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
