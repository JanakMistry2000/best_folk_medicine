import '../main.dart';
import '../utils.dart';
import '../strings.dart';
import 'package:flutter/material.dart';

class DecrementPage extends StatefulWidget {
  int counter;
  final Function chg_title;

  DecrementPage({Key? key, required this.counter, required this.chg_title})
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
                  onPressed: () {
                    Utils.incdecnavi.currentState?.pop(widget.counter);
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
    widget.chg_title(AppString.increment);
  }

  @override
  void didPush() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }
}
