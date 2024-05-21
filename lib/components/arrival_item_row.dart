import 'package:final_app_flutter/resources/app_color.dart';
import 'package:flutter/material.dart';

class ArrivalItemRow extends StatelessWidget {
  final Map aObj;
  final VoidCallback onTap;
  const ArrivalItemRow({super.key, required this.aObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              child: Image.asset(
                aObj["image"].toString(),
                width: double.maxFinite,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        aObj["name"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      const Text(
                        "BEST CHOICE",
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 15,
                        ),
                      ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                    ],
                  ),
                  Text(
                    aObj["price"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [

                  //     Image.asset(
                  //     "assets/img/rate.png",
                  //     width: 10,
                  //     height: 10,
                  //     fit: BoxFit.cover,
                  //   ),

                  //   const SizedBox(
                  //     width: 4,
                  //   ),

                  //   Text(
                  //     pObj["rate"],
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(color: TColor.primary, fontSize: 11),
                  //   ),
                  //   const SizedBox(
                  //     width: 8,
                  //   ),
                  //   Text(
                  //     "(${pObj["rating"]} Ratings)",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //         color: TColor.secondaryText, fontSize: 11),
                  //   ),

                  //   const SizedBox(
                  //     width: 8,
                  //   ),

                  //     Text(
                  //       pObj["type"],
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           color: TColor.secondaryText, fontSize: 11),
                  //     ),
                  //     Text(
                  //       " . ",
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(color: TColor.primary, fontSize: 11),
                  //     ),
                  //     Text(
                  //       pObj["food_type"],
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //           color: TColor.secondaryText, fontSize: 12),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
