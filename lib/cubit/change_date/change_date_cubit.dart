import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/cubit/change_date/change_date_state.dart';

class ChangeDateCubit extends Cubit<ChangeDateState> {
  ChangeDateCubit() : super(ChangeDateState());

  changeDate(){
    emit(ChangeDateState());
  }
}