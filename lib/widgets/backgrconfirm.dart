import 'package:flutter/material.dart';
class Backconfirm extends StatelessWidget {
  final Widget child;
  const Backconfirm({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      decoration:const  BoxDecoration(
        image:  DecorationImage(
          image: AssetImage('assets/images/confirm.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}