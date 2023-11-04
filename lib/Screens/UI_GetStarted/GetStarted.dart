import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Screens/UI_Home/Drawer.dart';
import 'package:graduation_project/Screens/UI_Home/MainScreen.dart';
import 'package:graduation_project/themes.dart';

import '../../Model/GetStarted/GetStarted.dart';




class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: startModel.length,
            itemBuilder: (context, int index) {
              return startModel[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List<Widget>.generate(startModel.length, (int index) {
                    return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? const Color(0xFF002536)
                                : const Color(0xFF002536).withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (startModel.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: const Color(0xFF002536),
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (startModel.length - 1))
                      ? FittedBox(
                          child: InkWell(
                            onTap: () {
                              Get.off(drawer(const MainHome()));
                            },
                            child: Text(
                              "_startNow".tr,
                              style: const TextStyle(
                                color: white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      : const Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Biege,
                        ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}

