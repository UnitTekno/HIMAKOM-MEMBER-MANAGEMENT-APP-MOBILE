import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

class Departments extends StatelessWidget {
  final String logo;
  final String name;

  const Departments({super.key, required this.logo, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              logo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          child: Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: AppColors.BLACK,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
