// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../utils/date_format.dart';
import '../../utils/random_color.dart';

Future<void> detailAcara(
    BuildContext context, int index, List<dynamic> listAcara) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context, // Ambil context dari parameter builder.
    builder: (BuildContext context) {
      return Container(
        height: Get.height * 0.7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            // button close
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 196, 196, 196),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 0,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              content: SizedBox(
                                child: Image.network(
                                  listAcara[index].poster,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                    },
                    child: SizedBox(
                      width: 100,
                      child: Image.network(
                        listAcara[index].poster,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Align(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              listAcara[index].name,
                              style: GoogleFonts.poppins(
                                color: AppColors.BLACK,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              listAcara[index].type,
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 94, 94, 94),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              listAcara[index].location,
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 94, 94, 94),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  dateFormat(listAcara[index].date),
                                  style: GoogleFonts.poppins(
                                    color: colorByDayLeft(
                                        dayLeftInt(listAcara[index].date)),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 01,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    listAcara[index].time,
                                    style: GoogleFonts.poppins(
                                      color: colorByDayLeft(
                                          dayLeftInt(listAcara[index].date)),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Deskripsi',
                style: GoogleFonts.poppins(
                  color: AppColors.BLACK,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    listAcara[index].description,
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 94, 94, 94),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
