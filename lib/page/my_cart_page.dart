import 'package:final_app_flutter/components/app_elevent_button.dart';
import 'package:final_app_flutter/page/checkout_page.dart';
import 'package:flutter/material.dart';

import '../components/shoes_item.dart';
import '../model/shoes_model.dart';
import '../resources/app_color.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  double get totalPrice {
    double sum = 0.0;
    for (var shoe in cartItems) {
      sum += shoe.total;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
              top: MediaQuery.of(context).padding.top + 20.0, bottom: 20.0),
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
                    'My Cart',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final shoes_item = cartItems[index];
                  return ShoesItem(
                    shoes_item,
                    onAdd: () => setState(() =>
                        shoes_item.quantity = (shoes_item.quantity ?? 0) + 1),
                    onRemove: shoes_item.quantity == 1
                        ? null
                        : () => setState(() => shoes_item.quantity =
                            (shoes_item.quantity ?? 0) - 1),
                    onDelete: () => showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('😐'),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                  'Delete this shoes?',
                                  style: TextStyle(
                                      color: Colors.brown, fontSize: 20.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16.8),
                              ),
                              onPressed: () {
                                setState(() => cartItems.removeWhere(
                                    (element) => element.id == shoes_item.id));
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text(
                                'No',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16.8),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20.0),
                itemCount: cartItems.length,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Price: ',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    '\$',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    totalPrice.toStringAsFixed(1),
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              AppEleventButton(
                  onPressed: () async {
                    // await Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => CheckoutPage(
                    //           totalPrice: totalPrice),
                    //     ));

                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CheckOutPage(),
                        ));
                  },
                  text: "Checkout",
                  colorBorder: AppColor.blue),
            ],
          ),
        ),
      ),
    );
  }
}
