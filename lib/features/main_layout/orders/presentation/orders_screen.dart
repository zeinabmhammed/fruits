import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
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
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "My Orders",
          style: GoogleFonts.poppins(
            fontSize: responsive.scaleWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.black, size: responsive.scaleWidth(25)),
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
        itemCount: orders.length,
        padding: EdgeInsets.symmetric(vertical: responsive.scaleHeight(10)),
        itemBuilder: (context, index) {
          final order = orders[index];
          final Color orderColor = order['color'];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/orderTracking");
            },
            child: CustomListCard(
              leading: Container(
                padding: EdgeInsets.all(responsive.scaleWidth(8)),
                decoration: BoxDecoration(
                  color: orderColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.delivery_dining,
                    color: orderColor, size: responsive.scaleWidth(22)),
              ),
              title: '${order['id']} - ${order['price']}',
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${order['date']} - ${order['items']} Items',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: responsive.scaleWidth(14),
                    ),
                  ),
                  SizedBox(height: responsive.scaleHeight(4)),
                  Text(
                    'Status: ${order['status']}',
                    style: TextStyle(
                      color: orderColor,
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.scaleWidth(14),
                    ),
                  ),
                ],
              ),
              trailing: Container(
                width: responsive.scaleWidth(70),
                height: responsive.scaleHeight(70),
                decoration: BoxDecoration(
                  color: orderColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(responsive.scaleWidth(20)),
                  child: SvgPicture.asset(
                    AppAssets.arrowIcon,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
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
