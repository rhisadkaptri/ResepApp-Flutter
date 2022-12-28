import 'package:flutter/material.dart';
import 'package:project_akhir/menu_navbar.dart';
import 'package:project_akhir/provider/resep_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 100,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Welcome to",
                style: TextStyle(
                  color: Color.fromARGB(255, 32, 81, 34),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: const [
                  Align(
                    child: Image(
                      height: 25,
                      width: 25,
                      image: AssetImage('assets/iconbook.png'),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Resep Emak",
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 81, 34),
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 81, 34),
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 81, 34),
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Consumer<ResepProvider>(
                              builder: (context, value, child) {
                                return Menu(provider: value);
                              },
                            );
                          },
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      primary: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 211, 14, 14),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Start your foodventure",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
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
}
