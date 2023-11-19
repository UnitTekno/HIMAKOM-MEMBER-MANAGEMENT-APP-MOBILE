// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/auth_model.dart';

class ProfileAppbar extends StatelessWidget {
  final User user;

  const ProfileAppbar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // logo
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: ClipOval(
            child: SizedBox(
              width: 40,
              height: 40,
              child: _buildUserAvatar(),
            ),
          ),
        ),

        // nama user
        Container(
          width: Get.width * 0.65,
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // nama user
              _buildUserName(),

              // status user
              _buildUserRole(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildUserAvatar() {
    return user.picture == ''
        ? const Icon(
            Icons.person,
            color: Colors.white,
          )
        : Image.network(
            user.picture,
            fit: BoxFit.cover,
          );
  }

  Widget _buildUserName() {
    final userName = user.name;
    return Text(
      userName,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      overflow: TextOverflow.fade,
      maxLines: 1,
    );
  }

  Widget _buildUserRole() {
    final userRole = user.roleName;

    return Text(
      userRole,
      style: GoogleFonts.poppins(
        color: Colors.grey,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      overflow: TextOverflow.fade,
      maxLines: 1,
    );
  }
}
