import 'package:flutter/material.dart';
import 'package:http_testing/models/api_responses.dart';
import 'package:http_testing/services/api_services.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<ResponsesLists> listData;
  Future<ResponsesLists> getData() async {
    String _url = "https://jsonplaceholder.typicode.com/comments";
    ApiServices apiServices = ApiServices(_url);

    listData = apiServices.fetchData();
    return listData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot<ResponsesLists> snapshot) {
        if (snapshot.hasData) {
          List<ApiResponses> lists = snapshot.data!.posts;
          return createListView(lists, context);
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
      },
    );
  }

  createListView(List<ApiResponses> data, context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text(data[index].id.toString()),
          title: Text('User - ${data[index].name}'),
          subtitle: Text(data[index].email),
          trailing: const IconButton(
            onPressed: null,
            icon: Icon(Icons.forward_10_outlined),
          ),
        );
      },
    );
  }
}
