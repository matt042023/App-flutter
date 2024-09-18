import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListPage"),
        backgroundColor: const Color(0x800000ff),
      ),
      body: const Center(
        child: Text("Coucou",
          style: TextStyle(
            fontSize: 40
          ),

        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scratch"),
        backgroundColor: const Color(0x8000ff00),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
          "assets/images/logo_flutter.svg",
          width: 120,
        ),
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                "Welcome in the body",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Arcade",
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
             const Text(
              "Little demo app\n To handle awesome flutter",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
              backgroundColor: MaterialStatePropertyAll(Colors.red)
              ),
                onPressed: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_,__,___) => const ListPage()
                    )
                ),
                child: const Text(
                  "List Page",
                      style: TextStyle(
                    fontSize: 16,
                  color: Colors.white,
                )
                )
            )
          ],
        ),
      ),
    );
  }
}
