import 'dart:convert';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:jussurapp/Model/Notification.dart' as notif;

class TableScreen extends StatefulWidget {



 @override
  State<StatefulWidget> createState() {
   return _TableScreenState();
  }

}

class _TableScreenState extends State<TableScreen> {

  Future<notif.Notification> notification;

  @override
  void initState() {
    super.initState();
    notification = fetchNotifiaction();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: Center(
          child: FutureBuilder<notif.Notification>(
            future: notification,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(itemBuilder: (context, index) => buildCard(snapshot.data),
                itemCount: 1
                );
              } else if(snapshot.connectionState == ConnectionState.done && !snapshot.hasData){
                 return Center(
                   child: Text("No data found"),
                 );
              } else {
                 return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
  Widget buildCard(notif.Notification notification) {

    final String validFrom = '${DateTime.parse(notification.new_validfrom).month}/${DateTime.parse(notification.new_validfrom).day}/${DateTime.parse(notification.new_validfrom).year}';
    final String validTo = '${DateTime.parse(notification.new_validto).month}/${DateTime.parse(notification.new_validto).day}/${DateTime.parse(notification.new_validto).year}';

      return Card(
//        margin: EdgeInsets.all(120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Description: ${notification.new_description}"),
            Text("Discount Amount: ${notification.new_discountamount}"),
            Text("Discount Percentage ${notification.new_discountpercentage}"),
            Text("Eng. description: ${notification.new_englishdescription}"),
            Text("Eng. name: ${notification.new_englishname}"),
            Text("Free visits: ${notification.new_freevisits}"),
            Text("Free weeks: ${notification.new_freeweeksfactor}"),
            Text("Name: ${notification.new_name}"),
            Text("Hour price: ${notification.new_newhourprice}"),
            Text("Promocode: ${notification.new_promocode}"),
            Text("Valid From: $validFrom"),
            Text("Valid To: $validTo"),
          ],
        ),
      );
  }



  Future<notif.Notification> fetchNotifiaction() async {
    // final response = await http.get('https://crm.jussuremdad.com/crmapi_Staging/api/Mobile/GetLatestPromotion');
    // print('response  $response');
    // if (response.statusCode == 200) {
    //   return notif.Notification.fromJSON(json.decode(response.body));
    // } else {
    //   throw Exception("Data not found");
    // }
    var data = await apiGet();
    print('data $data');
    if(data != null && data != "") {
      return notif.Notification.fromJSON(json.decode(data));
    } else {
      return null;
    }
  }


   HttpClient client = new HttpClient()..badCertificateCallback = (_certificateCheck);

  Future<String> apiGet() async {
    var url = "https://crm.jussuremdad.com/api/Mobile/GetLatestPromotion";
    print('mainurl $url');
    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    _setHeadersCookies(request, url);
    HttpClientResponse response = await request.close();
    _updateCookies(response, url);
    return await response.transform(utf8.decoder).join();
  }

  var cj = new CookieJar();
  void _setHeadersCookies(HttpClientRequest request, String url) {
      request.cookies.addAll(cj.loadForRequest(Uri.parse(url)));
  }

  void _updateCookies(HttpClientResponse response, String url) {
    cj.saveFromResponse(Uri.parse(url), response.cookies);
  }

  static bool _certificateCheck(X509Certificate cert, String host, int port) =>
      host == 'crm.jussuremdad.com';


}