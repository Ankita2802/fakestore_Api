// import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.2,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(80.0),
//                       bottomRight: Radius.circular(80.0))),
//             ),
//             SizedBox(
//               child: CircleAvatar(
//                 radius: 100.0,
//                 backgroundColor: Colors.white,
//                 child: CircleAvatar(
//                   child: Align(
//                     alignment: Alignment.bottomRight,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 12.0,
//                       child: Icon(
//                         Icons.camera_alt,
//                         size: 15.0,
//                         color: Color(0xFF404040),
//                       ),
//                     ),
//                   ),
//                   radius: 38.0,
//                   backgroundImage:
//                       AssetImage('assets/images/user-image-default.png'),
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 padding: EdgeInsets.only(top: 16.0),
//                 child: Text(
//                   'Hi Sir David',
//                   style: TextStyle(
//                     fontFamily: 'SF Pro',
//                     fontWeight: FontWeight.w700,
//                     fontSize: 24.0,
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 padding: EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   'Wildlife Advocate',
//                   style: TextStyle(
//                     fontFamily: 'SF Pro',
//                     fontSize: 12.0,
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: TextButton(
//                   onPressed: () {
//                     print('im pressed');
//                   },
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFEF476F),
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     ),
//                     child: Text(
//                       'Edit Profile',
//                       style: const TextStyle(
//                         fontFamily: 'SF Pro',
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         margin: EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//       ),
//     );
//   }
// }
