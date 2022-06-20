import 'package:flutter/material.dart';
import 'package:http_testing/models/holidays_responses.dart';
import 'package:http_testing/services/holiday_api_services.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({Key? key}) : super(key: key);

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<HolidaysResponse> getData() async {
    HolidayApiService apiService = HolidayApiService();
    var data = await apiService.fetchData();
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<HolidaysResponse>(
        future: getData(),
        builder: (context, AsyncSnapshot<HolidaysResponse> snapshot) {
          if (snapshot.hasData) {
            List<Holidays>? info = snapshot.data!.holidays;
            return createListView(info!, context);
            // createListView(snapshot.data, context);
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
      ),
    );
  }

  createListView(List<Holidays> data, context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Date - ${data[index].date}'),
          subtitle: Text(data[index].name.toString()),
          trailing: const IconButton(
            onPressed: null,
            icon: Icon(Icons.forward_10_outlined),
          ),
        );
      },
    );
  }
}
