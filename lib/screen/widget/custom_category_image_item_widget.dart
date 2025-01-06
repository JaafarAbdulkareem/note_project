import 'package:flutter/material.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/constant/map_constant.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/category/category_choose_image/category_choose_image_cubit.dart';
import 'package:note_application/function/respponsive_text_function.dart';

class CustomerCategoryImageItemWidget extends StatelessWidget {
  const CustomerCategoryImageItemWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    double r = getResponsiveText(context, fontSize: 40);
    return CategoryChooseImageCubit.indexImage == index
        ? Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: r,
                  backgroundColor: AppColor.main,
                  child: CircleAvatar(
                    radius: r - getResponsiveText(context, fontSize: 4),
                    backgroundColor:
                        AppColor.backgroundLogo, // Colors.grey[300],
                    child: ClipOval(
                      child: Image.asset(
                        AppListImage.imageCategory[index]
                            [ConstantMapImage.image]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  AppListImage.imageCategory[index][ConstantMapImage.title]!
                      .tr(context),
                  style: TextStyle(
                    fontSize: getResponsiveText(context, fontSize: 14),
                    color: AppColor.main,
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                ClipOval(
                  child: CircleAvatar(
                    radius: r,
                    backgroundColor: AppColor.backgroundLogo,
                    child: Image.asset(
                      AppListImage.imageCategory[index]
                          [ConstantMapImage.image]!,
                      width: getResponsiveText(context, fontSize: 55),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  AppListImage.imageCategory[index][ConstantMapImage.title]!
                      .tr(context),
                  style: TextStyle(
                    fontSize: getResponsiveText(context, fontSize: 14),
                  ),
                ),
              ],
            ),
          );
  }
}
