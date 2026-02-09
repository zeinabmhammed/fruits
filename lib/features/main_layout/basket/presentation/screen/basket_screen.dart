import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/OrderSummaryWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/resources/app_colors/app_colors.dart';
import '../../../../../core/resources/widget/CustomListCard.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Basket",
          style: GoogleFonts.poppins(
            fontSize: responsive.scaleWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
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
        padding: EdgeInsets.only(bottom: responsive.scaleHeight(20)),
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/productDetails");
            },
            child: CustomListCard(
              leading: Image.asset(
                AppAssets.product,
                width: responsive.scaleWidth(70),
                height: responsive.scaleHeight(70),
              ),
              title: 'Product name',
              subtitle: Row(
                children: [
                  Text(
                    '12.00 KD',
                    style: TextStyle(
                      color: const Color(0xff656565),
                      fontSize: responsive.scaleWidth(12),
                    ),
                  ),
                  SizedBox(width: responsive.scaleWidth(10)),
                  Text(
                    '14.00 KD',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: responsive.scaleWidth(10),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              trailing: SizedBox(
                height: responsive.scaleHeight(80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        AppAssets.delete,
                        width: responsive.scaleWidth(20),
                      ),
                    ),
                    Container(
                      width: responsive.scaleWidth(110),
                      padding: EdgeInsets.all(responsive.scaleWidth(4)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(responsive.scaleWidth(25)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: responsive.scaleWidth(4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.remove_circle_outline,
                            color: Colors.grey,
                            size: responsive.scaleWidth(20),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.scaleWidth(14),
                            ),
                          ),
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.green,
                            size: responsive.scaleWidth(20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: const OrderSummaryWidget(),
    );
  }
}

