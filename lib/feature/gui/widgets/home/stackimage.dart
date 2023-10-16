// import 'package:flutter/material.dart';
// import 'package:mano/core/constant/imageasset.dart';
// import 'package:mano/feature/gui/widgets/home/stack/row.dart';
// import 'package:mano/feature/gui/widgets/home/stack/row3.dart';
// import 'package:mano/feature/gui/widgets/home/stack/row4.dart';

// import 'stack/row2.dart';

// class StackImage extends StatelessWidget {

//   const StackImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: InkWell(onTap: () {
//         Navigator.of(context).pushReplacementNamed("Apartment");
//       },
//         child: Column(
//           children: [
//             Stack(
//                     children: [
//                       Container(
//                         child: Image.asset(AppImageAsset.homeRectangle,width: 340, height:300 ,),
//                         ),
//                       Positioned(
//                         top: 150,
//                         child: Container(
//                         decoration: BoxDecoration(
//               color: const Color(0xffffffff),
//               borderRadius: BorderRadius.circular(12.0),
//               border: Border.all(width: 1.0, color: const Color(0xff707070)),
//             ),
//                       width: 340,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Column(
//                           children: const [
//                         RowOne(),
//                         RowTwo(),
//                         RowThree(),
//                         RowFour(),
//                         ]),
//                       ),
//                       ),),
//                     ],),],
//         ),
//       ),
//     );
//   }
// }