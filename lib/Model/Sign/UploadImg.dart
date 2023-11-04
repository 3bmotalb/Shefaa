import 'package:flutter/material.dart';

class UploadImg extends StatelessWidget {
  const UploadImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: imageProfile(function: () {}),
    )
        // SizedBox(
        //   width: MediaQuery.of(context).size.width*.4,
        //   height: MediaQuery.of(context).size.height * 0.2,
        //   child: Stack(
        //     children: [
        //       const CircleAvatar(backgroundImage: AssetImage("assets/images/person.png"),),
        //       Container(
        //         alignment: Alignment.bottomRight,
        //           child: IconButton(icon: const Icon(Icons.camera_alt),onPressed: (){},)),
        //     ],
        //   ),
        // ),
        );
  }

  Widget imageProfile({Function? function}) {
    return Center(
      child: Stack(children: <Widget>[
        const CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.white70,
            backgroundImage:  AssetImage("assets/images/person.jpg")),
        Positioned(
          bottom: 17.0,
          right: 10.0,
          child: InkWell(
            onTap: () {
              function;
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white54,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }
}
