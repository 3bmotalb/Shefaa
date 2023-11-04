import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctormodel.dart';
import 'package:graduation_project/DB/Models/M_nurse/nurse_model.dart';
import 'package:graduation_project/Screens/UI_User_Service/screens/nurse_details.dart';

class favnurses extends StatelessWidget {
  RxList<NurseModel> favlist;

  favnurses({Key? key, required this.favlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favlist.isNotEmpty
          ? ListView.builder(
              itemCount: favlist.length,
              itemBuilder: (context, index) {
                NurseModel nurse = favlist[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(nursedata(
                      nurse: nurse,
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(nurse.image!),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      nurse.full_name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '_Nurse'.tr,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "No Favorite Yet",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}

class favdoctors extends StatelessWidget {
  RxList<DoctorModel> favlist;

  favdoctors({Key? key, required this.favlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favlist.isNotEmpty
          ? ListView.builder(
              itemCount: favlist.length,
              itemBuilder: (context, index) {
                DoctorModel doctor = favlist[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(doctor.image!),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      doctor.full_name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '_doctor'.tr,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "No Favorite Yet",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
