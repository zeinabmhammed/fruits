import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/CustomDropdownField.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/PaymentMethodTile.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/address_card.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/custom_primary_Button.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/custom_selection_tile.dart';
import 'package:fruits/features/main_layout/basket/presentation/widget/order_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;

  final List<String> _stepsLabels = [
    "Delivery Time",
    "Delivery Address",
    "Payment",
  ];
  int _selectedPaymentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Checkout",
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
          onPressed: () {
            if (_currentStep > 0) setState(() => _currentStep--);
          },
        ),
        shape: Border(
          bottom: BorderSide(
            color: const Color(0xffDEDFDF),
            width: responsive.scaleWidth(2),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: responsive.scaleHeight(20)),
          _buildStepper(responsive),
          SizedBox(height: responsive.scaleHeight(10)),
          Divider(
            thickness: responsive.scaleWidth(1),
            color: const Color(0xffBFBFBF),
          ),

          SingleChildScrollView(
            padding: EdgeInsets.all(responsive.scaleWidth(20)),
            child: _buildCurrentStepContent(responsive),
          ),

          SizedBox(height: responsive.scaleHeight(70)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.scaleWidth(20),
              vertical: responsive.scaleHeight(10),
            ),
            child: CustomPrimaryButton(
              text: _currentStep == 2 ? "Place Order" : "Continue",
              onPressed: () {
                if (_currentStep < 2) {
                  setState(() => _currentStep++);
                } else {
                  Navigator.pushNamed(context, "/checkoutSuccess");
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepper(Responsive responsive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_stepsLabels.length, (index) {
        bool isActive = index <= _currentStep;
        bool isLast = index == _stepsLabels.length - 1;
        return Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: responsive.scaleWidth(6),
                  backgroundColor: isActive ? AppColors.green : AppColors.grey,
                ),
                SizedBox(height: responsive.scaleHeight(7)),
                Text(
                  _stepsLabels[index],
                  style: TextStyle(
                    fontSize: responsive.scaleWidth(12),
                    color: isActive ? AppColors.green : AppColors.grey,
                  ),
                ),
              ],
            ),
            if (!isLast)
              Container(
                width: responsive.scaleWidth(60),
                height: responsive.scaleHeight(2),
                color: index < _currentStep
                    ? const Color(0xFF2D5E42)
                    : Colors.grey[300],
                margin: EdgeInsets.symmetric(
                  horizontal: responsive.scaleWidth(2),
                ).copyWith(bottom: responsive.scaleHeight(20)),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildCurrentStepContent(Responsive responsive) {
    switch (_currentStep) {
      case 0:
        return _deliveryTimeContent(responsive);
      case 1:
        return _deliveryAddressContent(responsive);
      case 2:
        return _paymentContent(responsive);
      default:
        return Container();
    }
  }

  Widget _deliveryTimeContent(Responsive responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSelectionTile(title: "Now", isSelected: true),
        SizedBox(height: responsive.scaleHeight(20)),
        Container(
          height: responsive.scaleHeight(170),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: responsive.scaleWidth(10),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(responsive.scaleWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Delivery Time",
                  style: TextStyle(
                    fontSize: responsive.scaleWidth(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: responsive.scaleHeight(10)),
                Text(
                  "Select Date",
                  style: TextStyle(fontSize: responsive.scaleWidth(14)),
                ),
                SizedBox(height: responsive.scaleHeight(10)),
                CustomDropdownField(selectedDate: "09-15-2021"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _deliveryAddressContent(Responsive responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Delivery Address",
          style: TextStyle(
            fontSize: responsive.scaleWidth(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: responsive.scaleHeight(10)),
        Container(
          padding: EdgeInsets.all(responsive.scaleWidth(15)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(responsive.scaleWidth(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add New Address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.scaleWidth(14),
                ),
              ),
              Icon(
                Icons.add,
                size: responsive.scaleWidth(25),
                color: const Color(0xff656565),
              ),
            ],
          ),
        ),
        SizedBox(height: responsive.scaleHeight(10)),
        const AddressCard(
          title: "Address 1",
          subtitle: "John Doe\n+000-11-1234567",
          info:
              "Room #1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates",
          isSelected: true,
        ),
      ],
    );
  }

  Widget _paymentContent(Responsive responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Coupon Code",
          style: TextStyle(
            fontSize: responsive.scaleWidth(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: responsive.scaleHeight(10)),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: responsive.scaleHeight(5),
            horizontal: responsive.scaleWidth(10),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(responsive.scaleWidth(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Do You Have any Coupon Code?",
                style: TextStyle(
                  fontSize: responsive.scaleWidth(14),
                  color: const Color(0xff4A4A4A),
                ),
              ),
              SizedBox(width: responsive.scaleWidth(10)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D5E42),
                ),
                child: Text(
                  "Apply",
                  style: TextStyle(
                    fontSize: responsive.scaleWidth(16),
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: responsive.scaleHeight(20)),
        OrderSummary(),
        SizedBox(height: responsive.scaleHeight(20)),

        Text(
          "Payment",
          style: TextStyle(
            fontSize: responsive.scaleWidth(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        PaymentMethodTile(
          title: "Credit Card/Debit Card",
          icon: SvgPicture.asset(AppAssets.credit),
          isSelected: _selectedPaymentIndex == 0,
          onTap: () {
            setState(() => _selectedPaymentIndex = 0);
          },
        ),
        PaymentMethodTile(
          title: "Cash on Delivery",
          icon: SvgPicture.asset(AppAssets.cash),
          isSelected: _selectedPaymentIndex == 1,
          onTap: () {
            setState(() => _selectedPaymentIndex = 1);
          },
        ),
        PaymentMethodTile(
          title: "Knet",
          icon: Image.asset(AppAssets.net, width: 39),
          isSelected: _selectedPaymentIndex == 2,
          onTap: () {
            setState(() => _selectedPaymentIndex = 2);
          },
        ),
      ],
    );
  }
}
