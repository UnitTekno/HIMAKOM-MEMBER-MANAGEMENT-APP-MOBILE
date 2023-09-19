import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../utils/date_format.dart';
import '../../utils/random_color.dart';

import 'detailAcara_widget.dart';

class ListAcara extends StatelessWidget {
  final List<dynamic> listAcara;

  const ListAcara({Key? key, required this.listAcara}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    return listAcara.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.ICON_NOTFOUND,
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.1,
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
                  height: screenHeight <= 700
                      ? screenHeight * 0.22
                      : screenHeight * 0.18,
                  margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: screenWidth * 0.2,
                          child: Image.network(listAcara[index].poster,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Text(listAcara[index].name,
                                    style: GoogleFonts.poppins(
                                        color: AppColors.BLACK,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  listAcara[index].description,
                                  style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(255, 94, 94, 94),
                                    fontSize: screenWidth * 0.03,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listAcara[index].type,
                                    style: GoogleFonts.poppins(
                                      color: AppColors.BLACK,
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    dateFormat(listAcara[index].date),
                                    style: GoogleFonts.poppins(
                                      color: colorByDayLeft(
                                          dayLeftInt(listAcara[index].date)),
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                          width: screenWidth * 0.05,
                          decoration: BoxDecoration(
                            color: colorByDayLeft(
                                dayLeftInt(listAcara[index].date)),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: listAcara.length,
          );
  }
}
