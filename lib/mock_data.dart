enum MenuType {
  empty,
  coffee,
  tea,
  fruitTea,
  matcha,
  soda,
  milk,
}

class Menu {
  final String? title;
  final MenuType? type;

  Menu({this.title, this.type});
}

List<Menu> demoMenu = [
  Menu(
    title: "เอสเปรสโซ",
    type: MenuType.coffee,
  ),
  Menu(
    title: "มอคค่า",
    type: MenuType.coffee,
  ),
  Menu(
    title: "ลาเต้",
    type: MenuType.coffee,
  ),
  Menu(
    title: "คาปูชิโน่",
    type: MenuType.coffee,
  ),
  Menu(
    title: "ชาไทย",
    type: MenuType.tea,
  ),
  Menu(
    title: "ชาเขียว",
    type: MenuType.tea,
  ),
  Menu(
    title: "เอสเปรสโซ",
    type: MenuType.coffee,
  ),
  Menu(
    title: "มอคค่า",
    type: MenuType.coffee,
  ),
  Menu(
    title: "ลาเต้",
    type: MenuType.coffee,
  ),
  Menu(
    title: "คาปูชิโน่",
    type: MenuType.coffee,
  ),
  Menu(
    title: "ชาไทย",
    type: MenuType.tea,
  ),
  Menu(
    title: "ชาเขียว",
    type: MenuType.tea,
  ),
];

List<String> sweetLevel = [
  '125%',
  '100%',
  '75%',
  '50%',
  '25%',
  '10%',
  '0%',
];

List<String> roastLevel = [
  'คั่วเข้ม',
  'คั่วกลางค่อนเข้ม',
  'คั่วกลาง',
  'คั่วอ่อนค่อนกลาง',
  'คั่วอ่อน',
];

List<String> specialty = [
  'ปางขอน',
  'บลาซิล',
  'เชียงใหม่',
  'เชียงราย',
  'น่าน',
];
