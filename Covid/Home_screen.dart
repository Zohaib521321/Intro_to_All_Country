import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'Countriesname.dart';
class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> with TickerProviderStateMixin {
  late AnimationController animationController;
  final colorlist=[Colors.green,Colors.red,Colors.yellow];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    animationController = AnimationController(
        duration: const Duration(seconds: 3), vsync: this)..repeat();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Record of whole world"),

        centerTitle: true,
      ),
      body:SafeArea(
        child: Container(
          color: Colors.black12,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .03,)
,
              Align(
                alignment: Alignment.topRight,
                child: PieChart(dataMap:
                {
                  "Birth per day":150000,
                  "Death per day":385000,
                },
                  chartValuesOptions: ChartValuesOptions(
                    showChartValuesInPercentage: true
                  ),
                  animationDuration: Duration(seconds: 3),
                  legendOptions: LegendOptions(
                    legendPosition: LegendPosition.left
                  ),
                  chartType: ChartType.ring,
chartRadius: MediaQuery.of(context).size.width/2.7,
                  colorList: colorlist,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.09,),
              Card(
                elevation: 7,
                child: Column(
                  children: [
ReusbaleRow(title: "Total birth per day", value: "150,000"),
                    ReusbaleRow(title: "Total birth per day", value: "385000"),

                  ],
                ),
              ),
              SizedBox(height: 17,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>country()));
                  },
                  child: Container(
                    height: 50,
             decoration: BoxDecoration(
                   color: Colors.green,
                   borderRadius: BorderRadius.circular(10)
             ),

             child:Center(
                   child: Text("Track Country"))
                  ),
                ),
              )],
          ),
        ),
      )

    );
  }
}
class ReusbaleRow extends StatelessWidget {
  String title , value ;
  ReusbaleRow({Key? key , required this.title , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Text(value ),
SizedBox(height: 27,),
            Divider()
          ],
        ),
      ),
    );
  }
}