import 'package:flutter/material.dart';
import 'package:project_akhir/model/list_menu.dart';
import 'package:project_akhir/detail_screen.dart';
import 'package:project_akhir/provider/resep_provider.dart';
import 'package:provider/provider.dart';

class Utama extends StatelessWidget {
  final List<ResepMenu> resepMenu;
  final String name;
  const Utama({
    Key? key,
    required this.resepMenu,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResepProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.yellow.shade700,
      ),
      body: SingleChildScrollView(
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
                      Column(
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
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(
                                Icons.alarm,
                                size: 18,
                              ),
                              Text(item.time),
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
      ),
    );
  }
}
