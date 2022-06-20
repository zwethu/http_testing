import 'package:flutter/material.dart';
import 'package:http_testing/models/news_response.dart';
import 'package:http_testing/services/news_api_services.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  
  @override
  void initState() {
    super.initState();
  }
   Future<NewsResponse> getData() async {
    NewsApiServices apiService = NewsApiServices();
    var data = await apiService.fetchData();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: getData(),
        builder: (context, AsyncSnapshot<NewsResponse> snapshot) {
          if (snapshot.hasData) {
                List<Articles>? info = snapshot.data!.articles;
            return createListView(info!, context);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  createListView(List<Articles> data, context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(data[index].title!),
          subtitle: Text(data[index].author??""),
        );
      },
    );
  }
}
