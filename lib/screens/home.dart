import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color DarkBlue = Color(0xFF1a2531);
  Color LightBlue = Color(0xFFbcdef8);
  Color PaleBlue = Color(0xFF2b3745);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* sidebar.dart */
      drawer: SideBar(activePage: "Home"),

      /* App Bar */
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          fit: BoxFit.cover,
          height: 50.0,
          filterQuality: FilterQuality.high,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: LightBlue),
        centerTitle: true,
      ),

      /* Body */
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Search Bar */
            SizedBox(height: 15.0,),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 55.0,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10.0,),
                decoration: BoxDecoration(
                  color: PaleBlue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white54,
                      size: 30.0,
                    ),
                    Container(
                      width: 300.0,
                      margin: EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.white54,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /* Trendings */
            SizedBox(height: 25.0),
            Row(
              children: [
                SizedBox(width: 25.0,),
                Expanded(
                  child: Text("Trendings",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.left),
                ),
                Expanded(
                  child: Text("See More...",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.right),
                ),
                SizedBox(width: 25.0,),
              ],
            ),
            SizedBox(height: 25.0,),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: 10,
                options: CarouselOptions(
                  height: 300.0,
                  autoPlay: true,
                  viewportFraction: 0.55,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                ),
                itemBuilder: (context, itemIndex, pageViewIndex){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 300.0,
                      width: 200.0,
                      color: PaleBlue,
                    ),
                  );
                },
              ),
            ),

            /* Action Movies */
            SizedBox(height: 25.0,),
            Row(
              children: [
                SizedBox(width: 25.0,),
                Expanded(
                  child: Text("Action Movies",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.left),
                ),
                Expanded(
                  child: Text("See More...",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.right),
                ),
                SizedBox(width: 25.0,),
              ],
            ),
            SizedBox(height: 25.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i=1; i<=10; i++)
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "/moviePage");
                    },
                    child: Container(
                      width: 185,
                      height: 250,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: PaleBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /* Comedy Movies */
            SizedBox(height: 25.0,),
            Row(
              children: [
                SizedBox(width: 25.0,),
                Expanded(
                  child: Text("Comedy Movies",
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.left),
                ),
                Expanded(
                  child: Text("See More...",
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.right),
                ),
                SizedBox(width: 25.0,),
              ],
            ),
            SizedBox(height: 25.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i=1; i<=10; i++)
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/moviePage");
                      },
                      child: Container(
                        width: 185,
                        height: 250,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: PaleBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            /* Adventure Movies */
            SizedBox(height: 25.0,),
            Row(
              children: [
                SizedBox(width: 25.0,),
                Expanded(
                  child: Text("Adventure Movies",
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.left),
                ),
                Expanded(
                  child: Text("See More...",
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.right),
                ),
                SizedBox(width: 25.0,),
              ],
            ),
            SizedBox(height: 25.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i=1; i<=10; i++)
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "/moviePage");
                      },
                      child: Container(
                        width: 185,
                        height: 250,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: PaleBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                ],
              ),
            ),


            SizedBox(height: 25.0,),
          ],
        ),
      ),

    );
  }
}
