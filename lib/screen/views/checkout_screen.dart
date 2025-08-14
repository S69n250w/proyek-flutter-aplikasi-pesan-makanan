import 'package:flutter/material.dart';
import 'package:aplikasi_sederhana/model/food.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final List<Food> cartItems = [
    Food(
      id: '1',
      name: 'Ikan Kakap Sambalado',
      description: '',
      imageUrl: 'assets/img/ikan_kakap_sambalado.jpg',
      price: 20000,
      qty: 10
    ),
    Food(
      id: '2',
      name: 'Kangkung Belacan',
      description: '',
      imageUrl: 'assets/img/kangkung_belacan.jpg',
      price: 15000,
      qty: 2,
    ),
    Food(
      id: '3',
      name: 'Soto', 
      description: '',
      imageUrl: 'assets/img/soto.jpg',
      price: 25000,
      qty: 3,
    ),
  ];

  String? selectedPayment;
  
  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.qty);
  double get tax => subtotal * 0.11; // 11%
  double get adminFee => subtotal * 0.05; // 5%
  double get shipmentFee => 5.0;
  double get total => subtotal + tax + adminFee + shipmentFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Keranjang",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionTitle("Order Summary"),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.orange,
    //     title: const Text(
    //       "Keranjang",
    //       style: TextStyle(
    //         color: Colors.white
    //       ),
    //     ),
    //     centerTitle: true,
    //     // leading: IconButton(onPressed: () {
          
    //     // },
    //     // icon: Icon(Icons.arrow_back_ios_new))
    //   ),
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const Padding(
    //         padding: EdgeInsets.only(left: 16.0, top: 14.0, bottom: 8.0),
    //         child: Text(
    //           "Ringkasan Pesanan",
    //           style: TextStyle(
    //             fontSize: 19,
    //             fontWeight: FontWeight.w500
    //           ),
    //         ),
    //       ),

    //       const Divider(thickness: 1.5),

    //       const SizedBox(height: 12),
          
    //       Row(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(left: 16.0),
    //             child: Column(
    //               children: [
    //                 Image.asset(
    //                   'assets/img/kangkung_belacan.jpg',
    //                   height: 60,
    //                   width: 60,
    //                   fit: BoxFit.cover,
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.only(left: 16.0),
    //             child: Text(
    //               "Kangkung Belacan",
    //               style: TextStyle(
    //                 fontSize: 17,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),

    //           const Spacer(),
              
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               const Padding(
    //                 padding: EdgeInsets.only(right: 16.0),
    //                 child: Text(
    //                   "15.000",
    //                   style: TextStyle(
    //                     fontSize: 15,
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(10.0),
    //                 child: Container(
    //                   child: Text(
    //                     "1",
    //                     style: TextStyle(
    //                       fontSize: 12,
    //                       fontWeight: FontWeight.w500
    //                     ),
    //                   ),
    //                   width: 30,
    //                   height: 30,
    //                   alignment: Alignment.center,
    //                   decoration: BoxDecoration(
    //                     borderRadius: const BorderRadius.all(Radius.circular(99.0)),
    //                     color: Colors.white,
    //                     border: Border.all(
    //                       width: 1,
    //                       color: Colors.orange,
    //                     ),
    //                     boxShadow: const [
    //                       BoxShadow(
    //                         color: Color.fromARGB(57, 0, 0, 0),
    //                         offset: Offset(0, 2),
    //                         blurRadius: 5.0
    //                       )
    //                     ]
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //       Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: Row(
    //           children: [
    //             Padding(padding: EdgeInsets.only(left: 16.0)),
    //             Text("Subtotal (Termasuk pajak)"),
          
    //             Spacer(),
          
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               children: [
    //                 Padding(padding: EdgeInsets.only(right: 50.0)),
    //                 Text("Rp15.000"),
    //                 Text("Biaya pengiriman"),
    //                 Text("10.000"),
    //                 Text("Biaya pemesanan"),
    //                 Text("1.000")
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),

    //       const SizedBox(height: 12),

    //       const Divider(thickness: 1.5),

    //       const SizedBox(height: 5),

    //       const Padding(
    //         padding: EdgeInsets.only(left: 16.0),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.warning,
    //               color: Colors.amber,
    //             ),
    //             Padding(padding: EdgeInsets.only(left: 8.0)),
    //             Text("Periksa apakah lokasi pengiriman ini benar")
    //           ],
    //         ),
    //       ),

    //       const SizedBox(height: 5),

    //       const Divider(thickness: 1.5),

    //       const Padding(
    //         padding: EdgeInsets.only(left: 16.0),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.location_on,
    //               color: Colors.red,
    //             ),
    //             Padding(padding: EdgeInsets.only(left: 8.0)),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   "Lokasi",
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold
    //                   ),
    //                 ),
    //                 Padding(padding: EdgeInsets.only(top: 3.0)),
    //                 Text("Set lokasi")
    //               ],
    //             )
    //           ],
    //         ),
    //       ),

    //       const Divider(thickness: 1.5),

    //       const SizedBox(height: 4),

    //       const Padding(
    //         padding: EdgeInsets.only(left: 16.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               "Rincian Pembayaran",
    //               style: TextStyle(
    //                 fontWeight: FontWeight.w500
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 5.0),
    //               child: Row(
    //                 children: [
    //                   Icon(
    //                     Icons.monetization_on,
    //                     color: Colors.purple,
    //                   ),
    //                   Padding(padding: EdgeInsets.only(left: 10.0)),
    //                   Column(
    //                     children: [
    //                       Text("Rp200000")
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),

    //       const Divider(thickness: 1.5),

    //       const SizedBox(height: 4),

    //       const Padding(
    //         padding: EdgeInsets.only(left: 16.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               "Penawaran",
    //               style: TextStyle(
    //                 fontWeight: FontWeight.w500
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 8.0),
    //               child: Row(
    //                 children: [
    //                   Icon(Icons.discount),
    //                   Padding(padding: EdgeInsets.only(left: 10.0)),
    //                   Text("Pilih kupon")
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),

    //       const SizedBox(height: 4),

    //       const Divider(thickness: 1.5),

    //       const SizedBox(height: 30),

    //       const Padding(
    //         padding: EdgeInsets.only(left: 16.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               "Total",
    //               style: TextStyle(
    //                 fontWeight: FontWeight.w500,
    //                 fontSize: 17
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(right: 16.0),
    //               child: Column(
    //                 children: [
    //                   Text(
    //                     "Rp26000",
    //                     style: TextStyle(
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),

    //       const SizedBox(height: 30),

    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //         child: SizedBox(
    //           width: double.infinity,
    //           child: ElevatedButton(onPressed: () {
                
    //           },
    //           child: Text(
    //             "Pesan Sekarang",
    //             style: TextStyle(
    //               color: Colors.white,
    //               fontSize: 18
    //             ),
    //           ),
    //           style: ElevatedButton.styleFrom(
    //             backgroundColor: Colors.orange,
    //             padding: const EdgeInsets.symmetric(vertical: 14.0),
    //             // textStyle: const TextStyle(fontSize: 18)
    //           ),
    //           ),
    //         ),
    //       ),

    //       const SizedBox(height: 30)
    //     ],
    //   ),
    // );
  }
}

Widget _buildSectionTitle(String title) {
  return SizedBox(
    width: double.infinity,
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    ),
  );
}