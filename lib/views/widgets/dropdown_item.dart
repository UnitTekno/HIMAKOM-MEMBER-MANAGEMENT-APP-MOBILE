// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

class DropdownFilter extends StatefulWidget {
  final String? selectedValue;
  final Function(String) onSelected;

  const DropdownFilter(this.selectedValue, this.onSelected, {super.key});

  @override
  _DropdownFilterState createState() => _DropdownFilterState();
}

class _DropdownFilterState extends State<DropdownFilter> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Berita Acara Himpunan",
              style: GoogleFonts.poppins(
                color: AppColors.BLACK,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
          DropdownButton(
            value: _selectedValue,
            hint: _selectedValue == null
                ? Text(
                    "Semua",
                    style: GoogleFonts.poppins(
                      color: AppColors.BLACK,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    _selectedValue!,
                    style: GoogleFonts.poppins(
                      color: AppColors.BLACK,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            items: [
              DropdownMenuItem(
                value: 'Semua',
                child: Text(
                  "Semua",
                  style: GoogleFonts.poppins(
                    color: AppColors.BLACK,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'proker',
                child: Text(
                  "Proker",
                  style: GoogleFonts.poppins(
                    color: AppColors.BLACK,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'pekerjaan',
                child: Text(
                  "Pekerjaan",
                  style: GoogleFonts.poppins(
                    color: AppColors.BLACK,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'lomba',
                child: Text(
                  "Lomba",
                  style: GoogleFonts.poppins(
                    color: AppColors.BLACK,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              widget.onSelected(value!);
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
