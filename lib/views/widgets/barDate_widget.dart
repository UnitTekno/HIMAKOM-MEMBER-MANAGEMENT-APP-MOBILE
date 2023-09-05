// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';

class BarDateNowWidget extends StatelessWidget {
  final int jumlahKegiatan;

  const BarDateNowWidget({
    Key? key,
    required this.jumlahKegiatan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              Text("Hari ini",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.WHITE,
          ),
          child: Center(
            child: Text("$jumlahKegiatan Kegiatan",
                style: GoogleFonts.poppins(
                    color: AppColors.BLACK,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
