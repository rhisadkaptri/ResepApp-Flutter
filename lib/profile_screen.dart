import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          height: 50,
          child: const Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 211, 14, 14),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(fit: StackFit.expand, children: const [
                CircleAvatar(
                  backgroundImage: AssetImage("images/icon/woman.png"),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromRGBO(251, 192, 45, 1),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.person, color: Colors.black),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Rhisa Adika Putri",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Color.fromARGB(255, 211, 14, 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              child: Card(
                // padding: const EdgeInsets.all(13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromRGBO(251, 192, 45, 1),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "tugasdicoding@gmail.com",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Color.fromARGB(255, 211, 14, 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              child: Card(
                // padding: const EdgeInsets.all(13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromRGBO(251, 192, 45, 1),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.phone_android,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "+62 852 8638 7922",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Color.fromARGB(255, 211, 14, 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromRGBO(251, 192, 45, 1),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.key,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "***************",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Color.fromARGB(255, 211, 14, 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color.fromRGBO(251, 192, 45, 1),
                child: TextButton(
                  // padding: const EdgeInsets.all(13),
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          "Setting",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Color.fromARGB(255, 211, 14, 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 131,
                vertical: 10,
              ),
              child: Card(
                color: const Color.fromARGB(255, 211, 14, 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text('Are You Sure Logout?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Center(
                        child: Text(
                          "L O G O U T",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "versi 1.1.0",
              style: TextStyle(
                color: Color.fromARGB(255, 211, 14, 14),
              ),
            )
          ],
        )
      ],
    );
  }
}
