part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsGetEgBusinessSuccessState extends NewsState {
  final List<dynamic> egBusiness;
  NewsGetEgBusinessSuccessState(this.egBusiness);
}

class NewsGetEgGeneralSuccessState extends NewsState {
  final List<dynamic> egGeneral;
  NewsGetEgGeneralSuccessState(this.egGeneral);
}

class NewsGetSearshSuccessState extends NewsState {
  final List<dynamic> searshText;
  NewsGetSearshSuccessState(this.searshText);
}

// class NewsGetUsaGeneralSuccessState extends NewsState {
//   final List<dynamic> UsaGeneral;
//   NewsGetUsaGeneralSuccessState(this.UsaGeneral);
// }

class NewsGetUsaGeneralSuccessState extends NewsState {
final List<dynamic> UsaGeneral;
NewsGetUsaGeneralSuccessState(this.UsaGeneral);
}
class NewsGetEgBusinessErrorState extends NewsState {
  final String error;


  NewsGetEgBusinessErrorState(this.error);}
class NewsGetEgGeneralErrorState extends NewsState {
  final String error;


  NewsGetEgGeneralErrorState(this.error);}

class ChangeSearshIcon extends NewsState{}

class NewsGetSearshErrorState extends NewsState {
  final String error;


  NewsGetSearshErrorState(this.error);}


class NewsGetUsaGeneralErrorState extends NewsState {
  final String error;


  NewsGetUsaGeneralErrorState(this.error);}


class NewsGetEgBusinessLoadingState extends NewsState {}

class NewsGetEgGeneralLoadingState extends NewsState {}

class NewsGetSearshLoadingState extends NewsState {}

class NewsGetUsaGeneralLoadingState extends NewsState {}


class NewsGetEgTechnologySuccessState extends NewsState {
  final List<dynamic> egTechnology;
  NewsGetEgTechnologySuccessState(this.egTechnology);
}
class NewsGetEgTechnologyErrorState extends NewsState {
  final String error;


  NewsGetEgTechnologyErrorState(this.error);}
class NewsGetEgTechnologyLoadingState extends NewsState {}


class NewsGetEgSportsSuccessState extends NewsState {
  final List<dynamic> egSports;
  NewsGetEgSportsSuccessState(this.egSports);
}
class NewsGetEgSportsErrorState extends NewsState {
  final String error;

  NewsGetEgSportsErrorState(this.error);

}
class NewsGetEgSportsLoadingState extends NewsState {}


class NewsChangeBottomNavigationBarItemState extends NewsState{}

class NewsChangeUsaBottomNavigationBarItemState extends NewsState{}


class NewsGetUsaBusinessSuccessState extends NewsState {
  final List<dynamic> UsaBusiness;
  NewsGetUsaBusinessSuccessState(this.UsaBusiness);
}
class NewsGetUsaBusinessErrorState extends NewsState {
  final String error;

  NewsGetUsaBusinessErrorState(this.error);
}
class NewsGetUsaBusinessLoadingState extends NewsState {}


class NewsGetUsaTechnologySuccessState extends NewsState {
  final List<dynamic> UsaTechnology;
  NewsGetUsaTechnologySuccessState(this.UsaTechnology);
}
class NewsGetUsaTechnologyErrorState extends NewsState {
  final String error;

  NewsGetUsaTechnologyErrorState(this.error);

}
class NewsGetUsaTechnologyLoadingState extends NewsState {}


class NewsGetUsaSportsSuccessState extends NewsState {
  final List<dynamic> UsaSports;
  NewsGetUsaSportsSuccessState(this.UsaSports);
}
class NewsGetUsaSportsErrorState extends NewsState {
  final String error;

  NewsGetUsaSportsErrorState(this.error);

}
class NewsGetUsaSportsLoadingState extends NewsState {}


class NewsChangeCountryNewsState extends NewsState {}





