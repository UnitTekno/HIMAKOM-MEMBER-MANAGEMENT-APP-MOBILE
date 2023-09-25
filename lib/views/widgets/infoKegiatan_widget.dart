// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable/expandable.dart';

import '../../constants/app_colors.dart';
import '../../utils/date_format.dart';
import '../../utils/random_color.dart';

class InfoKegiatanHimpunan extends StatefulWidget {
  final int jumlahKegiatan;
  final List<dynamic> listKegiatan;

  const InfoKegiatanHimpunan({
    super.key,
    required this.jumlahKegiatan,
    required this.listKegiatan,
  });

  @override
  _InfoKegiatanHimpunanState createState() => _InfoKegiatanHimpunanState();
}

class _InfoKegiatanHimpunanState extends State<InfoKegiatanHimpunan> {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ExpandablePanel(
        collapsed: contentInfoKegiatan(
            true, widget.listKegiatan, widget.jumlahKegiatan),
        expanded: contentInfoKegiatan(
            false, widget.listKegiatan, widget.jumlahKegiatan),
        builder: (_, collapsed, expanded) {
          return Container(
            height: widget.listKegiatan.isNotEmpty ? null : 155,
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
            child: Expandable(
              collapsed: collapsed,
              expanded: expanded,
            ),
          );
        },
      ),
    );
  }
}

Widget contentInfoKegiatan(isCollapsed, listKegiatan, jumlahKegiatan) {
  int kegiatan;
  isCollapsed && (jumlahKegiatan > 2)
      ? kegiatan = 2
      : kegiatan = jumlahKegiatan;

  return Builder(builder: (context) {
    var controller = ExpandableController.of(context, required: true)!;
    return Container(
      alignment: Alignment.center,
      height: (isCollapsed && (jumlahKegiatan < 2)) || (!isCollapsed && (jumlahKegiatan < 2)) ? 155 : null,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.only(top: 10, right: 20),
        child: listKegiatan.isEmpty
            ? Text(
                "Tidak ada kegiatan . . .",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 94, 94, 94),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month_rounded,
                              color: Color.fromARGB(255, 94, 94, 94),
                              size: 16,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                dateFormat(listKegiatan[0].date),
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 94, 94, 94),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              dayLeft(listKegiatan[0].date),
                              textStyle: GoogleFonts.poppins(
                                color: colorByDayLeft(
                                    dayLeftInt(listKegiatan[0].date)),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          repeatForever: true,
                          totalRepeatCount: 100,
                        ),
                      ),
                    ],
                  ),
                  for (int i = 0; i < kegiatan; i++)
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 12,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                  listKegiatan[i].name,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          margin: const EdgeInsets.only(top: 2),
                          color: const Color.fromARGB(255, 94, 94, 94),
                        )
                      ],
                    ),
                  if (jumlahKegiatan >= 3)
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextButton(
                        onPressed: () {
                          controller.toggle();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.expanded
                                  ? 'Lihat Ringkas'
                                  : 'Lihat Semua',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF2192FF),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              controller.expanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: const Color(0xFF2192FF),
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  });
}
