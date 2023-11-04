// ignore_for_file: implementation_imports, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/themes.dart';

import '../UI_Medicine/home_page.dart';

class Allcities extends StatelessWidget {
  List cities;
  Allcities({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text("_AllCities".tr),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: cities.isNotEmpty
              ? ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                        width: MediaQuery.of(context).size.width * .9,
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(cities[index]['namecat'.tr]),
                            onTap: () {},
                            leading: const Icon(Icons.location_city),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator())),
    );
  }
}
