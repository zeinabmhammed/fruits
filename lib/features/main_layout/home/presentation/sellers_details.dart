import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SellersDetails extends StatelessWidget {
  const SellersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Fruit Market",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.searchIcon, width: 26),
          ),

          const SizedBox(width: 10),
        ],
        shape: Border(bottom: BorderSide(color: Color(0xffDEDFDF), width: 1)),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _buildSellerCard(
              logo: AppAssets.sellerLogo,
              name: "Seller name",
              delivery: index == 0
                  ? "Delivery Charges: 0.5 KD"
                  : "Free Delivery",
              status: index % 2 == 0 ? "Open" : "Close",
              category: index == 0
                  ? "Beverages"
                  : index == 1
                  ? "Pizza"
                  : "Fried Chicken",
              distance: "2.5 KM",
              rating: "4.5",
            );
          },
        ),
      ),

    );
  }
  Widget _buildSellerCard({
    required String logo,
    required String name,
    required String delivery,
    required String status,
    required String category,
    required String distance,
    required String rating,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(logo, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.deliveryIcon,
                        height: 16,
                        color: AppColors.green,
                      ),
                      SizedBox(width: 5),
                      Text(
                        delivery,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$status · $category",
                        style: TextStyle(
                          fontSize: 13,
                          color: status == "Open"
                              ? AppColors.green
                              : Colors.redAccent,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            distance,
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.green,
                            ),
                          ),
                          SizedBox(width: 2),
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: SvgPicture.asset(
                              AppAssets.locationIcon,
                              height: 16,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
