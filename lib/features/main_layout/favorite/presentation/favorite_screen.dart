import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/CustomListCard.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  final List<Map<String, String>> favoriteProducts = const [
    {'name': 'Strawberry', 'price': '17.00 KD', 'store': 'Store 1'},
    {'name': 'Green Apple', 'price': '12.00 KD', 'store': 'Store 2'},
    {'name': 'Fresh Mango', 'price': '25.00 KD', 'store': 'Store 1'},
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: GoogleFonts.poppins(
            fontSize: responsive.scaleWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: responsive.scaleWidth(25),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        shape: Border(
          bottom: BorderSide(
            color: const Color(0xffDEDFDF),
            width: responsive.scaleWidth(2),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteProducts.length,
        padding: EdgeInsets.symmetric(
          vertical: responsive.scaleHeight(10),
        ),
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];

          return CustomListCard(
            leading: Image.asset(
              AppAssets.product,
              width: responsive.scaleWidth(60),
              height: responsive.scaleHeight(60),
            ),
            title: product['name']!,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['price']!,
                  style: TextStyle(
                    fontSize: responsive.scaleWidth(14),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff656565),
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(8)),
                Text(
                  'Store Name: ${product['store']}',
                  style: TextStyle(
                    fontSize: responsive.scaleWidth(14),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              alignment: Alignment.topRight,
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.close_outlined,
                color: Colors.grey,
                size: responsive.scaleWidth(20),
              ),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
