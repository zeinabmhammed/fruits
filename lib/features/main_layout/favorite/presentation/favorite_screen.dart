import 'package:flutter/material.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 25),
          onPressed: () => Navigator.pop(context),
        ),
        shape: const Border(
          bottom: BorderSide(color: Color(0xffDEDFDF), width: 1),
        ),
      ),

      body: ListView.builder(
        itemCount: favoriteProducts.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];

          return CustomListCard(
            leading: Image.asset(AppAssets.product),
            title: product['name']!,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['price']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff656565),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Store Name: ${product['store']}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              alignment: Alignment.topRight,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.close_outlined,
                color: Colors.grey,
                size: 20,
              ),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
