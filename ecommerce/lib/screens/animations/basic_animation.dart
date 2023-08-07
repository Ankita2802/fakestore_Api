import 'package:flutter/material.dart';

class BasicAnimations extends StatefulWidget {
  const BasicAnimations({super.key});

  @override
  State<BasicAnimations> createState() => _BasicAnimationsState();
}

class _BasicAnimationsState extends State<BasicAnimations>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotationanimation;
  late Animation<double> radiusanimation;
  @override
  void initState() {
    //Controller Animation
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    //animation rotations
    rotationanimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    //animation radius
    radiusanimation = Tween(
      begin: 450.0,
      end: 18.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    controller.addListener(() {
      setState(() {});
    });
    super.initState();

    //make animation go back and fourth
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            //biggest container
            Transform.rotate(
              angle: rotationanimation.value,
              child: Container(
                height: 255,
                width: 255,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(radiusanimation.value),
                ),
              ),
            ),

            //2nd container
            Transform.rotate(
              angle: rotationanimation.value + 0.2,
              child: Container(
                height: 175,
                width: 175,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[500],
                  borderRadius: BorderRadius.circular(radiusanimation.value),
                ),
              ),
            ),

            //3rd container

            Transform.rotate(
              angle: rotationanimation.value + 0.4,
              child: Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(radiusanimation.value),
                ),
              ),
            ),

            //4thcontainer

            Transform.rotate(
              angle: rotationanimation.value + 0.6,
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(radiusanimation.value),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
