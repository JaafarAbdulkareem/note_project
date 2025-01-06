import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/cubit/category/category_choose_image/category_choose_image_cubit.dart';
import 'package:note_application/cubit/category/category_choose_image/category_choose_image_state.dart';
import 'package:note_application/screen/widget/custom_category_image_item_widget.dart';

class CustomImageListWidget extends StatelessWidget {
  const CustomImageListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        // mainAxisSpacing: 10,
        // crossAxisSpacing: 10,
        childAspectRatio: 0.70,
      ),
      itemCount: AppListImage.imageCategory.length,
      itemBuilder: ((context, index) => GestureDetector(
            onTap: () {
              BlocProvider.of<CategoryChooseImageCubit>(context).refresh(index);
            },
            child: BlocBuilder<CategoryChooseImageCubit, CategoryChooseImageState>(
              builder: (context, state) {
                return CustomerCategoryImageItemWidget(
                  index: index,
                );
              },
            ),
          )),
    );
  }
}
