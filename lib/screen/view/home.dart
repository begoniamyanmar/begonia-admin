import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/newui/constants.dart';
import 'package:kozarni_ecome/routes/routes.dart';
import 'package:kozarni_ecome/widgets/bottom_nav.dart';
import 'package:kozarni_ecome/widgets/home_category.dart';
import 'package:kozarni_ecome/widgets/home_items.dart';
import 'package:kozarni_ecome/widgets/home_pickup.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {

   HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  List categories = ['All', 'Shirt', 'Pent', 'Dress'];

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    // return Scaffold(
    //   body: Obx(
    //     () => controller.isSearch.value
    //         ? GridView.builder(
    //             padding: EdgeInsets.only(
    //               top: 15,
    //               left: 20,
    //               right: 20,
    //               bottom: 20,
    //             ),
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               childAspectRatio: 0.72,
    //               crossAxisSpacing: 10,
    //               mainAxisSpacing: 10,
    //             ),
    //             itemCount: controller.searchitems.length,
    //             itemBuilder: (_, i) => GestureDetector(
    //               onTap: () {
    //                 controller.setSelectedItem(controller.searchitems[i]);
    //                 Get.toNamed(detailScreen);
    //               },
    //               child: Card(
    //                 elevation: 5,
    //                 child: Column(
    //                   children: [
    //                     Expanded(
    //                       child: CachedNetworkImage(
    //                         imageUrl: controller.searchitems[i].photo,
    //                         // "$baseUrl$itemUrl${controller.getItems()[i].photo}/get",
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Container(
    //                         width: double.infinity,
    //                         padding: EdgeInsets.only(
    //                           left: 20,
    //                           right: 20,
    //                           top: 10,
    //                         ),
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               controller.searchitems[i].name,
    //                               maxLines: 1,
    //                               overflow: TextOverflow.ellipsis,
    //                               style: TextStyle(
    //                                 fontSize: 16,
    //                                 fontWeight: FontWeight.w700,
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                             Row(
    //                               children: List.generate(
    //                                 5,
    //                                 (index) => Icon(
    //                                   Icons.star,
    //                                   size: 15,
    //                                   color: index <=
    //                                           controller.searchitems[i].star
    //                                       ? homeIndicatorColor
    //                                       : Colors.grey,
    //                                 ),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                             Text(
    //                               "${controller.searchitems[i].price} Ks",
    //                               style: TextStyle(
    //                                 fontWeight: FontWeight.w500,
    //                                 color: homeIndicatorColor,
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 5,
    //                             ),
    //                             // Text(
    //                             //   "In stock (7)",
    //                             //   style: TextStyle(
    //                             //     fontSize: 16,
    //                             //     fontWeight: FontWeight.w700,
    //                             //     color: Colors.green,
    //                             //   ),
    //                             // ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     Container(
    //                       width: double.infinity,
    //                       height: 40,
    //                       margin:
    //                           EdgeInsets.only(bottom: 10, right: 20, left: 20),
    //                       child: ElevatedButton(
    //                         style: ButtonStyle(
    //                           backgroundColor:
    //                               MaterialStateProperty.all(homeIndicatorColor),
    //                         ),
    //                         onPressed: () {
    //                           Get.defaultDialog(
    //                             titlePadding: EdgeInsets.all(0),
    //                             contentPadding: EdgeInsets.only(
    //                                 left: 20, right: 20, bottom: 10),
    //                             radius: 0,
    //                             title: '',
    //                             content: AddToCart(
    //                               itemModel: controller.searchitems[i],
    //                             ),
    //                           );
    //                         },
    //                         child: Text('Add to Cart'),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           )
    //         : ListView(
    //             children: [
    //               HomePickUp(),
    //               HomeCategory(),
    //               HomeItems(),
    //             ],
    //           ),
    //   ),
    // );


    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          // Obx(
          //   () => controller.isSearch.value
          //       ? Container(
          //     margin: EdgeInsets.all(kDefaultPadding),
          //     padding: const EdgeInsets.symmetric(
          //           horizontal: kDefaultPadding,
          //           vertical: kDefaultPadding / 4, // 5 top and bottom
          //         ),
          //     height: 50,
          //     child: TextField(
          //       onChanged: controller.onSearch,
          //       onSubmitted: controller.searchItem,
          //       style: TextStyle(color: Colors.white),
          //       decoration: InputDecoration(
          //               enabledBorder: InputBorder.none,
          //               focusedBorder: InputBorder.none,
          //               icon: FaIcon(
          //                 FontAwesomeIcons.search,
          //                 color: Colors.white,
          //                 size: 20,
          //               ),
          //               hintText: 'Search',
          //               hintStyle: TextStyle(color: Colors.white),
          //             ),
          //     ),
          //   )
          //       : ElevatedButton(
          //     onPressed: controller.search,
          //     child: FaIcon(
          //   FontAwesomeIcons.search,
          //   color: Colors.white,
          //   size: 20,
          // ),
          //   ),
          // ),




          // Container(
          //   margin: EdgeInsets.all(kDefaultPadding),
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: kDefaultPadding,
          //     vertical: kDefaultPadding / 4, // 5 top and bottom
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.4),
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: const TextField(
          //     // onChanged: onChanged,
          //     style: TextStyle(color: Colors.white),
          //     decoration: InputDecoration(
          //       enabledBorder: InputBorder.none,
          //       focusedBorder: InputBorder.none,
          //       icon: FaIcon(
          //         FontAwesomeIcons.search,
          //         color: Colors.black,
          //         size: 20,
          //       ),
          //       hintText: 'Search',
          //       hintStyle: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),

          HomeCategory(),
          
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                HomeItems()
              ],
            ),
          )

          // Container(
          //   margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          //   height: 30,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: categories.length,
          //     itemBuilder: (context, index) => GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           selectedIndex = index;
          //         });
          //       },
          //       child: Container(
          //         alignment: Alignment.center,
          //         margin: EdgeInsets.only(
          //           left: kDefaultPadding,
          //           // At end item it add extra 20 right  padding
          //           right: index == categories.length - 1 ? kDefaultPadding : 0,
          //         ),
          //         padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          //         decoration: BoxDecoration(
          //           color: index == selectedIndex
          //               ? Colors.white.withOpacity(0.4)
          //               : Colors.transparent,
          //           borderRadius: BorderRadius.circular(6),
          //         ),
          //         child: Text(
          //           categories[index],
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

        ],
      ),
    );
  }
}
