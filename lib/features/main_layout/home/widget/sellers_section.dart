import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';

class SellersSection extends StatelessWidget {
  const SellersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.scaleWidth(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sellers",
                style: TextStyle(
                  fontSize: responsive.scaleWidth(18),
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                "Show all",
                style: TextStyle(
                  fontSize: responsive.scaleWidth(18),
                  color: const Color(0xff235C95),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: responsive.scaleHeight(12)),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (_, __) =>
              SizedBox(height: responsive.scaleHeight(12)),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/sellersDetails");
              },
              child: _buildSellerCard(
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
                responsive: responsive,
              ),
            );
          },
        ),
      ],
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
    required Responsive responsive,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.scaleWidth(16)),
      child: Container(
        padding: EdgeInsets.all(responsive.scaleWidth(12)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(responsive.scaleWidth(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: responsive.scaleWidth(6),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: responsive.scaleWidth(80),
              height: responsive.scaleHeight(80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(responsive.scaleWidth(12)),
              ),
              child: Image.asset(logo, fit: BoxFit.cover),
            ),
            SizedBox(width: responsive.scaleWidth(12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: responsive.scaleWidth(15),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: responsive.scaleWidth(4)),
                      Text(
                        rating,
                        style: TextStyle(
                          fontSize: responsive.scaleWidth(13),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsive.scaleHeight(4)),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.deliveryIcon,
                        height: responsive.scaleHeight(16),
                        color: AppColors.green,
                      ),
                      SizedBox(width: responsive.scaleWidth(5)),
                      Text(
                        delivery,
                        style: TextStyle(
                          fontSize: responsive.scaleWidth(13),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsive.scaleHeight(4)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$status · $category",
                        style: TextStyle(
                          fontSize: responsive.scaleWidth(13),
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
                              fontSize: responsive.scaleWidth(10),
                              color: AppColors.green,
                            ),
                          ),
                          SizedBox(width: responsive.scaleWidth(2)),
                          Padding(
                            padding: EdgeInsets.only(
                              top: responsive.scaleHeight(7),
                            ),
                            child: SvgPicture.asset(
                              AppAssets.locationIcon,
                              height: responsive.scaleHeight(16),
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
