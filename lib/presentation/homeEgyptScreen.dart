import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:shop_app_project/business_logic/news_cubit.dart';
import 'package:shop_app_project/data/apis_helper.dart';
import 'package:shop_app_project/presentation/homeUsaScreen.dart';
import 'package:shop_app_project/presentation/widgets.dart';

class HomeEgyptSceen extends StatefulWidget {
  @override
  State<HomeEgyptSceen> createState() => _HomeEgyptSceenState();
}

class _HomeEgyptSceenState extends State<HomeEgyptSceen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            NewsCubit(apisHelper: DioHelper())..getEgGeneralData(),
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
              'الأخبار',
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
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> HomeUsaSceen()));
                  },
                  child: Text(
                    'Usa News?',
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
                  return  buildEgyptScreenBody(context, state);
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
              currentIndex: NewsCubit.get(context).currentItem,
              onTap: (index) {
                NewsCubit.get(context).chaneBottomNavigationBarItem(index);
              },
                type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.all_inclusive), label: 'عام'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'أعمال'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), label: 'رياضة'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.biotech_outlined), label: 'تكنولوجيا'),
              ],
            ),
          ),
          listener: (context, state) {},
        ));
  }
}
