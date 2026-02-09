import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool gram50 = false;
  bool kg1 = false;
  bool kg2 = false;
  bool gram60 = false;
  bool kg3 = false;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          "Product Name",
          style: GoogleFonts.poppins(
            fontSize: responsive.scaleWidth(24),
            fontWeight: FontWeight.bold,
            color: AppColors.green,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.black, size: responsive.scaleWidth(25)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.addToFav,
                width: responsive.scaleWidth(26)),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.shareIcon,
                width: responsive.scaleWidth(20)),
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
        child: Padding(
          padding: EdgeInsets.all(responsive.scaleWidth(23)),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(responsive.scaleWidth(25)),
                    child: Image.asset(AppAssets.productDetails),
                  ),
                  Positioned(
                    top: responsive.scaleHeight(10),
                    right: responsive.scaleWidth(10),
                    child: Container(
                      width: responsive.scaleWidth(167),
                      height: responsive.scaleHeight(32),
                      padding: EdgeInsets.all(responsive.scaleWidth(4)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(responsive.scaleWidth(25)),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "10% Off Discount",
                          style: TextStyle(
                            color: const Color(0xff656565),
                            fontSize: responsive.scaleWidth(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsive.scaleHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category Name",
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: responsive.scaleWidth(16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Product name",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: responsive.scaleWidth(24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: responsive.scaleWidth(16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "KD 12.00",
                            style: TextStyle(
                              color: const Color(0xff656565),
                              fontSize: responsive.scaleWidth(20),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: responsive.scaleWidth(10)),
                          Text(
                            "KD 14.00",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: const Color(0xffDF958F),
                              fontSize: responsive.scaleWidth(20),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: responsive.scaleHeight(10)),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color(0xff656565),
                  fontSize: responsive.scaleWidth(16),
                ),
              ),
              SizedBox(height: responsive.scaleHeight(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Sell Per : Kartoon",
                    style: TextStyle(
                      color: const Color(0xff656565),
                      fontSize: responsive.scaleWidth(16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsive.scaleHeight(23)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select weight",
                    style: TextStyle(
                      color: const Color(0xff292727),
                      fontSize: responsive.scaleWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down,
                      color: const Color(0xff656565),
                      size: responsive.scaleWidth(30)),
                ],
              ),
              Divider(color: const Color(0xffDEDFDF), thickness: 2),
              SizedBox(height: responsive.scaleHeight(5)),
              _buildCheckBox("50 Gram - 4.00 KD", gram50, (val) {
                setState(() => gram50 = val!);
              }, responsive),
              _buildCheckBox("1 Kg - 6.25 KD", kg1, (val) {
                setState(() => kg1 = val!);
              }, responsive),
              _buildCheckBox("2 Kg - 12.00 KD", kg2, (val) {
                setState(() => kg2 = val!);
              }, responsive),
              SizedBox(height: responsive.scaleHeight(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Addons",
                    style: TextStyle(
                      color: const Color(0xff292727),
                      fontSize: responsive.scaleWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down,
                      color: const Color(0xff656565),
                      size: responsive.scaleWidth(30)),
                ],
              ),
              Divider(color: const Color(0xffDEDFDF), thickness: 2),
              _buildCheckBox("50 Gram - 4.00 KD", gram60, (val) {
                setState(() => gram60 = val!);
              }, responsive),
              _buildCheckBox("1 Kg - 6.25 KD", kg3, (val) {
                setState(() => kg3 = val!);
              }, responsive),
              SizedBox(height: responsive.scaleHeight(15)),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: responsive.scaleWidth(161),
                  height: responsive.scaleHeight(40),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2D6A4F),
                      padding: EdgeInsets.symmetric(
                          vertical: responsive.scaleHeight(4)),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(responsive.scaleWidth(17)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.basketIcon,
                          width: responsive.scaleWidth(20),
                          color: AppColors.white,
                        ),
                        SizedBox(width: responsive.scaleWidth(10)),
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: responsive.scaleWidth(16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckBox(
      String text, bool value, Function(bool?) onChanged, Responsive responsive) {
    return Row(
      children: [
        Checkbox(
          value: value,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsive.scaleWidth(20)),
          ),
          onChanged: onChanged,
          activeColor: AppColors.green,
        ),
        Text(
          text,
          style: TextStyle(fontSize: responsive.scaleWidth(15)),
        ),
      ],
    );
  }
}
