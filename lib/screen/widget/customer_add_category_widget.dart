import 'package:flutter/material.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/function/respponsive_text_function.dart';
import 'package:note_application/screen/category/add_category/add_category_view.dart';

class CustomerAddCategoryWidget extends StatelessWidget {
  const CustomerAddCategoryWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
            constraints: BoxConstraints(
              minWidth: MediaQuery.sizeOf(context).width,
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) => const AddCategoryView());
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Image.asset(
                  AppImage.addCategory,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                LanguageKeys.newCategory.tr(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: getResponsiveText(context, fontSize: 13),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
