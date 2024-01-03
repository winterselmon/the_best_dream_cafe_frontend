import 'package:best_dream_cafe_frontend/mock_data.dart';
import 'package:best_dream_cafe_frontend/services/api/model/menu_item_model.dart';
import 'package:best_dream_cafe_frontend/services/dialog_services.dart';
import 'package:best_dream_cafe_frontend/utils/function_widgets.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  static const routeName = '/start';

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late double height;
  late double width;
  bool isAddItem = false;
  String defaultMenu = 'เพิ่มเมนู';
  String menuName = '-', sweetLevel = '-', roastLevel = '-', specialty = '-';
  MenuType menuType = MenuType.empty;
  OrderDetailModel orderDetailModel = OrderDetailModel();
  List<OrderDetailModel> menuItemList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuName = defaultMenu;
  }

  @override
  Widget build(BuildContext context) {
    height = screenHeight(context);
    width = screenWidth(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, 55),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 4,
            title: const Text(
              'The Best Dream Cafe',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              addVerticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: InkWell(
                          onTap: () {
                            isAddItem = true;

                            setState(() {});
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/img_add.png',
                                width: 14,
                                height: 14,
                              ),
                              addHorizontalSpace(10),
                              const Text(
                                'เพิ่ม',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )),
                    addHorizontalSpace(10.0),
                  ],
                ),
              ),
              addVerticalSpace(10),
              if (isAddItem)
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: width,
                    color: Colors.grey[400],
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            isAddItem = false;
                            setState(() {});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/img_cancel.png',
                                width: 26,
                                height: 26,
                              )
                            ],
                          ),
                        ),
                        addVerticalSpace(20),
                        Row(
                          children: [
                            const Expanded(flex: 1, child: Text('เมนู : ')),
                            Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () {
                                  DialogService.selectMenuDialog(
                                    context,
                                    (callback) {
                                      menuName = callback.title.toString();
                                      menuType = callback.type!;

                                      roastLevel = '-';
                                      sweetLevel = '-';
                                      specialty = '-';

                                      setState(() {});
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                  ),
                                  child: Text(menuName),
                                ),
                              ),
                            )
                          ],
                        ),
                        addVerticalSpace(10.0),
                        menuType == MenuType.coffee
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                          flex: 1, child: Text('ระดับคั่ว : ')),
                                      Expanded(
                                        flex: 3,
                                        child: InkWell(
                                          onTap: () {
                                            DialogService
                                                .selectRoastLevelDialog(
                                              context,
                                              (callback) {
                                                roastLevel = callback;
                                                setState(() {});
                                              },
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 6),
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 1),
                                            ),
                                            child: Text(roastLevel),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  addVerticalSpace(10.0),
                                ],
                              )
                            : Container(),
                        menuType == MenuType.coffee
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                          flex: 1,
                                          child: Text('เมล็ดพิเศษ : ')),
                                      Expanded(
                                        flex: 3,
                                        child: InkWell(
                                          onTap: () {
                                            DialogService.selectSpecialtyDialog(
                                              context,
                                              (callback) {
                                                specialty = callback;
                                                setState(() {});
                                              },
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 6),
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 1),
                                            ),
                                            child: Text(specialty),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  addVerticalSpace(10.0),
                                ],
                              )
                            : Container(),
                        Row(
                          children: [
                            const Expanded(
                                flex: 1, child: Text('ระดับความหวาน : ')),
                            Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () {
                                  DialogService.selectSweetLevelDialog(
                                    context,
                                    (callback) {
                                      sweetLevel = callback;
                                      setState(() {});
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                  ),
                                  child: Text(sweetLevel),
                                ),
                              ),
                            )
                          ],
                        ),
                        addVerticalSpace(30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 8),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16))),
                                child: InkWell(
                                  onTap: () {
                                    if (menuName.isNotEmpty &&
                                        menuName != defaultMenu &&
                                        sweetLevel.isNotEmpty &&
                                        sweetLevel != '-') {
                                      isAddItem = false;

                                      orderDetailModel = OrderDetailModel(
                                          name: menuName,
                                          sweetLevel: sweetLevel);

                                      menuItemList.add(orderDetailModel);

                                      menuName = '-';
                                      sweetLevel = '-';
                                      specialty = '-';
                                      roastLevel = '-';

                                      setState(() {});
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/img_save.png',
                                        width: 14,
                                        height: 14,
                                      ),
                                      addHorizontalSpace(10),
                                      const Text(
                                        'บันทึก',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        addVerticalSpace(30.0),
                      ],
                    ),
                  ),
                )
              else
                Container(),
              addVerticalSpace(15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'รายการ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  addVerticalSpace(20.0),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(menuItemList[index].name.toString()),
                                addHorizontalSpace(10.0),
                                Text(menuItemList[index].sweetLevel.toString()),
                              ],
                            ),
                            addVerticalSpace(5.0),
                            Container(
                              height: 1,
                              width: width,
                              color: Colors.black,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: menuItemList.length,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
