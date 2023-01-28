// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:spin_wheel/View/HomeScreen/widgets/textFiledWidgets.dart';
import '../../utilities/spiningWheeldata.dart';
import '../../viewModel/firebaseFuntaion.dart';
import '../../viewModel/randomNumberget.dart';

class SpinWheel extends StatefulWidget {
  const SpinWheel({super.key});

  @override
  _SpinWheelState createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final _selected = StreamController<int>.broadcast();
  @override
  void initState() {
    randm();
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _phonecontroller.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  String? mark;



  final _namecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  bool _namevalidate = false;
  bool _emailvalidate = false;
  bool _phonevalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(76, 0, 211, 1),
        toolbarHeight: 11,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color.fromRGBO(76, 0, 211, 1),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "SPIN TO WIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Icon(
                          Icons.circle_sharp,
                          color: Colors.green,
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Do You Want 30% OFF, 20% OFF,15% OFF and 10% OFF",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    child: FortuneWheel(
                      animateFirst: false,
                      items: [
                        for (var item in items) FortuneItem(child: Text(item))
                      ],
                      selected: _selected.stream,
                    )),
              ),
        textFileds(namecontroller: _namecontroller, namevalidate: _namevalidate, phonecontroller: _phonecontroller, phonevalidate: _phonevalidate, emailcontroller: _emailcontroller, emailvalidate: _emailvalidate),
              const SizedBox(
                height: 35,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(76, 0, 211, 1),
                      ),
                      onPressed: () {
                        setState(() {
                          _namecontroller.text.isEmpty ? _namevalidate = true : _namevalidate = false;
                          _emailcontroller.text.isEmpty ? _emailvalidate = true : _emailvalidate = false;
                          _phonecontroller.text.isEmpty ? _phonevalidate = true : _phonevalidate = false;
                        });
                      if(_namevalidate== false && _emailvalidate == false && _phonevalidate == false) { // printSelectedItem();
                        setState(() {
                          _selected.add(randomIndex!);

                        });

                        _navigateToFirstPage(listindex: randomIndex!);

                        creatUser(
                          name: _namecontroller.text,
                          phoneNumber: _phonecontroller.text,
                          email: _emailcontroller.text,
                          result: randomIndex.toString() == "1"
                              ? "30% OFF"
                              : randomIndex.toString() == "3"
                                  ? "20% OFF"
                                  : randomIndex.toString() == "5"
                                      ? "15% OFF"
                                      : randomIndex.toString() == "7"
                                          ? "10% OFF"
                                          : "Nothing",
                        );}
                      },
                      child: const Text("TRY YOUR LUCK")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _navigateToFirstPage({required int listindex}) async {
    await Future.delayed(const Duration(milliseconds: 4600), () {});

    if (listindex == 1 || listindex == 3 || listindex == 5 || listindex == 7) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text(
                "Congratulations",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Continue'),
                  onPressed: () {
                    setState(() {
                      randm();
                    });
                    _namecontroller.clear();
                    _emailcontroller.clear();
                    _phonecontroller.clear();
                    Navigator.pop(context);
                  },
                ),
              ],
              content: Row(
                children: [
                  const Text(
                    "You Got",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.green),
                  ),
                  Text(
                    listindex.toString() == "1"
                        ? "30% OFF"
                        : listindex.toString() == "3"
                            ? "20% OFF"
                            : listindex.toString() == "5"
                                ? "15% OFF"
                                : listindex.toString() == "7"
                                    ? "10% OFF"
                                    : "",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.green),
                  )
                ],
              ));
        },
      );
    } else {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              'Better Luck \n Next Time',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w400, color: Colors.red),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Continue'),
                onPressed: () {
                  _namecontroller.clear();
                  _emailcontroller.clear();
                  _phonecontroller.clear();
                  setState(() {
                    randm();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}

