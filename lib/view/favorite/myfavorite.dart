// import 'package:bake_n_cake_user_side/controller/user_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// class MyFavoriteButton extends StatelessWidget {
//   final String itemId;
//   final Widget icon;

//   MyFavoriteButton({required this.itemId, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<UserController>();

//     return InkWell(
//       onTap: () {
//         controller.addtofavorite(itemId);
//       },
//       child: Obx(
//         () => controller.favoriteItems.contains(itemId)
//             ? Icon(Icons.favorite, color: Colors.red)
//             : icon,
//       ),
//     );
//   }
// }
