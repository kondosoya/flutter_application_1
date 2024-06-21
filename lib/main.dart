import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  //mate => scaf => wige(body：真の構造)：全体の構造
  const MyApp2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '実践演習アプリ', home: MyHome()); //classに移行してコードをきれいにする
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  _MyHomeState createState() {
    //型の型,「_」外に出ても参照されない.
    return _MyHomeState();
  }
}

class _MyHomeState extends State<MyHome> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //足場
        appBar: AppBar(title: Text('実践演習アプリ')), //多構造,()structure

        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                count = 0;
              });
            },
            child: Icon(Icons.wb_iridescent_sharp)), //引数が必要,onClicked的な

        body: Column(
          //縦方向
          children: [
            Text("$count", style: TextStyle(fontSize: 80)),
            Row(
              //binの内容を表示
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BinDigit(value: count, digit: 7),
                BinDigit(value: count, digit: 6),
                BinDigit(value: count, digit: 5),
                BinDigit(value: count, digit: 4),
                BinDigit(value: count, digit: 3),
                BinDigit(value: count, digit: 2),
                BinDigit(value: count, digit: 1),
                BinDigit(value: count, digit: 0),
              ],
            ),
            Row(
              //横方向
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                      //count++では増えない,ブレークポイントで確認,rebuildが必要なときはそれを知らせる．
                    },
                    child: Icon(Icons.plus_one)), //「,」がいる．=>リストだから

                ElevatedButton(
                    onPressed: () {
                      setState(() => count--); //省略した形
                    },
                    child: Icon(Icons.exposure_minus_1)),
              ],
            )
          ],
        ));
  }
}

//binaryはstatefulの下にあるのでstatelessでいい．

class BinDigit extends StatelessWidget {
  final int value;
  final int digit;
  const BinDigit(
      {super.key,
      required this.value,
      required this.digit}); //requiredこれなしでは渡せない,「this.」これでシンプル

  @override
  Widget build(BuildContext context) {
    return Text((value & (1 << digit) != 0) ? "1" : "0",
        style: TextStyle(fontSize: 24));
    //return Text("$value");
  }
}

// if (value & (1 << digit) != 0) {
//       return Text("1");
//     } else {
//       return Text("0");
//     }
