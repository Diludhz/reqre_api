import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqre_api/controller/datacontroller.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Api integration "),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        actions: const [Icon(Icons.people)],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Obx(() {
          var data = controller.datamodel.value;
          return controller.loading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.yellow),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Page No:${data.page.toString()}"),
                      const SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.grey),
                        height: 390,
                        width: 300,
                        child: GridView.builder(
                          itemCount: data.users?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text("ID:${data.users![index].id ?? ""}"),
                                const SizedBox(height: 10),
                                Text("Name:${data.users![index].name ?? ""}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "Year:${data.users![index].year.toString()}"),
                              ],
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Next Page>",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ))
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
