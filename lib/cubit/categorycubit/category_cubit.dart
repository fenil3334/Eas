import 'package:eastern_interview/cubit/categorycubit/category_state.dart';
import 'package:eastern_interview/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit() : super(CategoryIntilize());

  final ApiService _repository=ApiService();


  Future<void> getCategoryList() async {
    try {
      emit(OnLoading());
      final genreMovisLists = await _repository.getCategores();
      emit(OnSuccess(genreMovisLists));
    } catch (e) {
      emit(OnFailed(e.toString()));
      rethrow;
    }
  }

}