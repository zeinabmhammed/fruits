import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/CustomListCard.dart';
import 'package:fruits/features/main_layout/home/widget/category_item.dart';
import 'package:google_fonts/google_fonts.dart';

class SellersDetails extends StatelessWidget {
  const SellersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.black, size: responsive.scaleWidth(25)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Fruit Market",
          style: GoogleFonts.poppins(
            fontSize: responsive.scaleWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppAssets.searchIcon,
              width: responsive.scaleWidth(26),
            ),
          ),
          SizedBox(width: responsive.scaleWidth(10)),
        ],
        shape: Border(
          bottom: BorderSide(
            color: const Color(0xffDEDFDF),
            width: responsive.scaleWidth(2),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListCard(
              leading: Image.asset(AppAssets.sellerLogo),
              title: " Seller Name",
              subtitle: Text(
                "Delivery : 40 to 60 Min",
                style: TextStyle(
                  fontSize: responsive.scaleWidth(14),
                ),
              ),
              trailing: SvgPicture.asset(AppAssets.discount),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.scaleWidth(16),
                vertical: responsive.scaleHeight(10),
              ),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: responsive.scaleWidth(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: responsive.scaleHeight(110),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.scaleWidth(20),
                ),
                children: [
                  CategoryItem(label: "Fruits", image: AppAssets.fruits),
                  CategoryItem(label: "Vegetables", image: AppAssets.vegetables),
                  CategoryItem(label: "Phone", image: AppAssets.phone),
                  CategoryItem(label: "Pets", image: AppAssets.pets),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.scaleWidth(16),
                vertical: responsive.scaleHeight(10),
              ),
              child: Text(
                "Products",
                style: TextStyle(
                  fontSize: responsive.scaleWidth(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/productDetails");
                  },
                  child: CustomListCard(
                    leading: Image.asset(AppAssets.product),
                    title: " Seller Name",
                    subtitle: Text(
                      "Delivery : 40 to 60 Min",
                      style: TextStyle(
                        fontSize: responsive.scaleWidth(14),
                      ),
                    ),
                    trailing: Image.asset(
                      AppAssets.add,
                      scale: 2.5,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
