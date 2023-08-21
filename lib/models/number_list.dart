class NumberList {
  List<String> list = ["", "", "", "", "", "", ""];

  NumberList({
    required this.list,
  });

  List<String> get luckyNumber {
    List<String> luckyNumbers =
        list.getRange(list.length - 2, list.length).toList();
    return luckyNumbers;
  }

  List<String> get normalList {
    List<String> normalList = list.getRange(0, list.length - 2).toList();
    return normalList;
  }

  int addNormalList(String value) {
    bool isExist = normalList.contains(value);
    if (!isExist) {
      int firstEmpty = list.indexWhere((element) => element == "");
      if (firstEmpty > -1) {
        list[firstEmpty] = value;
      }
      return firstEmpty;
    } else {
      return -1;
    }
  }

  int addLuckyNumber(String value) {
    bool isExist = luckyNumber.contains(value);
    if (!isExist) {
      int firstEmpty = list.indexWhere((element) => element == "");
      if (firstEmpty > -1) {
        list[firstEmpty] = value;
      }
      return firstEmpty;
    } else {
      return -1;
    }
  }

  void clear() {
    list = ["", "", "", "", "", "", ""];
  }

  void randomize() {
    var normalNumberList = [...normalList];
    var luckyNumberList = [...luckyNumber];

    normalNumberList.shuffle();
    luckyNumberList.shuffle();

    list = [...normalNumberList, ...luckyNumberList];
  }
}
