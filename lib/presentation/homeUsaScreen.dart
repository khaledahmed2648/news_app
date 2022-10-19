import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_project/business_logic/news_cubit.dart';
import 'package:shop_app_project/data/apis_helper.dart';
import 'package:shop_app_project/presentation/widgets.dart';
import 'package:flutter_offline/flutter_offline.dart';



import 'homeEgyptScreen.dart';

class HomeUsaSceen extends StatefulWidget {
  @override
  State<HomeUsaSceen> createState() => _HomeUsaSceenState();
}

class _HomeUsaSceenState extends State<HomeUsaSceen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            NewsCubit(apisHelper: DioHelper())..getUsaGeneralData(),
        child: BlocConsumer<NewsCubit, NewsState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title:NewsCubit.get(context).isSearsh? TextField(

                decoration: InputDecoration(
                    hintText: 'Find your news',
                    border: InputBorder.none
                ),onChanged: (value){
                NewsCubit.get(context).getSearshData(value);
              },
                style: TextStyle(

                    color: Colors.white
                ),
              ):Text(
                'News',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),

              actions:NewsCubit.get(context).isSearsh?
              [

                IconButton(onPressed: (){
                  NewsCubit.get(context).isSearsh=false;
                  setState(() {

                  });


                }, icon: Icon(Icons.arrow_forward))

              ]:
              [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Egypt News?',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                IconButton(onPressed: () {
                  NewsCubit.get(context).isSearsh=true;
                  setState(() {

                  });
                }, icon: Icon(Icons.search))
              ],
            ),
            body: OfflineBuilder(
              connectivityBuilder: (BuildContext context,ConnectivityResult connectivity,Widget child){
                final bool connected=connectivity!=ConnectivityResult.none;
                if(connected){
                  return  buildUsaScreenBody(context, state);
                }
                else{
                  return Center(
                    child: Container(
                      color:Colors.tealAccent,
                      child:Column(
                        children: [
                          Text(
                            'Check your internet...',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white
                            ),
                          ),
                          Image.asset('assets/images/offline.png')
                        ],
                      ),
                    ),
                  );
                }
              },
              child: Center(child: CircularProgressIndicator(),),
            )
            ,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: NewsCubit.get(context).currentUsaItem,
              onTap: (index) {
                NewsCubit.get(context).chaneUsaBottomNavigationBarItem(index);
              },
                type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.all_inclusive), label: 'general'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: 'sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.biotech_outlined), label: 'tech'),
              ],
            ),
          ),
          listener: (context, state) {},
        ));
  }
}
