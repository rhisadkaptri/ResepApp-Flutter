import 'package:flutter/material.dart';
import 'package:project_akhir/model/list_menu.dart';
import 'package:project_akhir/provider/resep_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final ResepMenu resepMenu;
  final Function(ResepMenu) onCreate;
  final int index;
  const DetailScreen({
    Key? key,
    required this.resepMenu,
    required this.onCreate,
    required this.index,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<ResepProvider>(context, listen: false);
    // print('detailindex : ' + widget.index.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Food'),
        backgroundColor: const Color.fromRGBO(251, 192, 45, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        " " + widget.resepMenu.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 211, 14, 14),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(238, 238, 238, 1),
                        ),
                        child: const Icon(
                          Icons.file_upload_outlined,
                          size: 30,
                          color: Color.fromARGB(255, 211, 14, 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        // print(widget.index);
                        if (widget.resepMenu.saved) {
                          var menu = ResepMenu(
                            name: widget.resepMenu.name,
                            star: widget.resepMenu.star,
                            time: widget.resepMenu.time,
                            category: widget.resepMenu.category,
                            author: widget.resepMenu.author,
                            servings: widget.resepMenu.servings,
                            ingredients: widget.resepMenu.ingredients,
                            instructions: widget.resepMenu.instructions,
                            imageAsset: widget.resepMenu.imageAsset,
                            saved: !widget.resepMenu.saved,
                          );
                          manager.deleteResep(widget.index, menu);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Delete from Collections"),
                            ),
                          );
                        } else {
                          var menu = ResepMenu(
                            name: widget.resepMenu.name,
                            star: widget.resepMenu.star,
                            time: widget.resepMenu.time,
                            category: widget.resepMenu.category,
                            author: widget.resepMenu.author,
                            servings: widget.resepMenu.servings,
                            ingredients: widget.resepMenu.ingredients,
                            instructions: widget.resepMenu.instructions,
                            imageAsset: widget.resepMenu.imageAsset,
                            saved: !widget.resepMenu.saved,
                          );
                          widget.onCreate(menu);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Add to Collections"),
                            ),
                          );
                        }
                        setState(() {
                          widget.resepMenu.saved = !widget.resepMenu.saved;
                        });
                      },
                      child: widget.resepMenu.saved
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
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          children: [
                            Image.asset(
                              widget.resepMenu.imageAsset,
                              fit: BoxFit.cover,
                              height: 300,
                              width: double.infinity,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                ),
                                Text(widget.resepMenu.star + "  "),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person_pin_circle_outlined,
                              size: 22,
                              color: Color.fromRGBO(251, 192, 45, 1),
                            ),
                            Text(" Author : " + widget.resepMenu.author),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.alarm,
                              size: 20,
                              color: Color.fromRGBO(251, 192, 45, 1),
                            ),
                            Text(" Cocking Time : " + widget.resepMenu.time),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.fastfood_sharp,
                              size: 18,
                              color: Color.fromRGBO(251, 192, 45, 1),
                            ),
                            Text(" Servings : " + widget.resepMenu.servings),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.saved_search,
                              size: 20,
                              color: Color.fromRGBO(251, 192, 45, 1),
                            ),
                            Text(" Category : " + widget.resepMenu.category),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: 30,
                                child: TabBar(
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor:
                                      Color.fromARGB(255, 211, 14, 14),
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  tabs: [
                                    Tab(
                                      text: 'Bahan-bahan',
                                    ),
                                    Tab(
                                      text: 'Cara membuat',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 211,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          height: 210,
                                          child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              final String item = widget
                                                  .resepMenu.ingredients[index];
                                              // return Text("- " + item);
                                              return Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    '- ',
                                                  ),
                                                  Expanded(
                                                    child: Text(item),
                                                  ),
                                                ],
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return const SizedBox(
                                                height: 8,
                                              );
                                            },
                                            itemCount: widget
                                                .resepMenu.ingredients.length,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      height: 210,
                                      child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          final String item = widget
                                              .resepMenu.instructions[index];
                                          // return Text('${index + 1}. ' + item);
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${index + 1}. ',
                                              ),
                                              Expanded(
                                                child: Text(item),
                                              ),
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 8,
                                          );
                                        },
                                        itemCount: widget
                                            .resepMenu.instructions.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
