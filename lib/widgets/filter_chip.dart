import 'package:flutter/material.dart';

class FilterChipsWidget extends StatelessWidget {
  const FilterChipsWidget({Key? key, required this.title, required this.isSelected})
      : super(key: key);

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff3364E0) : Color(0xffF8F7F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
