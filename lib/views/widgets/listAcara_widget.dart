// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../utils/date_format.dart';
import '../../utils/random_color.dart';

import 'detailAcara_widget.dart';

class ListAcara extends StatelessWidget {
  final List<dynamic> listAcara;

  const ListAcara({super.key, required this.listAcara});

  @override
  Widget build(BuildContext context) {
    return listAcara.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.ICON_NOTFOUND,
                  width: 100,
                  height: 100,
                ),
                Text(
                  'Tidak Tersedia',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.BLACK,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  detailAcara(context, index, listAcara);
                },
                child: Container(
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 20, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.WHITE,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(40, 0, 0, 0),
                        offset: Offset(0, 4),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 100,
                        child: Image.network(listAcara[index].poster,
                            fit: BoxFit.fitHeight),
                      ),
                      SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(listAcara[index].name,
                                  style: GoogleFonts.poppins(
                                      color: AppColors.BLACK,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                listAcara[index].description,
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 94, 94, 94),
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  listAcara[index].type,
                                  style: GoogleFonts.poppins(
                                    color: AppColors.BLACK,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        dateFormat(listAcara[index].date),
                                        style: GoogleFonts.poppins(
                                          color: colorByDayLeft(dayLeftInt(
                                              listAcara[index].date)),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        width: 20,
                        decoration: BoxDecoration(
                          color:
                              colorByDayLeft(dayLeftInt(listAcara[index].date)),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      )
                    ],
                  ),

                  //
                ),
              );
            },
            itemCount: listAcara.length,
          );
  }
}
