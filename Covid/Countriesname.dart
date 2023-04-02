import 'dart:convert';

import 'package:apipractice/Covid/Countries_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class country extends StatefulWidget {
  const country({Key? key}) : super(key: key);

  @override
  State<country> createState() => _countryState();
}

class _countryState extends State<country> {
final searchcontroller=TextEditingController();
var data;
Future<void> countryname()async{
  final response=await http.get(Uri.parse("https://webhook.site/1a75ff5d-f9e9-41e2-b7cc-9818673167b2"));

if (response.statusCode==200) {
  data=jsonDecode(response.body.toString());
} else {
  
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(

  children: [
    SizedBox(height: MediaQuery.of(context).size.height*.09,),
    Container(
      width:MediaQuery.of(context).size.width*.8,
      child:   TextFormField(
        controller: searchcontroller,
        onChanged: (value){
          setState(() {

          });
        },
        decoration: InputDecoration(
            label: Center(child: Text("Search")),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
            )
        ),
      ),
    ),
    Expanded(child: FutureBuilder(
      future:  countryname(),
      builder: (context,snapshot){
        if (snapshot.connectionState==ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.greenAccent,));
        } else {
          return ListView.builder(
itemCount: data.length,
              itemBuilder: (context,index){
 String name=data[index]["name"]["common"];
  if (searchcontroller.text.isEmpty){
    return Column(
        children:[
          SizedBox(height: 15,),
          Card(
            child:ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data[index]["flags"]["png"].toString()),
              ),
              title:Text(data[index]["name"]["common"].toString()),
              subtitle:Text(data[index]["tld"][0].toString()),
              onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (builder)=>country_detail(
  flag: data[index]["flags"]["png"].toString(),
name: data[index]["name"]["common"].toString(),
fullname:  data[index]["name"]["official"].toString(),
capital:data[index]["capital"][0] .toString(),
  population: data[index]["population"],
  lat: data[index]["latlng"][1].toString(),
long:data[index]["latlng"][0].toString(),
  area: data[index]["area"].toString(),
    timezones:data[index]["timezones"][0].toString(),
    continents:data[index]["continents"][0].toString(),
    startOfWeek:data[index]["startOfWeek"].toString(),
)));
              },
            ) ,
          )
        ]                );
  }
  else if (name.toLowerCase().contains(searchcontroller.text.toLowerCase().trim())) {
    return Column(
        children:[

          SizedBox(height: 15,),
          Card(
            child:ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data[index]["flags"]["png"].toString()),
              ),

              title:Text(data[index]["name"]["common"].toString()),
              subtitle:Text(data[index]["tld"][0].toString()),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>country_detail(
                  flag: data[index]["flags"]["png"].toString(),
                  name: data[index]["name"]["common"].toString(),
                  fullname:  data[index]["name"]["official"].toString(),
                  capital:data[index]["capital"][0] .toString(),
                  population: data[index]["population"],
                  lat: data[index]["latlng"][1].toString(),
                  long:data[index]["latlng"][0].toString(),
                  area: data[index]["area"].toString(),
                  timezones:data[index]["timezones"][0].toString(),
                  continents:data[index]["continents"][0].toString(),
                  startOfWeek:data[index]["startOfWeek"].toString(),

                )));
              },
            ) ,
          )
        ]                );
  }
  else{
    return Container();
  }
   });
        }

      },
    ))
  ],
),
    );
  }
}
class ReusbaleRow extends StatelessWidget {
  String title , value ;
  ReusbaleRow({Key? key , required this.title , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          Text(value ),

        ],
      ),
    );
  }
}