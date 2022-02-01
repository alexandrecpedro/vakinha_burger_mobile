// Principal page
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF140E0E),
        // Stack up components ('empilhar')
        child: Stack(
          children: [
            // Align on center (horizontal) on the bottom (vertical)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                // Extends all screen width (100 vw)
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height:
                        context.heightTransformer(reducedBy: 85), // 15% screen
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 60,
                  ),
                  VakinhaButton(
                    label: 'ACESSAR',
                    width: context.widthTransformer(reducedBy: 40),
                    height: 35, // 60% screen
                    onPressed: () {
                      Get.toNamed('/auth/login');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}