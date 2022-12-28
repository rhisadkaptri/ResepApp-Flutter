import 'package:flutter/material.dart';
import 'package:project_akhir/model/list_menu.dart';
import 'package:project_akhir/detail_screen.dart';
import 'package:project_akhir/provider/resep_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final bool reverse;
  final Function(ResepMenu) onCreate;
  const MainScreen({
    Key? key,
    required this.reverse,
    required this.onCreate,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // final int index;
    final provider = Provider.of<ResepProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(8),
      height: 290,
      child: ListView.separated(
        reverse: widget.reverse,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemCount: resepmenuList.length,
        itemBuilder: (context, index) {
          final ResepMenu resepMenu = resepmenuList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    resepMenu: resepMenu,
                    index: index,
                    onCreate: (resep) {
                      provider.addResep(resep);
                    },
                  );
                }),
              );
              // print(index);
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        resepMenu.imageAsset,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            // print(index);
                            if (resepMenu.saved) {
                              var menu = ResepMenu(
                                name: resepMenu.name,
                                star: resepMenu.star,
                                time: resepMenu.time,
                                category: resepMenu.category,
                                author: resepMenu.author,
                                servings: resepMenu.servings,
                                ingredients: resepMenu.ingredients,
                                instructions: resepMenu.instructions,
                                imageAsset: resepMenu.imageAsset,
                                saved: !resepMenu.saved,
                              );
                              provider.deleteResep(index, menu);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Delete from Collections"),
                                ),
                              );
                            } else {
                              var menu = ResepMenu(
                                name: resepMenu.name,
                                star: resepMenu.star,
                                time: resepMenu.time,
                                category: resepMenu.category,
                                author: resepMenu.author,
                                servings: resepMenu.servings,
                                ingredients: resepMenu.ingredients,
                                instructions: resepMenu.instructions,
                                imageAsset: resepMenu.imageAsset,
                                saved: !resepMenu.saved,
                              );
                              widget.onCreate(menu);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Add to Collections"),
                                ),
                              );
                            }
                            setState(() {
                              resepMenu.saved = !resepMenu.saved;
                            });
                          },
                          child: resepMenu.saved
                              ? const Icon(
                                  Icons.bookmark,
                                  size: 30,
                                  color: Color.fromARGB(255, 211, 14, 14),
                                )
                              : const Icon(
                                  Icons.bookmark_border,
                                  size: 30,
                                  color: Color.fromARGB(255, 211, 14, 14),
                                ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    " " + resepMenu.name,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.yellow.shade700,
                      ),
                      Text(resepMenu.star),
                      const SizedBox(
                        width: 18,
                      ),
                      const Icon(
                        Icons.alarm,
                        size: 18,
                      ),
                      Text(resepMenu.time),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
