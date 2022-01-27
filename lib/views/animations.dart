import 'package:best_folk_medicine/colors.dart';
import 'package:best_folk_medicine/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../mobx/mobx_store.dart';
import '../strings.dart';

class Animations extends StatefulWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with TickerProviderStateMixin {
  late MobxStore store;
  late Animation<Color?> animation;

  late final AnimationController rollController;
  late final Animation<double> rollAnimation;
  late final Animation<Offset> offsetAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<MobxStore>(context);
    rollController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    rollAnimation =
        CurvedAnimation(parent: rollController, curve: Curves.elasticOut);
    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.0),
      end: const Offset(2.5, 0.0),
    ).animate(CurvedAnimation(parent: rollController, curve: Curves.bounceIn));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      AppString.animation,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Observer(
            builder: (context) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 800),
                          opacity: (store.selectedIndex != 2) ? 0 : 1,
                          child: AnimatedContainer(
                            onEnd: () {
                              if (rollController.isCompleted) {
                                rollController.reset();
                              } else {
                                rollController.forward();
                              }
                            },
                            height: (store.selectedIndex != 2)
                                ? 0
                                : MediaQuery.of(context).size.height,
                            width: (store.selectedIndex != 2)
                                ? 0
                                : MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: (store.selectedIndex != 2)
                                    ? AppColor.blue
                                    : AppColor.white),
                            duration: const Duration(milliseconds: 800),
                            child: Center(
                                child: Image.asset(AppImage.house,
                                    height: 200, width: 200)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedPositioned(
                    curve: Curves.bounceOut,
                    left: (store.selectedIndex != 2)
                        ? -200
                        : MediaQuery.of(context).size.width * 0.27 - 50,
                    top: MediaQuery.of(context).size.height * 0.5 - 130,
                    duration: const Duration(
                        milliseconds: /*store.rotateAnimationDuration*/ 3500),
                    child: RotationTransition(
                      turns: rollAnimation,
                      child:
                          Image.asset(AppImage.coin, height: 100, width: 100),
                    ),
                  ),
                ],
              );
            },
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    rollController.dispose();
    super.dispose();
  }
}
