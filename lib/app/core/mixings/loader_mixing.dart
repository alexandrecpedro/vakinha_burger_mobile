// 1st structure = Loader System (interacting with our user)
// Hole application usage
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

mixin LoaderMixing on GetxController {
  // loading = controls what will happen
  void loaderListener(RxBool loading) {
    // Workers = take care of listener variables
    ever(loading, (_) async {
      if (loading.isTrue) {
        // Open dialog
        await Get.dialog(
          WillPopScope(
            // Block the screen even if the user try to exit screen
            onWillPop: () async => false,
            child: const Center(
              // A circle for loading
              child: CircularProgressIndicator(),
            ),
          ),
          // It couldn't be removed whatever be the user action
          barrierDismissible: false,
        );
      } else {
        // Close loader
        Get.back();
      }
    });
  }
}
