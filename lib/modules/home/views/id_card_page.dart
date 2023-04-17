import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';

@RoutePage(name: 'IDCardPage')
class IDCardPage extends StatefulWidget {
  const IDCardPage({Key? key}) : super(key: key);

  @override
  State<IDCardPage> createState() => _MyAppState();
}

class _MyAppState extends State<IDCardPage> {
  List<String> _pictures = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: onPressed, child: const Text("Add Pictures")),
            for (var picture in _pictures) Image.file(File(picture))
          ],
        )),
      ),
    );
  }

  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
      });
    } catch (exception) {
      // Handle exception here
    }
  }
}

/*class IDCardPage extends StatefulWidget {
  const IDCardPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _IDCardPage createState() => _IDCardPage();
}

class _IDCardPage extends State {
  Offset offset = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MouseRegion(
        onHover: (e) => setState(() => offset = e.position),
        child: Scaffold(
          backgroundColor: Colors.cyan.shade50,
          body: Stack(
            children: [
              const Center(
                child: Text(
                  '//Hello, world',
                  style: TextStyle(
                    fontSize: 90,
                  ),
                ),
              ),
              Transform.translate(
                offset: offset - Offset(10, 10),
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
} */

/*class IDCardPage extends HookConsumerWidget {
  const IDCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 700,
                height: 225,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 4),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(0, 196, 200, 196),
                      offset: Offset(6.0, 6.0),
                    ),
                  ],
                ),
                // Size the button
                child: SizedBox(
                  // Inkwell
                  child: InkWell(
                    radius: 100,
                    // display a snackbar on tap
                    onTap: () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Hello There!'),
                          duration: Duration(milliseconds: 1500),
                        ),
                      );
                    },
                    // implement the image with Ink.image
                    child: Ink.image(
                      fit: BoxFit.cover,
                      image: const NetworkImage(
                          'https://www.kindacode.com/wp-content/uploads/2022/07/bottle.jpeg'),
                    ),
                  ),
                ),
              ),
              Container(
                width: 700,
                height: 225,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 4),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(0, 196, 200, 196),
                      offset: Offset(6.0, 6.0),
                    ),
                  ],
                ),
                // Size the button
                child: SizedBox(
                  // Inkwell
                  child: InkWell(
                    radius: 100,
                    // display a snackbar on tap
                    onTap: () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Hello There!'),
                          duration: Duration(milliseconds: 1500),
                        ),
                      );
                    },
                    // implement the image with Ink.image
                    child: Ink.image(
                      fit: BoxFit.cover,
                      image: const NetworkImage(
                          'https://www.kindacode.com/wp-content/uploads/2022/07/bottle.jpeg'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}*/
