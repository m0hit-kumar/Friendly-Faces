import 'package:flutter/material.dart';
import 'package:friendly_faces/widgets/rotating.dart';

class CircleWidget extends StatefulWidget {
  const CircleWidget({super.key});

  @override
  State<CircleWidget> createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Draggable<String>(
            data: 'red',
            feedback: Container(
              width: 20,
              height: 20,
              color: Colors.green,
            ),
            child: const CircleOutlineWidget(),
          ),

          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     CircleAvatar(
          //       radius: Get.width / 2.5,
          //       backgroundColor: Colors.orange,
          //       child: DragTarget<String>(
          //           builder: (BuildContext context, List<dynamic> accepted,
          //                   List<dynamic> rejected) =>
          //               Container(
          //                 width: 20,
          //                 height: 20,
          //                 decoration: const BoxDecoration(
          //                   color: Colors.white,
          //                   shape: BoxShape.circle,
          //                 ),
          //               )),
          //     ),
          //     Positioned(
          //       top: 10.0,
          //       left: 0,
          //       right: 0,
          //       child: Container(
          //         width: 20,
          //         height: 20,
          //         decoration: const BoxDecoration(
          //           color: Colors.white,
          //           shape: BoxShape.circle,
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       bottom: 10.0,
          //       left: 0,
          //       right: 0,
          //       child: Container(
          //         width: 20,
          //         height: 20,
          //         decoration: const BoxDecoration(
          //           color: Colors.white,
          //           shape: BoxShape.circle,
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       left: 10.0,
          //       top: 0,
          //       bottom: 0,
          //       child: Container(
          //         width: 20,
          //         height: 20,
          //         decoration: const BoxDecoration(
          //           color: Colors.white,
          //           shape: BoxShape.circle,
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       top: 0,
          //       right: 10.0,
          //       bottom: 0,
          //       child: Draggable(
          //         feedback: Container(
          //           width: 20,
          //           height: 20,
          //           decoration: const BoxDecoration(
          //             color: Colors.blue,
          //             shape: BoxShape.circle,
          //           ),
          //         ),
          //         child: Container(
          //           width: 20,
          //           height: 20,
          //           decoration: const BoxDecoration(
          //             color: Colors.black,
          //             shape: BoxShape.circle,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
