import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
//Chua them const
=======
>>>>>>> 50e286e37dce82ef82dce18832c7f8d5cfcef5dd
String? selecteValue;

class ListBtn extends StatelessWidget {
  final List<String> items;
  final String nameOfListBtn;
  final Function(String?) onSelected;
  const  ListBtn({super.key, required this.items, required this.nameOfListBtn, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              nameOfListBtn,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
                .toList(),
            value: selecteValue,
            onChanged: (String? value) {
              onSelected(value);
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
