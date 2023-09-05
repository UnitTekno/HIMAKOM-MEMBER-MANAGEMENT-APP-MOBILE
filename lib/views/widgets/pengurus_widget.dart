import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pengurus extends StatelessWidget {
  final String avatar;
  final String name;
  final String role;

  const Pengurus({
    super.key,
    required this.avatar,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 400,
          height: 300,
          child: Image.network(avatar, fit: BoxFit.fitHeight),
        ),
        Positioned(
          bottom: 35,
          left: 0,
          right: 0,
          height: 80,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color.fromARGB(255, 52, 95, 180).withOpacity(0.85),
                  const Color.fromARGB(255, 9, 130, 207).withOpacity(0.81),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                Text(
                  role,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// Widget Pengurus(String avatar, String name, String role) {
//   return 
// }
