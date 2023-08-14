class NumberList {
  final List<String> list;

  NumberList({
    required this.list,
  });

  List<String> get luckyNumber {
    List<String> luckyNumbers =
        list.getRange(list.length - 3, list.length).toList();
    return luckyNumbers;
  }

  List<String> get normalList {
    List<String> normalList = list.getRange(0, list.length - 3).toList();
    return normalList;
  }
}
