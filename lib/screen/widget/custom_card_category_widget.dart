import 'package:flutter/material.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/models/category/category_model.dart';
import 'package:note_application/screen/widget/custom_row_no_date_widget.dart';

class CustomCardCategoryWidget extends StatelessWidget {
  const CustomCardCategoryWidget({
    super.key,
    required this.data,
    required this.onLongPress,
    required this.onTap,
  });

  final CategoryModel data;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
              right: getResponsiveText(context, fontSize: 8),
              left: getResponsiveText(context, fontSize: 4),
              bottom: getResponsiveText(context, fontSize: 4)),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  data.image!,
                ),
              ),
              Expanded(
                child: Text(
                  data.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: getResponsiveText(context, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: CustomRowNoDateWidget(
                  no: data.noNote!,
                  date: data.date!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
