import 'package:flutter/material.dart';
class Back extends StatelessWidget {
  const Back({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          //3lshan a3ml el img ta5od kol el saf5a
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
