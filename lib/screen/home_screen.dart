import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/newui/constants.dart';
import 'package:kozarni_ecome/screen/view/cart.dart';
import 'package:kozarni_ecome/screen/view/hot.dart';
import 'package:kozarni_ecome/screen/view/home.dart';
import 'package:kozarni_ecome/widgets/bottom_nav.dart';
import 'package:url_launcher/url_launcher.dart';

import 'view/profile.dart';

List<Widget> _template = [
  HomeView(),
  HotView(),
  CartView(),
  ProfileView(),
];

class HomeScreen extends StatelessWidget {


  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: const Text("𝑯𝒂𝒑𝒑𝒚 𝒂𝒏𝒅 𝑶𝒏𝒍𝒚 𝑴𝒚 𝑩𝒆𝒈𝒐𝒏𝒊𝒂", style: TextStyle(color: Colors.white, fontSize: 16),),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        // centerTitle: true,
        actions: [
          // InkWell(
          //   onTap: () {
          //     ///TODO
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
          //     padding: EdgeInsets.only(left: 10, right: 10),
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(7),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey[200]!,
          //             spreadRadius: 1,
          //             offset: Offset(0, 1),
          //           )
          //         ]),
          //     child: Icon(
          //       Icons.search,
          //       color: Colors.black,
          //     ),
          //   ),
          // )
          // Obx(
          //   () => controller.isSearch.value
          //       ? Container(
          //           width: MediaQuery.of(context).size.width * 0.6,
          //           height: 50,
          //           child: TextField(
          //             onChanged: controller.onSearch,
          //             onSubmitted: controller.searchItem,
          //             decoration: InputDecoration(
          //               hintText: "Search...",
          //               // border: OutlineInputBorder(),
          //             ),
          //           ),
          //         )
          //       : ElevatedButton(
          //             onPressed: controller.search,
          //             child: FaIcon(
          //               FontAwesomeIcons.search,
          //               color: Colors.white,
          //               size: 20,
          //             ),
          //           ),
          //         ),
          ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                elevation: MaterialStateProperty.resolveWith<double>(  // As you said you dont need elevation. I'm returning 0 in both case
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return 0;
                    }
                    return 0; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () async {
                try {
                  await launch('https://m.me/begoniazue');
                } catch (e) {
                  print(e);
                }
              },
              child: FaIcon(
                FontAwesomeIcons.facebookMessenger,
                color: Colors.white,
                size: 20,
              ),
            ),
        ],
      ),
      body: Obx(
        () => _template[controller.navIndex.value],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
