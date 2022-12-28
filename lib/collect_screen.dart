import 'package:flutter/material.dart';
import 'package:project_akhir/collect_list_screen.dart';
import 'package:project_akhir/provider/resep_provider.dart';
import 'package:provider/provider.dart';

class CollectScreen extends StatelessWidget {
  final ResepProvider manager;
  const CollectScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
          child: SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Collections",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 211, 14, 14),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 620,
          child: collect(),
        ),
      ],
    );
  }

  Widget collect() {
    return Consumer<ResepProvider>(
      builder: (context, value, child) {
        if (value.resep.isNotEmpty) {
          return CollectListScreen(
            provider: value,
            onCreate: (resep) {
              manager.addResep(resep);
            },
          );
        } else {
          return const Center(
            child: Text("Add your Collections!"),
          );
        }
      },
    );
  }
}
