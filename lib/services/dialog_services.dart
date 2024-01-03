import 'package:best_dream_cafe_frontend/mock_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogService {
  DialogService._();

  static selectMenuDialog(BuildContext context, Function(Menu) callback) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.cancel_outlined)),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                      ),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              callback(Menu(
                                title: demoMenu[index].title,
                                type: demoMenu[index].type,
                              ));
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                demoMenu[index].title.toString(),
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 4,
                        ),
                        itemCount: demoMenu.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static selectSpecialtyDialog(
      BuildContext context, Function(String) callback) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.cancel_outlined)),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                      ),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              callback(specialty[index]);
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                specialty[index],
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 4,
                        ),
                        itemCount: specialty.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static selectRoastLevelDialog(
      BuildContext context, Function(String) callback) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.65,
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 14.0),
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10.0,
                            ),
                          ),
                        ),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                callback(roastLevel[index]);
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    roastLevel[index],
                                    style: const TextStyle(fontSize: 14.0),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 4,
                          ),
                          itemCount: roastLevel.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  static selectSweetLevelDialog(
      BuildContext context, Function(String) callback) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.65,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  callback(sweetLevel[index]);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      sweetLevel[index],
                                      style: const TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 4,
                            ),
                            itemCount: sweetLevel.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
