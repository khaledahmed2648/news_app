
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app_project/data/apis_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final DioHelper apisHelper;
  NewsCubit({required this.apisHelper}) : super(NewsInitial());

  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentItem=0;
  void chaneBottomNavigationBarItem(int index){
    currentItem=index;
    emit(NewsChangeBottomNavigationBarItemState());

    if(currentItem==0)
      getEgGeneralData();
    else if(currentItem==1)
      getEgBusinessData();
    else if(currentItem==2)
      getEgSportsData();
    else getEgTechnologyData();
  }
  int currentUsaItem=0;
  void chaneUsaBottomNavigationBarItem(int index){
    currentUsaItem=index;
    emit(NewsChangeUsaBottomNavigationBarItemState());
    if(currentUsaItem==0)
      getUsaGeneralData();
    else if(currentUsaItem==1)
      getUsaBusinessData();
    else if(currentUsaItem==2)
      getUsaSportsData();
    else getUsaTechnologyData();
  }
  void getEgBusinessData(){
    emit(NewsGetEgBusinessLoadingState());
    apisHelper.getNews({
      'category':'business',
      'country':'eg',
      'apiKey':'9a5b07d417a4424bb67c4841d1ce321f'
    }).then((value){
      emit(NewsGetEgBusinessSuccessState(value.data['articles']));
    }).catchError((error){
      print(error.toString());
      emit(NewsGetEgBusinessErrorState(error.toString()));
    });
  }

  void getEgGeneralData(){
    emit(NewsGetEgGeneralLoadingState());
    apisHelper.getNews({
      'category':'general',
      'country':'eg',
      'apiKey':'9a5b07d417a4424bb67c4841d1ce321f'
    }).then((value){
      emit(NewsGetEgGeneralSuccessState(value.data['articles']));
    }).catchError((error){
      print(error.toString());
      emit(NewsGetEgGeneralErrorState(error.toString()));
    });
  }

  void getSearshData(String value){
    emit(NewsGetSearshLoadingState());
    apisHelper.getNews({
     'q':'$value',
      'apiKey':'9a5b07d417a4424bb67c4841d1ce321f'
    }).then((value){
      emit(NewsGetSearshSuccessState(value.data['articles']));
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearshErrorState(error.toString()));
    });
  }
  bool isSearsh=false;

  void ChangeSearshScreen(){
    isSearsh!=isSearsh;
    emit(ChangeSearshIcon());
  }

  void getUsaGeneralData(){
    emit(NewsGetUsaGeneralLoadingState());
    apisHelper.getNews({
      'category':'general',
      'country':'us',
      'apiKey':'9a5b07d417a4424bb67c4841d1ce321f'
    }).then((value){
      emit(NewsGetUsaGeneralSuccessState(value.data['articles']));
    }).catchError((error){
      print(error.toString());
      emit(NewsGetUsaGeneralErrorState(error.toString()));
    });
  }

  void getEgSportsData(){
    emit(NewsGetEgSportsLoadingState());

    apisHelper.getNews({
      'category':'sports',
      'country':'eg',
      'apiKey':'9a5b07d417a4424bb67c4841d1ce321f'
    }).then((value){
      emit(NewsGetEgSportsSuccessState(value.data['articles']));
    }).catchError((error){
      print(error.toString());

      emit(NewsGetEgSportsErrorState(error.toString()));
    });
  }

  void getEgTechnologyData(){
    emit(NewsGetEgTechnologyLoadingState());
    apisHelper.getNews({
      'category':'technology',
      'country':'eg',
      'apiKey':'9a5b07d417a4424bb67c4841d1ce321f'
    }).then((value){
      emit(NewsGetEgTechnologySuccessState(value.data['articles']));
    }).catchError((error){
      print(error.toString());

      emit(NewsGetEgTechnologyErrorState(error.toString()));
    });
  }


  void getUsaBusinessData(){
    emit(NewsGetUsaBusinessLoadingState());
    apisHelper.getNews({
      'category':'business',
      'country':'us',
      'apiKey':'9a5b07d417a4424bb67c4841d1ce321f'
    }).then((value){
      emit(NewsGetUsaBusinessSuccessState(value.data['articles']));
    }).catchError((error){
      emit(NewsGetUsaBusinessErrorState(error.toString()));
    });
  }

  void getUsaSportsData(){
    emit(NewsGetUsaSportsLoadingState());

    apisHelper.getNews({
      'category':'sports',
      'country':'us',
      'apiKey':'9a5b07d417a4424bb67c4841d1ce321f'
    }).then((value){
      emit(NewsGetUsaSportsSuccessState(value.data['articles']));
    }).catchError((error){
      emit(NewsGetUsaSportsErrorState(error.toString()));
    });
  }

  void getUsaTechnologyData(){
    emit(NewsGetEgTechnologyLoadingState());
    apisHelper.getNews({
      'category':'technology',
      'country':'us',
      'apiKey':'9a5b07d417a4424bb67c4841d1ce321f'
    }).then((value){
      emit(NewsGetUsaTechnologySuccessState(value.data['articles']));
    }).catchError((error){
      emit(NewsGetUsaTechnologyErrorState(error.toString()));
    });
  }




}
