import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
    var isLoading = true.obs;

  // GlobalKeys for sections
  final contactKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectKey = GlobalKey();
  
  @override
  void onInit() {
    super.onInit();
    _loadInitialContent();
  }

   void _loadInitialContent() async {
    await Future.delayed(Duration(seconds: 2)); 
    isLoading.value = false;
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

