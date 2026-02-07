import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';

class FilterPopup {
  static void show(BuildContext context) {
    bool offers = false;
    bool freeDelivery = false;
    String selectedArea = "All Areas";

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Filter by",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ✨ Delivered To + Icon + Dropdown
                    Row(
                      children: [
                        const Text(
                          "Delivered To",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          AppAssets.deliveryIcon,
                          height: 18,
                          color: AppColors.green,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Color(0xff858D9A), width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedArea,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
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
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onChanged: (val) {
                            setState(() {
                              offers = val!;
                            });
                          },
                          activeColor: AppColors.grey,
                        ),
                        const Text("Offers", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: freeDelivery,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onChanged: (val) {
                            setState(() {
                              freeDelivery = val!;
                            });
                          },
                          activeColor: AppColors.green,
                        ),
                        const Text(
                          "Free Delivery",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 244,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Apply Filter",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Center(
                        child: Text(
                          "Close",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
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
