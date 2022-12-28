import 'package:flutter/material.dart';
import 'package:project_akhir/detail_screen.dart';
import 'package:project_akhir/model/list_menu.dart';
import 'package:project_akhir/provider/resep_provider.dart';
import 'package:provider/provider.dart';

class CollectListScreen extends StatelessWidget {
  final ResepProvider provider;
  final Function(ResepMenu) onCreate;
  const CollectListScreen(
      {Key? key, required this.provider, required this.onCreate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResepProvider>(context, listen: false);

    final resepMenu = provider.resep;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 680,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 20,
            );
          },
          itemCount: resepMenu.length,
          itemBuilder: (context, index) {
            final ResepMenu item = resepMenu[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    resepMenu: item,
                    index: index,
                    onCreate: (resep) {
                      provider.addResep(resep);
                    },
                  );
                }));
              },
              child: Card(
                child: Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          item.imageAsset,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 150,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 150,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // print(index);
                            if (item.saved) {
                              var menu = ResepMenu(
                                name: item.name,
                                star: item.star,
                                time: item.time,
                                category: item.category,
                                author: item.author,
                                servings: item.servings,
                                ingredients: item.ingredients,
                                instructions: item.instructions,
                                imageAsset: item.imageAsset,
                                saved: !item.saved,
                              );
                              provider.deleteResep(index, menu);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Delete from Collections"),
                                ),
                              );
                            } else {
                              var menu = ResepMenu(
                                name: item.name,
                                star: item.star,
                                time: item.time,
                                category: item.category,
                                author: item.author,
                                servings: item.servings,
                                ingredients: item.ingredients,
                                instructions: item.instructions,
                                imageAsset: item.imageAsset,
                                saved: !item.saved,
                              );
                              onCreate(menu);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Add to Collections"),
                                ),
                              );
                            }
                            setState(() {
                              item.saved = !item.saved;
                            });
                          },
                          child: item.saved
                              ? Container(
                                  padding: const EdgeInsets.only(
                                    left: 150,
                                  ),
                                  child: const Icon(
                                    Icons.bookmark,
                                    size: 30,
                                    color: Color.fromARGB(255, 211, 14, 14),
                                  ),
                                )
                              : const Icon(
                                  Icons.bookmark_border,
                                  size: 30,
                                  color: Color.fromARGB(255, 211, 14, 14),
                                ),
                        ),
                        Text(
                          " " + item.name,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 22,
                              color: Colors.yellow.shade700,
                            ),
                            Text(item.star),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
