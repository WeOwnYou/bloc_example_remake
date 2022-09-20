import 'package:flutter/material.dart';
import 'package:vedita_learning2/ui/home/bloc/home_bloc.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.selectedBackgroundColor,
    this.selectedBackgroundGradient,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.unselectedBackgroundColor,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  final void Function(HomePageEvent event) onTap;
  final Color? selectedBackgroundColor;
  final LinearGradient? selectedBackgroundGradient;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color unselectedBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(right: 16 / 619 * width),
      child: GestureDetector(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            color: isSelected
                ? (selectedBackgroundGradient == null
                    ? selectedBackgroundColor
                    : null)
                : unselectedBackgroundColor,
            gradient: isSelected ? selectedBackgroundGradient : null,
          ),
          child: SizedBox(
            width: 156 / 619 * width,
            height: 70 / 1337 * height,
            child: Center(
              child: Text(
                title,
                style: isSelected
                    ? TextStyle(
                        color: selectedTextColor,
                        fontWeight: FontWeight.w600,
                      )
                    : TextStyle(color: unselectedTextColor),
              ),
            ),
          ),
        ),
        onTap: () {
          onTap(ChangeCategory(title));
        },
      ),
    );
  }
}
