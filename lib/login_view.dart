import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';

import 'login_con.dart';



class LoginView extends GetView<LoginController> {
  final LoginController c = Get.put(LoginController());

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<LoginController>(
          builder: (controller) {
            if (controller.isLoadingUsers) {
              return   Center(child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/d3f472b06590a25cb4372ff289d81711_w200.gif",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Please Wait....",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )));
            } else if (controller.user == null) {
              return   Center(
                child: InkWell(
                  onTap: ()async{

                    controller.user = await controller.getRandomData();

                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.purple.withOpacity(0.4),
                        radius: 80,
                        child: CircleAvatar(
                            backgroundColor: Colors.purple.withOpacity(0.5),
                            radius: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.purple.withOpacity(0.8),
                              radius: 40,
                              child:const  Icon(Icons.refresh_outlined,color: Colors.white,size: 40,),
                            )
                        ),
                      ),
                    ],
                  ),
                ) ,);
            } else {
              return Center(
                child: ConfettiWidget(
                  confettiController: controller.controllerBottomCenter,
                  numberOfParticles: 100,
                  maxBlastForce: 100,
                  minBlastForce: 60,
                  blastDirectionality: BlastDirectionality
                      .explosive, // don't specify a direction, blast randomly
                  shouldLoop:
                  true, // start again as soon as the animation is finished
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ], // manually specify the colors to be used
                  createParticlePath:
                  controller.drawStar, // define a custom sha
                  child:  Scratcher(
                       brushSize: 30,
                       threshold: 50,
                       color: Colors.red,
                       onChange: (value) => print("Scratch progress: $value%"),
                       onThreshold: () {
                         controller.controllerBottomCenter.play();
                         controller.controllerCenter.play();
                         controller.controllerCenterLeft.play();
                         controller.controllerCenterRight.play();
                         controller.controllerTopCenter.play();
                       },
                       child: Container(
                         width: 200,
                         height: 200,
                         color: Colors.purple[300],
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Center(
                                 child: Text(controller.user?.name ?? "",
                                   style: const TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20,
                                     color: Colors.white,
                                   ),),
                               ),
                               const SizedBox(
                                 height: 10,
                               ),
                               Center(
                                 child: Text(controller.user?.phone ?? "",
                                   style: const TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 18,
                                     color: Colors.white,
                                   ),),
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                ),
              );
            }
          },
        ));
  }
}
