import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/class/note_center.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/size_constant.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/cubit/category/category_center/category_center_state.dart';
import 'package:note_application/cubit/category/edit_category/edit_category_cubit.dart';
import 'package:note_application/cubit/category/edit_category/edit_category_state.dart';
import 'package:note_application/function/awesome_dialog/category_edit_delete_function.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/screen/companded/customer_circular_progress_widget.dart';
import 'package:note_application/screen/note/home_note/home_note_screen.dart';
import 'package:note_application/screen/widget/custom_card_category_widget.dart';
import 'package:note_application/screen/widget/customer_add_category_widget.dart';

class CustomCategoryBuildWidget extends StatelessWidget {
  const CustomCategoryBuildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCenterCubit, CategoryCenterState>(
      //change Note's Nubmer in category card
      builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (MediaQuery.sizeOf(context).width <=
                    ConstantSizeLayout.mobileLayout)
                ? 2
                : 3,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const CustomerAddCategoryWidget();
            } else {
              return BlocConsumer<EditCategoryCubit, EditCategoryState>(
                listener: (context, state) {
                  if (state is ErrorEditCategoryState) {
                    flashBar(
                      title: LanguageKeys.alertTitle.tr(context),
                      message: state.errorMessage.tr(context),
                    ).show(context);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingEditCategoryState) {
                    return const CustomerCircularProgressWidget();
                  }
                  return CustomCardCategoryWidget(
                    data: CategoryCenterCubit.data[index - 1],
                    onTap: () {
                      _onTap(context, index - 1);
                    },
                    onLongPress: () async {
                      EditCategoryCubit.indexEdit = index - 1;
                      await categoryEditAndDeleteDialog(
                        context: context,
                        indexDelete: index - 1,
                      ).show();
                    },
                  );
                },
              );
            }
          },
          itemCount: CategoryCenterCubit.data.length + 1,
        );
      },
    );
  }

  void _onTap(BuildContext context, int index) {
    NoteCenter.index = index;
    NoteCenter.idCategory = CategoryCenterCubit.data[index].id;
    NoteCenter.data = CategoryCenterCubit.data[index].listNote??[];
    NoteCenter.categoryName = CategoryCenterCubit.data[index].name;
    Navigator.of(context).pushNamed(HomeNoteScreen.id);
  }
}
