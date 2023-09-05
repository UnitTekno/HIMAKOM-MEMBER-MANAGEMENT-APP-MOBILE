import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

class Kabinet extends StatelessWidget {
  final String pathLogo;
  final String name;
  final String description;
  final BuildContext context;

  const Kabinet({
    super.key,
    required this.pathLogo,
    required this.name,
    required this.description,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // shadow
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Image.network(pathLogo),
              )),
          Expanded(
            flex: 7,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // shadow
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: AppColors.BLACK,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      description,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.BLACK,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
