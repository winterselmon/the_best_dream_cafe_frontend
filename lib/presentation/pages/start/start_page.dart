import 'package:best_dream_cafe_frontend/mock_data.dart';
import 'package:best_dream_cafe_frontend/services/api/model/menu_item_model.dart';
import 'package:best_dream_cafe_frontend/services/dialog_services.dart';
import 'package:best_dream_cafe_frontend/utils/function_widgets.dart';
import 'package:best_dream_cafe_frontend/utils/keyboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  static const routeName = '/start';

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late double height;
  late double width;
  double heightDetailContent = 40.0;
  bool isAddItem = false, isRemove = false;
  String defaultMenu = 'เพิ่มเมนู';
  String menuName = '-', sweetLevel = '-', roastLevel = '-', specialty = '-';
  int defaultPrice = 0;
  MenuType menuType = MenuType.empty;
  OrderDetailModel orderDetailModel = OrderDetailModel();
  List<OrderDetailModel> menuItemList = [];
  final TextEditingController _priceController = TextEditingController();

  TextStyle listTitleStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w200,
  );

  @override
  void initState() {
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
                    InkWell(
                      onTap: () {
                        isAddItem = true;

                        closeKeyboard();

                        setState(() {});
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16))),
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
                          )),
                    ),
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
                                      defaultPrice = callback.defaultPrice!;

                                      roastLevel = '-';
                                      sweetLevel = '-';
                                      specialty = '-';
                                      _priceController.text =
                                          defaultPrice.toString();

                                      closeKeyboard();

                                      setState(() {});
                                    },
                                  );
                                },
                                child: Container(
                                  height: heightDetailContent,
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
                                            height: heightDetailContent,
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
                                            height: heightDetailContent,
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
                                  height: heightDetailContent,
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
                        addVerticalSpace(10.0),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text('ราคา : '),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: heightDetailContent,
                                // padding: const EdgeInsets.symmetric(
                                //     horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                ),
                                child: TextFormField(
                                  controller: _priceController,
                                  textInputAction: TextInputAction.done,
                                  maxLength: 4,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onFieldSubmitted: (value) {
                                    closeKeyboard();
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                    counterText: '',
                                    hintText: 'ราคา',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                  ),
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
                                        sweetLevel: sweetLevel,
                                        specialty: menuType == MenuType.coffee
                                            ? specialty
                                            : '',
                                        roastLevel: menuType == MenuType.coffee
                                            ? roastLevel
                                            : '',
                                        price: _priceController.text,
                                      );

                                      menuItemList.add(orderDetailModel);

                                      menuName = '-';
                                      sweetLevel = '-';
                                      specialty = '-';
                                      roastLevel = '-';
                                      _priceController.clear();
                                      menuType = MenuType.empty;

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
                    style: TextStyle(fontSize: 18.0),
                  ),
                  addVerticalSpace(16.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        menuItemList.isNotEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      isRemove = !isRemove;
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 8),
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16))),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/img_remove.png',
                                            width: 14,
                                            height: 14,
                                          ),
                                          addHorizontalSpace(10),
                                          const Text(
                                            'ลบรายการ',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  addVerticalSpace(16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'เมนู',
                            style: listTitleStyle,
                          ),
                        ),
                        addHorizontalSpace(10.0),
                        Expanded(
                          child: Text(
                            'ระดับความหวาน',
                            style: listTitleStyle,
                          ),
                        ),
                        addHorizontalSpace(10.0),
                        Expanded(
                          child: Text(
                            'เมล็ดพิเศษ',
                            style: listTitleStyle,
                          ),
                        ),
                        addHorizontalSpace(10.0),
                        Expanded(
                          child: Text(
                            'ระดับคั่ว',
                            style: listTitleStyle,
                          ),
                        ),
                        addHorizontalSpace(10.0),
                        Expanded(
                          child: Text(
                            'ราคา',
                            style: listTitleStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(10.0),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          if (index == 0) ...[
                            addVerticalSpace(5.0),
                            Container(
                              height: 1,
                              width: width,
                              color: Colors.black,
                            ),
                            addVerticalSpace(5.0),
                          ],
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  menuItemList[index].name.toString(),
                                ),
                              ),
                              addHorizontalSpace(10.0),
                              Expanded(
                                child: Text(
                                  menuItemList[index].sweetLevel.toString(),
                                ),
                              ),
                              addHorizontalSpace(10.0),
                              Expanded(
                                child: Text(
                                  menuItemList[index].specialty.toString(),
                                ),
                              ),
                              addHorizontalSpace(10.0),
                              Expanded(
                                child: Text(
                                  menuItemList[index].roastLevel.toString(),
                                ),
                              ),
                              addHorizontalSpace(10.0),
                              Expanded(
                                child: Text(
                                  menuItemList[index].price.toString(),
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(6.0),
                          Container(
                            height: 1,
                            width: width,
                            color: Colors.black,
                          )
                        ],
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
