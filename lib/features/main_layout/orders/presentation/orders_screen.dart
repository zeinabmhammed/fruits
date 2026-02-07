import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/widget/CustomListCard.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  final List<Map<String, dynamic>> orders = const [
    {
      'id': '#8263100',
      'price': '37 KD',
      'date': '2 Sep',
      'items': 3,
      'status': 'Delivering',
      'color': Colors.amber,
    },
    {
      'id': '#8263101',
      'price': '40 KD',
      'date': '3 Sep',
      'items': 5,
      'status': 'Finished',
      'color': Colors.green,
    },
    {
      'id': '#8263102',
      'price': '25 KD',
      'date': '1 Sep',
      'items': 2,
      'status': 'Canceled',
      'color': Colors.red,
    },
    {
      'id': '#8263103',
      'price': '50 KD',
      'date': '4 Sep',
      'items': 4,
      'status': 'Moving',
      'color': Colors.blue,
    },
    {
      'id': '#8263104',
      'price': '15 KD',
      'date': '5 Sep',
      'items': 1,
      'status': 'New',
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "My Orders",
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
        itemCount: orders.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          final order = orders[index];
          final Color orderColor = order['color'];

          return CustomListCard(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: orderColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.delivery_dining, color: orderColor),
            ),
            title: '${order['id']} - ${order['price']}',
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${order['date']} - ${order['items']} Items',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  'Status: ${order['status']}',
                  style: TextStyle(
                    color: orderColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: orderColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(
                  AppAssets.arrowIcon,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
