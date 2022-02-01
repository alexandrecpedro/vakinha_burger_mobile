import 'package:flutter/material.dart';
import 'package:get/get.dart';

// S and C = values received to type our variables
abstract class VakinhaState<S extends StatefulWidget, C extends GetxController>
    extends State<S> {
  // Attribute
  C get controller => Get.find();
}
