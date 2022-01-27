import 'package:flutter/material.dart';

import '../flavor_config.dart';
import '../main.dart';
import '../strings.dart';
import '../utils.dart';

class DecrementPage extends StatefulWidget {
  int counter;
  final Function chgtitle;

  DecrementPage({Key? key, required this.counter, required this.chgtitle})
      : super(key: key);

  @override
  _DecrementPageState createState() => _DecrementPageState();
}

class _DecrementPageState extends State<DecrementPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.counter}",
              style: const TextStyle(fontFamily: 'SF', fontSize: 30),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              AppString.counter,
              style: TextStyle(fontSize: 30, fontFamily: 'SF'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          FlavorConfig.instance.flavorColor.primarycolor)),
                  onPressed: () {
                    setState(() {
                      widget.counter--;
                    });
                  },
                  child: const Text(AppString.decrement)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          FlavorConfig.instance.flavorColor.primarycolor)),
                  onPressed: () {
                    incdecnavi.currentState?.pop(widget.counter);
                  },
                  child: const Text(AppString.back)),
            ),
          ],
        )
      ]),
    );
  }

  @override
  void didPopNext() {}

  @override
  void didPushNext() {}

  @override
  void didPop() {
    widget.chgtitle(AppString.increment);
  }

  @override
  void didPush() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }
}
