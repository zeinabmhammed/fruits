import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';


class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      padding: EdgeInsets.all(responsive.scaleWidth(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(responsive.scaleWidth(25)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: responsive.scaleWidth(10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: responsive.scaleHeight(10),
            ),
            child: DottedLine(
              dashColor: Colors.grey,
              lineThickness: responsive.scaleWidth(1),
            ),
          ),
          _buildPriceRow("Subtotal", "36.00 KD", responsive),
          _buildPriceRow("Shipping Charges", "1.50 KD", responsive),
          _buildPriceRow("Bag Total", "37.50 KD", responsive, isTotal: true),
          SizedBox(height: responsive.scaleHeight(20)),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "4 items in cart",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: responsive.scaleWidth(12),
                    ),
                  ),
                  Text(
                    "37.50 KD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.scaleWidth(18),
                      color: const Color(0xFF2D6A4F),
                    ),
                  ),
                ],
              ),
              SizedBox(width: responsive.scaleWidth(40)),
              Expanded(
                child: SizedBox(
                  height: responsive.scaleHeight(45),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2D6A4F),
                      padding: EdgeInsets.symmetric(
                        vertical: responsive.scaleHeight(4),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(responsive.scaleWidth(17)),
                      ),
                    ),
                    child: Text(
                      "Proceed To Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: responsive.scaleWidth(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
      String label,
      String price,
      Responsive responsive, {
        bool isTotal = false,
      }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsive.scaleHeight(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: responsive.scaleWidth(14),
              color: isTotal ? Colors.black : Colors.grey[600],
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: responsive.scaleWidth(14),
              color: Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
