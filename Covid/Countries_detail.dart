import 'package:apipractice/images.dart';
import 'package:flutter/material.dart';
class country_detail extends StatefulWidget {
  String flag;
  String name;
  String fullname;
  String lat;
  String capital;
  int population;
  String long;
String area;
String timezones;
String continents;
String startOfWeek;
   country_detail({
  required this.flag,
  required this.name,
  required this.capital,
     required this.lat,
     required this.long,
     required this.area,
required this.fullname,
     required this.timezones,
  required this.population,
     required this.continents,
     required this.startOfWeek,
}) ;

  @override
  State<country_detail> createState() => _country_detailState();
}

class _country_detailState extends State<country_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 17,),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "${widget.fullname}", style: TextStyle(fontSize: 25,color: Colors.black54,fontWeight: FontWeight.bold)),
                  TextSpan(text: "(${widget.name}):-", style: TextStyle(fontSize: 25,color: Colors.black54)),

                ],
              ),
            ),
          SizedBox(height: 10,),
          Image(image: NetworkImage(widget.flag,),width: MediaQuery.of(context).size.width/1,),
SizedBox(height: 10,),
            ReusbaleRow(title: "Full name", value: widget.fullname),
Reusbalecolo(title: "Name", value: widget.name),
            SizedBox(height: 5,),
            Reusbalecolo(title: "Capital", value:widget.capital ),
            SizedBox(height: 5,),
            Reusbalecolo(title: "Total Population", value:widget.population.toString()),
            SizedBox(height: 5,),

            Reusbalecolo(title: "Continent name", value:widget.continents ),
            SizedBox(height: 5,),
            Reusbalecolo(title: "Time Zone", value:widget.timezones ),
            SizedBox(height: 5,),
            Reusbalecolo(title: "Total Area", value:widget.area ),
            SizedBox(height: 5,),
            Reusbalecolo(title: "Longitude", value:widget.long ),
            SizedBox(height: 5,),
            Reusbalecolo(title: "Latitude", value:widget.lat),

            SizedBox(height: 5,),
            Reusbalecolo(title: "Start of week", value:widget.startOfWeek),
          ],

        ),
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
      child: Column(

        children: [
          Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Text(value ),

        ],
      ),
    );
  }
}


class Reusbalecolo extends StatelessWidget {
  String title , value ;
  Reusbalecolo({Key? key , required this.title , required this.value}) : super(key: key);

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