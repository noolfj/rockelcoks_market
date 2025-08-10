// import 'package:flutter/material.dart';
// import 'package:rockelcoks_market/utils/app_styles.dart';

// class ProductDetailsBottomSheet extends StatefulWidget {
//   final ScrollController scrollController;

//   const ProductDetailsBottomSheet({
//     Key? key,
//     required this.scrollController,
//   }) : super(key: key);

//   @override
//   State<ProductDetailsBottomSheet> createState() => _ProductDetailsBottomSheetState();
// }

// class _ProductDetailsBottomSheetState extends State<ProductDetailsBottomSheet> {
//   int selectedTab = 0; 

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'О товаре',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   children: [
//                     _buildTabButton("Характеристики", 0),
//                     const SizedBox(width: 8),
//                     _buildTabButton("Описание", 1),
//                   ],
//                 ),
//                 Transform.translate(
//                   offset: const Offset(0, -6), 
//                   child: _buildTabButton("✅ Документы проверены", 2),
//                 ),
//               ],
//             ),
//           ),

//           Expanded(
//             child: SingleChildScrollView(
//               controller: widget.scrollController,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: selectedTab == 0
//                     ? _buildCharacteristics()
//                     : selectedTab == 1
//                         ? _buildDescription()
//                         : _buildDocuments(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabButton(String title, int index) {
//     final bool isSelected = selectedTab == index;
//     return OutlinedButton(
//       onPressed: () {
//         setState(() {
//           selectedTab = index;
//         });
//       },
//       style: OutlinedButton.styleFrom(
//         side: BorderSide.none,
//         backgroundColor: isSelected ? Color(0xff8BBCA6) : Color(0xffC2C2C2),
//         foregroundColor: isSelected ? Colors.white : Colors.black,
//         padding: EdgeInsets.symmetric(horizontal: 16,),
//         minimumSize: Size(0, 30),
//         shape: RoundedRectangleBorder( 
//         borderRadius: BorderRadius.circular(10), 
//     ),
//       ),
//       child: Text(title, 
//       style: AppStyles.getAppTextStyle(
//         context: context,
//         color:  isSelected ? Color(0xff035D41) : Colors.white,
//         fontSize: 14,
//         fontWeight: FontWeight.w700,
//         fontFamily: 'agdasima',
//       ),
//      ),
//     );
//   }

//  Widget _buildCharacteristics() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       _titleText("Основная информация", context),
//       _infoText("Цвет:", "Чёрный, Белый, Хаки", context),
//       const SizedBox(height: 16),

//       _titleText("Общие характеристики", context),
//       _infoText("Фасон:", "унисекс", context),
//       _infoText("Материал:", "100% хлопок", context),
//       _infoText("Особенности:", "плотная ткань, не просвечивает", context),
//       const SizedBox(height: 16),

//       _titleText("Дополнительная информация", context),
//       _infoText("Размеры:", "S–3XL", context),
//       const SizedBox(height: 16),

//       ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: Image.asset(
//           'assets/images/products/shirt.jpg',
//           fit: BoxFit.cover,
//         ),
//       ),
//       const SizedBox(height: 8),

//        Text(
//         "Универсальная футболка для повседневного и кэжуал стиля, "
//         "отличающаяся комфортом и качеством ткани – идеальный выбор "
//         "для тех, кто ценит удобство и идеальный внешний вид.",
      //  style: AppStyles.getAppTextStyle(
      //           context: context,
      //           color: const Color(0xff676764),
      //           fontSize: 14,
      //           fontWeight: FontWeight.w400,
      //           fontFamily: 'workSans',
      //         ),
//             ),
//     ],
//   );
// }

//    static Widget _titleText(String title, BuildContext context) {
//     return Text(
//       title,
    //  style: AppStyles.getAppTextStyle(
    //     context: context,
    //     color: const Color(0xff333331),
    //     fontSize: 16,
    //     fontWeight: FontWeight.w700,
    //     fontFamily: 'agdasima',
    //   ),
//     );
//   }

//   static Widget _infoText(String label, String value, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 130,
//             child: Text(
//               label,
              //   style: AppStyles.getAppTextStyle(
              //   context: context,
              //   color: const Color(0xff676764),
              //   fontSize: 14,
              //   fontWeight: FontWeight.w400,
              //   fontFamily: 'workSans',
              // ),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//              style: AppStyles.getAppTextStyle(
//                 context: context,
//                 color: const Color(0xff676764),
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: 'workSans',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
// }

//   Widget _buildDescription() {
//     return const Text(
//       "Описание товара"
//     );
//   }
//   Widget _buildDocuments() {
//     return const Text(
//       "Документы"
//     );
//   }
// }


  // onTap: () {
  //                   showModalBottomSheet(
  //                     context: context,
  //                     isScrollControlled: true,
  //                     backgroundColor: Colors.transparent,
  //                     builder: (context) => DraggableScrollableSheet(
  //                       initialChildSize: 0.97,
  //                       minChildSize: 0.5,
  //                       maxChildSize: 0.97,
  //                       expand: false,
  //                       builder: (context, scrollController) {
  //                         return ProductDetailsBottomSheet(
  //                           scrollController: scrollController,
  //                         );
  //                       },
  //                     ),
  //                   );
  //                 },
