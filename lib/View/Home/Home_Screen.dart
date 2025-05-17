import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home_Screen();
}

class _Home_Screen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0, right: 20, left: 20,bottom: 30),
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.dashboard)),
              Spacer(),
              Image.asset('assets/images/logo.png', height: 34, width: 63,),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
              IconButton(onPressed: (){}, icon: Icon(Icons.scanner_sharp)),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Hi, Shubham', style: TextStyle(
                fontFamily: "DM Sans",
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),),
              Text('What are you looking for today?', style: TextStyle(
                fontFamily: "DM Sans",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
              Image.asset('assets/images/Home.png', height: 210,),
              
            ],
          ),
        ),
      )

    );
  }
}
