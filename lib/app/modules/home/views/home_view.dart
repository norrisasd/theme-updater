// ignore_for_file: use_super_parameters

import 'package:files_updater/app/modules/home/views/widgets/folder_picker.dart';
import 'package:files_updater/app/modules/home/views/widgets/update_button.dart';
import 'package:files_updater/app/modules/shared/logo.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'widgets/title_header.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.black87],
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeHeader(),
              Expanded(
                child: FolderPicker(),
              ),
              Logo()
            ],
          ),
        ),
      ),
    );
  }
}
