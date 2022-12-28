import 'package:flutter/material.dart';
import 'package:project_akhir/main_screen.dart';
import 'package:project_akhir/model/category.dart';
import 'package:project_akhir/detail_category.dart';
import 'package:project_akhir/profile_screen.dart';
import 'package:project_akhir/provider/resep_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final ResepProvider manager;
  const HomeScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResepProvider>(context, listen: false);
    return Column(
      children: [
        const ListTile(
          title: Text("Hello Rhisa!"),
          subtitle: Text("What to cook today?"),
          trailing: CircleAvatar(
            backgroundImage: AssetImage("images/icon/woman.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 211, 14, 14),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.white,
                  height: 3,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 248, 249, 253),
                ),
                suffixIcon: Icon(
                  Icons.display_settings_rounded,
                  color: Color.fromARGB(255, 248, 249, 253),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.only(
            left: 8,
          ),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final Category category = categoryList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Utama(
                        resepMenu: category.list,
                        name: category.name,
                      );
                    }));
                  },
                  child: Card(
                    color: const Color.fromRGBO(251, 192, 45, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      child: Row(
                        children: [
                          Image.asset(
                            category.imageAsset,
                            fit: BoxFit.cover,
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            "  " + category.name + "  ",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: categoryList.length),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 12,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/recipe.png',
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Recommended for you",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 92,
              ),
              const Text(
                "see all",
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 14, 14),
                ),
              ),
              const Icon(
                Icons.navigate_next,
                color: Color.fromARGB(255, 211, 14, 14),
              ),
            ],
          ),
        ),
        SizedBox(
          child: MainScreen(
            reverse: false,
            onCreate: (resep) {
              provider.addResep(resep);
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/popular.png',
                height: 22,
                width: 22,
              ),
              const SizedBox(
                width: 6,
              ),
              const Text(
                "Popular Recipes",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 137,
              ),
              const Text(
                "see all",
                style: TextStyle(
                  color: Color.fromARGB(255, 211, 14, 14),
                ),
              ),
              const Icon(
                Icons.navigate_next,
                color: Color.fromARGB(255, 211, 14, 14),
              ),
            ],
          ),
        ),
        SizedBox(
          child: MainScreen(
            reverse: true,
            onCreate: (resep) {
              provider.addResep(resep);
            },
          ),
        ),
      ],
    );
  }
}
