import 'package:flutter/material.dart';
import 'package:project_trading/common/components/toast.dart';
import 'package:project_trading/common/sizes.dart';

List<String> months = [
  "Diciembre",
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octubre",
  "Noviembre",
  "Diciembre"
];

List<String> weekdays = [
  "Domingo",
  "Lunes",
  "Martes",
  "Miércoles",
  "Jueves",
  "Viernes",
  "Sábado",
  "Domingo"
];

int currentYear = 2022;
int currentMonth = 12;
DateTime date1 = DateTime(currentYear, currentMonth, 22);
DateTime date2 = DateTime(currentYear, currentMonth, 28);

bool updateFirst = true;

void oneMonthForward() {
  currentMonth++;
  if (currentMonth >= 13) {
    currentMonth = 1;
    currentYear++;
  }
  myList = getIntegersListForMonth(currentMonth, currentYear);
}

void oneMonthBacward() {
  print(currentMonth);
  currentMonth--;
  print("NOW: $currentMonth");
  if (currentMonth <= 0) {
    currentMonth = 12;
    currentYear--;
  }
  myList = getIntegersListForMonth(currentMonth, currentYear);
}

DateTime getFirstSundayOfAMonth(int month, int year) {
  DateTime firstDay = DateTime(year, month, 1);
  bool isSunday = firstDay.weekday == DateTime.sunday;
  while (isSunday == false) {
    firstDay = firstDay.add(const Duration(days: 1));
    if (firstDay.weekday == DateTime.sunday) {
      isSunday = true;
    }
  }
  return firstDay;
}

List<DateTime> getIntegersListForMonth(int month, int year) {
  List<DateTime> result = [];
  DateTime initialDate = getFirstSundayOfAMonth(month, year);
  List<int> range = List.generate(35, (index) => index);
  for (int i in range) {
    result.add(initialDate);
    initialDate = initialDate.add(const Duration(days: 1));
  }
  return result;
}

List<String> myTitles = ["DOM", "LUN", "MAR", "MIE", "JUE", "VIE", "SAB"];
List<DateTime> myList = getIntegersListForMonth(currentMonth, currentYear);

Widget calendar(VoidCallback update, {bool small = false}) {
  double side = small ? (0.6 * Sizes.width) : (Sizes.width - 2 * Sizes.padding);
  return Container(
      width: side,
      height: side ,
      padding: EdgeInsets.all(Sizes.padding / 4),
      decoration: BoxDecoration(
          color: const Color(0xff0D3B79),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.radius))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Sizes.boxSeparation / 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    oneMonthBacward();
                    update();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${months[currentMonth%13]} $currentYear",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.font08,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () {
                      oneMonthForward();
                      update();
                    },
                    child: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white)),
              ],
            ),
          ),
          SizedBox(
            height: Sizes.boxSeparation,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                myTitles.map((e) => titleBullet(e, small: small)).toList(),
          ),
          Wrap(
            children: myList.map((e) => dateBullet(e,update, small: small)).toList(),
          ),
        ],
      ));
}

Widget titleBullet(String title, {bool small = false}) {
  double parentSide =
      small ? (0.6 * Sizes.width) : (Sizes.width - 2 * Sizes.padding);
  double childSide = (parentSide - Sizes.padding / 2) / 7 - 1;
  return SizedBox(
    width: childSide,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: Sizes.font16),
    ),
  );
}

Widget dateBullet(DateTime thisDate, VoidCallback update, {bool small = false}) {
  double parentSide =
      small ? (0.6 * Sizes.width) : (Sizes.width - 2 * Sizes.padding);
  double childSide = (parentSide - Sizes.padding / 2) / 7 - 1;
  Color backgroundColor = Colors.transparent;
  if (thisDate == date1) {
    backgroundColor = const Color(0xffB1D4F2);
  }
  if (thisDate == date2) {
    backgroundColor = const Color(0xff74CF6F);
  }
  return GestureDetector(
    onTap: () {
      if (updateFirst) {
        if(thisDate.compareTo(date2)>0){
          showToast("La fecha de salida no puede ser posterior a la fecha de entrada");
          return;
        }
        date1 = thisDate;
        updateFirst = false;
      } else {
        if(thisDate.compareTo(date1)<0){
          showToast("La fecha de entrada no puede ser anterior a la fecha de salida");
          return;
        }
        date2 = thisDate;
        updateFirst = true;
      }
      update();
    },
    child: Container(
      width: childSide,
      height: childSide,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(childSide / 2))),
      child: Text(
        thisDate.day.toString(),
        style: TextStyle(color: Colors.white, fontSize: Sizes.font10),
      ),
    ),
  );
}
