import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/newui/constants.dart';
import 'package:kozarni_ecome/routes/routes.dart';

class HotView extends StatelessWidget {
  const HotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Obx(
          () => ListView.builder(
        padding: EdgeInsets.only(bottom: 10),
        itemCount: controller.hot().length,
        itemBuilder: (_, i) => GestureDetector(
          onTap: () {
            controller.setSelectedItem(controller.hot()[i]);
            Get.toNamed(detailScreen);
          },

          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(left: 20, right: 20, top: 15),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.hot()[i].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: List.generate(
                          5,
                              (index) => Icon(
                            Icons.star,
                            size: 16,
                            color: index <= controller.getItems()[i].star
                                ? Colors.yellow
                                : Colors.yellow,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.hot()[i].price}  MMK",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        "${controller.hot()[i].discountprice}  MMK",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),


                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: controller.hot()[i].photo,
                    // "$baseUrl$itemUrl${controller.hot()[i].photo}/get",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
