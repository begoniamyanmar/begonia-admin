import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/model/item.dart';
import 'package:kozarni_ecome/newui/constants.dart';
import 'package:kozarni_ecome/routes/routes.dart';
import 'package:get/get.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final HomeController controller = Get.find();
    return Obx(
      () => ListView.builder(

        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: controller.getItems().length,
        itemBuilder: (_, i) => GestureDetector(
          onTap: () {
            controller.setSelectedItem(controller.getItems()[i]);
            Get.toNamed(detailScreen);
          },
          // child: Card(
          //   elevation: 5,
          //   child: Column(
          //     children: [
          //       Expanded(
          //         child: CachedNetworkImage(
          //           imageUrl: controller.getItems()[i].photo,
          //           // "$baseUrl$itemUrl${controller.getItems()[i].photo}/get",
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           width: double.infinity,
          //           padding: EdgeInsets.only(
          //             left: 20,
          //             right: 20,
          //             top: 10,
          //           ),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 controller.getItems()[i].name,
          //                 maxLines: 1,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w700,
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Row(
          //                 children: List.generate(
          //                   5,
          //                   (index) => Icon(
          //                     Icons.star,
          //                     size: 15,
          //                     color: index <= controller.getItems()[i].star
          //                         ? homeIndicatorColor
          //                         : Colors.grey,
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Text(
          //                 "${controller.getItems()[i].price} Ks",
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.w500,
          //                   color: homeIndicatorColor,
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               // Text(
          //               //   "In stock (7)",
          //               //   style: TextStyle(
          //               //     fontSize: 16,
          //               //     fontWeight: FontWeight.w700,
          //               //     color: Colors.green,
          //               //   ),
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Container(
          //         width: double.infinity,
          //         height: 40,
          //         margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
          //         child: ElevatedButton(
          //           style: ButtonStyle(
          //             backgroundColor:
          //                 MaterialStateProperty.all(homeIndicatorColor),
          //           ),
          //           onPressed: () {
          //             Get.defaultDialog(
          //               titlePadding: EdgeInsets.all(0),
          //               contentPadding:
          //                   EdgeInsets.only(left: 20, right: 20, bottom: 10),
          //               radius: 0,
          //               title: '',
          //               content: AddToCart(
          //                 itemModel: controller.getItems()[i],
          //               ),
          //             );
          //           },
          //           child: Text('Add'),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        child:  Container(
          margin: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          // color: Colors.blueAccent,
          height: 160,
          child: InkWell(
            onTap: (){
              controller.setSelectedItem(controller.getItems()[i]);
              Get.toNamed(detailScreen);
              // Get.defaultDialog(
              //                   titlePadding: EdgeInsets.all(0),
              //                   contentPadding:
              //                       EdgeInsets.only(left: 20, right: 20, bottom: 10),
              //                   radius: 0,
              //                   title: '',
              //                   content: AddToCart(
              //                     itemModel: controller.getItems()[i],
              //                   ),
              //                 );

            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                // Those are our background
                Container(
                  height: 136,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: i.isEven ? kBlueColor : kSecondaryColor,
                    boxShadow: [kDefaultShadow],
                  ),
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
                // our product image
                Positioned(
                  top: 0,
                  right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        height: 180,
                        // image is square but we add extra 20 + 20 padding thats why width is 200
                        width: 210,

                            child: Hero(
                              tag: controller.getItems()[i].photo,
                            child: Image.network(
                              controller.getItems()[i].photo,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ),
                    ),
                // Product title and price
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    height: 136,
                    // our image take 200 width, thats why we set out total width - 200
                    width: size.width - 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Text(
                            controller.getItems()[i].name, 
                            style: Theme.of(context).textTheme.button,

                          ),
                        ),
                    SizedBox(
                      height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18),
                                      child: Row(
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            Icons.star,
                                            size: 15,
                                            color: index <= controller.getItems()[i].star
                                                ? Colors.orange
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                        // it use the available space
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5, // 30 padding
                            vertical: kDefaultPadding / 4, // 5 top and bottom
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Text(
                            "${controller.getItems()[i].price} Ks",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}






class AddToCart extends StatefulWidget {
  final ItemModel itemModel;
  const AddToCart({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  String? colorValue;
  String? sizeValue;
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          value: colorValue,
          hint: Text('Color'),
          onChanged: (String? e) {
            setState(() {
              colorValue = e;
            });
          },
          items: widget.itemModel.color
              .split(',')
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
          value: sizeValue,
          hint: Text("Size"),
          onChanged: (String? e) {
            setState(() {
              sizeValue = e;
            });
          },
          items: widget.itemModel.size
              .split(',')
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            if (colorValue != null && sizeValue != null) {
              controller.addToCart(widget.itemModel, colorValue!, sizeValue!);
              Get.back();
            }
          },
          child: Text("Add"),
        )
      ],
    );
  }
}
