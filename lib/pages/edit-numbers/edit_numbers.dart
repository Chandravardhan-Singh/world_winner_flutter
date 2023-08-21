import 'package:flutter/material.dart';
import 'package:world_winner_flutter/models/number_list.dart';
import 'package:world_winner_flutter/pages/edit-numbers/widget/select_numbers_card.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/coupon_counter.dart';
import 'package:world_winner_flutter/widget/custom_drawer.dart';
import 'package:world_winner_flutter/widget/ticket/winning_number_ball.dart';

class EditNumbers extends StatefulWidget {
  const EditNumbers({super.key});

  @override
  State<EditNumbers> createState() => _EditNumbersState();
}

class _EditNumbersState extends State<EditNumbers> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  NumberList list = NumberList(list: ["", "", "", "", "", "", ""]);
  bool isLuckyNumber = false;

  void updateList(String value) {
    if (!isNotValid) {
      //list is full
      return;
    }
    if (isLuckyNumber) {
      setState(() {
        int firstEmpty = list.addLuckyNumber(value);
        print(firstEmpty);
        isLuckyNumber = firstEmpty >= 4;
      });
    } else {
      setState(() {
        int firstEmpty = list.addNormalList(value);
        print(firstEmpty);
        isLuckyNumber = firstEmpty >= 4;
      });
    }
  }

  void clearAll() {
    setState(() {
      list.clear();
      isLuckyNumber = false;
    });
  }

  void randomize() {
    setState(() {
      list.randomize();
    });
  }

  get isNotValid {
    return list.list.any((element) => element == "");
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    print('isValid $isNotValid');
    print(list);
    int listCount = isLuckyNumber ? 12 : 50;
    BallTypes filledBallType =
        isLuckyNumber ? BallTypes.lucky : BallTypes.normal;
    List<String> checkWithList =
        isLuckyNumber ? list.luckyNumber : list.normalList;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: 70,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset(
            'assets/images/drawer-icon.png',
          ),
        ),
        centerTitle: false,
        title: const Text('Setup Autoplay'),
        elevation: 0,
        backgroundColor: themeColor.secondary,
        actions: const [
          CouponCounter(),
        ],
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                SelectNumbersCard(
                  numbers: list,
                  clearAll: clearAll,
                  randomize: randomize,
                ),
                const SizedBox(height: 24),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  runSpacing: 20.0,
                  spacing: 12.0,
                  children: List.generate(
                    listCount,
                    (index) => (index + 1).toString(),
                    growable: false,
                  )
                      .map(
                        (e) => WinningNumberBall(
                          number: e,
                          type: checkWithList.contains(e)
                              ? filledBallType
                              : BallTypes.empty,
                          onTap: () {
                            updateList(e);
                          },
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            Positioned(
              bottom: 40,
              child: Button(
                type: isNotValid ? ButtonType.disable : ButtonType.contained,
                text: "Done",
                onPressed: () {
                  Navigator.of(context).pop();
                },
                textColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
