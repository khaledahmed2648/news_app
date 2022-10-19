import 'package:flutter/material.dart';
import 'package:shop_app_project/business_logic/news_cubit.dart';
import 'package:shop_app_project/presentation/webview_screen.dart';

Widget buildNewsItem(BuildContext context, article) {
  if (article['urlToImage'] == null) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WebviewScreen(url: article['url'])));
      },
      child: Container(
        height: 150,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 3,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  } else
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
        MaterialPageRoute(builder: (context)=>WebviewScreen(url: article['url'])));
      },
      child: Container(
        height: 150,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image(
                  image: NetworkImage(
                    '${article['urlToImage']}',
                  ),
                  fit: BoxFit.cover,
                  height: 150,
                  width: 160,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 3,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
}

Widget buildEgyptScreenBody(context, state) {
  if (state is NewsGetEgBusinessSuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.egBusiness[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.egBusiness.length,
    );
  }
  else if (state is NewsGetEgSportsSuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.egSports[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.egSports.length,
    );
  }

  else if (state is NewsGetSearshSuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.searshText[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.searshText.length,
    );
  }

  else if (state is NewsGetEgTechnologySuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.egTechnology[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.egTechnology.length,
    );
  } else if (state is NewsGetEgGeneralSuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.egGeneral[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.egGeneral.length,
    );
  } else {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

Widget buildUsaScreenBody(context, state) {
  if (state is NewsGetUsaBusinessSuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.UsaBusiness[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.UsaBusiness.length,
    );
  }

  else if (state is NewsGetSearshSuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.searshText[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.searshText.length,
    );
  }

  else if (state is NewsGetUsaSportsSuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.UsaSports[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.UsaSports.length,
    );
  } else if (state is NewsGetUsaGeneralSuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.UsaGeneral[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.UsaGeneral.length,
    );
  } else if (state is NewsGetUsaTechnologySuccessState) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          buildNewsItem(context, state.UsaTechnology[index]),
      separatorBuilder: (context, index) => Container(
        height: 1,
      ),
      itemCount: state.UsaTechnology.length,
    );
  } else {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
