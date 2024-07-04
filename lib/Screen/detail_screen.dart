// import 'package:flutter/material.dart';
// import 'package:test_cpts/Screen/refund_screen.dart';

// class DetailScreen extends StatelessWidget {
//   final Map<String, dynamic> item;

//   const DetailScreen({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Transaksi'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         SizedBox(
//                           width: 50,
//                           height: 50,
//                           child: Image.asset(
//                             'Assets/Gambar1.jpg',
//                             width: double.infinity,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 '${item['name']}',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               Text(
//                                 '${item['price']}',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey[800],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Customer Name',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   Text(
//                     'Dewi Sandra',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Acquirer Name',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   Text(
//                     'Bank BNI',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'CPAN',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   Text(
//                     '08310837408713084731',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'MerchantPan',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   Text(
//                     '9360000912345678901',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Issuer Name',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   Text(
//                     'Bank DKI',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Invoice Number',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   Text(
//                     '0012345670001234567',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         showConfirmationDialog(context, 'Tolak Refund');
//                       },
//                       child: const Text('Tolak'),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         showConfirmationDialog(context, 'Terima Refund');
//                       },
//                       child: const Text('Terima Refund'),
//                     ),
//                   ],
//                 ),
//               ),
//               // Align(
//               //   alignment: Alignment.bottomCenter,
//               //   child: Container(
//               //     margin: const EdgeInsets.all(5),
//               //     width: double.infinity,
//               //     child: ElevatedButton(
//               //       onPressed: () {},
//               //       child: const Text('Bottom Button '),
//               //     ),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void showConfirmationDialog(BuildContext context, String action) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Konfirmasi'),
//           content: Text('Apakah Anda yakin ingin $action?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Batal'),
//             ),
//             TextButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Refund diterima')),
//                 );
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const RefundScreen(),
//                   ),
//                 );
//               },
//               child: const Text('Konfirmasi'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
