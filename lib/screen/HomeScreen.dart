import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  DateTime firstDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      )
    );
  }
  void onHeartPressed(){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context){
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white.withOpacity(0.95),
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    firstDay = date;
                  });
                },
              ),
            ),
          );
        },
      barrierDismissible: true,
    );
    
    setState((){
      firstDay = firstDay.subtract(Duration(days: 1));
    });
  }
}


class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({
    required this.onHeartPressed,
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        SizedBox(height: 80.0), // 위에 60만큼 빈칸 띄우기
        const SizedBox(height: 15.0),
        Text(
          '너랑 내가',
          style: textTheme.headline1,
        ),
        const SizedBox(height: 10.0),
        Text(
          '처음 만난 날',
          style: textTheme.headline2,
        ),
        const SizedBox(height: 15.0),
        Text(
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyText1,
        ),
        const SizedBox(height: 15.0),
        IconButton(
            iconSize: 55.0,
            onPressed: onHeartPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
        ),
        const SizedBox(height: 15.0),
        Text(
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.headline2,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'asset/img/—Pngtree—cartoon couple_42348.png',
        height: MediaQuery.of(context).size.height/2,
      ),
    );
  }
}