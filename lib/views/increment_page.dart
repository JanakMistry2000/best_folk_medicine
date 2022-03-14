import '../flavor_config.dart';

import '../main.dart';
import '../utils.dart';
import '../routes.dart';
import '../strings.dart';
import 'package:flutter/material.dart';

class IncrementPage extends StatefulWidget {
  int counter = 0;
  final Function chgtitle;

  IncrementPage({Key? key, required this.chgtitle}) : super(key: key);

  @override
  _IncrementPageState createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.counter}",
              style: const TextStyle(fontSize: 30, fontFamily: 'SF'),
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
                      widget.counter++;
                    });
                  },
                  child: const Text(AppString.increment)),
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
                  onPressed: () async {
                    Utils.dprint('counter value' + widget.counter.toString());
                    widget.counter = await (incdecnavi.currentState
                        ?.pushNamed(AppRoutes.decrementpage, arguments: {
                      'counter': widget.counter,
                      'function': widget.chgtitle
                    })) as int;
                    setState(() {});
                  },
                  child: const Text(AppString.next)),
            ),
          ],
        )
      ]),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() {}

  @override
  void didPushNext() {
    widget.chgtitle(AppString.decrement);
  }

  @override
  void didPop() {}

  @override
  void didPush() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }
}
