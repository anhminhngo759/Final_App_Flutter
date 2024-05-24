import 'package:final_app_flutter/page/order_success.dart';
import 'package:flutter/material.dart';

import '../components/app_elevent_button.dart';
import '../resources/app_color.dart';

class CheckoutPage extends StatefulWidget {
  final double totalPrice;

  const CheckoutPage({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _type = 1;

  void _handleRadio(Object? e) {
    setState(() {
      _type = e as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Checkout'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
            top: MediaQuery.of(context).padding.top + 20.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/back.png",
                      width: 24,
                      height: 30,
                      color: AppColor.blue,
                    ),
                  ),
                  const SizedBox(width: 60),
                  const Text(
                    'Checkout',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColor.grey, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "653 Nostrand Ave.\nBrooklyn, NY 11216",
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment method",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.grey,
                        fontSize: 18,
                  ),
                ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                width: 400,
                height: 55,
                // margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  border: _type == 1
                      ? Border.all(width: 1, color: Color(0xFFDB3022))
                      : Border.all(width: 0.3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _type,
                          onChanged: _handleRadio,
                          activeColor: Color(0xFFDB3022),
                        ),
                        Text("Pay with cash",
                            style: _type == 1
                                ? const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)
                                : const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                'Total Price: \$${widget.totalPrice.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              AppEleventButton(
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OrderSuccess(),
                      ));
                },
                text: "Payment",
                colorBorder: AppColor.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
