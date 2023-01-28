import 'package:flutter/material.dart';

class textFileds extends StatelessWidget {
  const textFileds({
    super.key,
    required TextEditingController namecontroller,
    required bool namevalidate,
    required TextEditingController phonecontroller,
    required bool phonevalidate,
    required TextEditingController emailcontroller,
    required bool emailvalidate,
  }) : _namecontroller = namecontroller, _namevalidate = namevalidate, _phonecontroller = phonecontroller, _phonevalidate = phonevalidate, _emailcontroller = emailcontroller, _emailvalidate = emailvalidate;

  final TextEditingController _namecontroller;
  final bool _namevalidate;
  final TextEditingController _phonecontroller;
  final bool _phonevalidate;
  final TextEditingController _emailcontroller;
  final bool _emailvalidate;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width / 1.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Full Name",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black),
            ),
            TextField(
              controller: _namecontroller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black12, width: 2.0),

                ),
                hintText: 'John',
                hintStyle: TextStyle(color: Colors.black12),
                errorText:  _namevalidate ? 'Value Can\'t Be Empty' : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Phone Number",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black),
            ),
            TextField(
              controller: _phonecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black12, width: 2.0),
                ),
                hintText: '+91 1234567890',
                hintStyle: TextStyle(color: Colors.black12),
                errorText:   _phonevalidate ? 'Value Can\'t Be Empty' : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Email",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black),
            ),
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black12, width: 2.0),
                ),
                hintText: 'John@gmail.com',
                hintStyle: TextStyle(color: Colors.black12),
                errorText:   _emailvalidate? 'Value Can\'t Be Empty' : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
