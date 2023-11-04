import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/DB/Models/M_doctor/doctorcontroller.dart';
import 'package:graduation_project/DB/Models/M_user/user.dart';
import 'package:graduation_project/Screens/UI_Doctor_Services/HomePage_Doctor.dart';
import '../../themes.dart';

class Updateprofile_D extends StatefulWidget {
  const Updateprofile_D({Key? key, UserModel? store}) : super(key: key);

  @override
  State<Updateprofile_D> createState() => _Updateprofile_DState();
}

final doctorcontroller = Get.put(DoctorController());

class _Updateprofile_DState extends State<Updateprofile_D> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          '_Updateprofile'.tr,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[500],
              ),
              child: Column(children: <Widget>[
                Image.asset(
                  "assets/image2.png",
                  height: 70,
                  width: 70,
                ),
                Column(children: const [
                  Text("mohamed magdy",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    "Doctor",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ]),
              ]),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Name",
                  labelStyle: const TextStyle(fontSize: 20),
                  hintText: "Enter Name",
                  hintStyle: const TextStyle(fontSize: 16),
                  icon: const Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Title",
                  labelStyle: const TextStyle(fontSize: 20),
                  hintText: "Enter Title",
                  hintStyle: const TextStyle(fontSize: 16),
                  icon: const Icon(Icons.location_on),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Phone",
                  labelStyle: const TextStyle(fontSize: 20),
                  hintText: "Enter Phone",
                  hintStyle: const TextStyle(fontSize: 16),
                  icon: const Icon(Icons.phone),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Email",
                  labelStyle: const TextStyle(fontSize: 20),
                  hintText: "Enter Email",
                  hintStyle: const TextStyle(fontSize: 16),
                  icon: const Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "WORK",
                  labelStyle: const TextStyle(fontSize: 20),
                  hintText: "Enter Work",
                  hintStyle: const TextStyle(fontSize: 16),
                  icon: const Icon(Icons.work_outline_outlined),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () => {Get.to(HomePage2_d())},
                child: const Text("Save Changes"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
