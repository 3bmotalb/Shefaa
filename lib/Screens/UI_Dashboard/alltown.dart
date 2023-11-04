import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Model/Home/Address/addresscontroller.dart';
import 'package:graduation_project/Screens/UI_Dashboard/allcities.dart';
import 'package:graduation_project/themes.dart';

class Alltown extends StatefulWidget {
  const Alltown({Key? key}) : super(key: key);

  @override
  State<Alltown> createState() => _AlltownState();
}

addcontroller controller = Get.put(addcontroller());
List items = [];
List cities = [];

class _AlltownState extends State<Alltown> {
  readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/places.json');
    final data = await json.decode(response);

    setState(() {
      items = data["governorates"];
      cities = data['cities'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text("_AllTown".tr),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: items.isNotEmpty
              ? ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .9,
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text(items[index]['namecat'.tr]),
                          onTap: () async {
                            var temp = await getcitiesingov(items[index]['id']);
                            Get.to(Allcities(cities: temp));
                          },
                          leading: IconButton(
                              icon: const Icon(Icons.location_city),
                              onPressed: () {}),
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator())),
    );
  }

  Future<List> getcitiesingov(int id) async {
    List citiesingov = [];

    for (int i = 0; i < cities.length; i++) {
      if (cities[i]['gov_id'] == id) {
        citiesingov.add(cities[i]);
      }
    }
    print('/////////////////////citie////////////');
    return citiesingov;
  }
}
