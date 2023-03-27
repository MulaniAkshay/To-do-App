import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller.namecontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter new text",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "required";
                    } else if (controller.addName
                        .contains(controller.namecontroller.text)) {
                      return "Already included ";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.namecontroller.text.isNotEmpty &&
                      !controller.addName
                          .contains(controller.namecontroller.text)) {
                    controller.addName.add(controller.namecontroller.text);
                  }

                  debugPrint(controller.addName.toString());
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    minimumSize: const Size(120, 40)),
                child: const Text("Add Task"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                height: 2,
              ),
              SizedBox(
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: Obx(
                  () {
                    return controller.addName.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.addName.length,
                            itemBuilder: (context, index) {
                              return Obx(() => ListTile(
                                    leading: Checkbox(
                                      onChanged: (value) {
                                        controller.selectName.contains(
                                                controller.addName[index])
                                            ? controller.selectName.remove(
                                                controller.addName[index])
                                            : controller.selectName
                                                .add(controller.addName[index]);
                                        debugPrint(
                                            controller.selectName.toString());
                                      },
                                      value: controller.selectName
                                          .contains(controller.addName[index]),
                                    ),
                                    title: Text(
                                      controller.addName[index],
                                      style: controller.selectName.contains(
                                              controller.addName[index])
                                          ? const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            )
                                          : const TextStyle(
                                              decoration: TextDecoration.none,
                                            ),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        controller.addName.removeAt(index);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ));
                            },
                          )
                        : Container(
                            child: const Center(child: Text("No Task")),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
