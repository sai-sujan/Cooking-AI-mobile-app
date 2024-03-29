import 'package:cookingai/ChatPage.dart';
import 'package:cookingai/CustomBottomNavigationBar.dart';
import 'package:cookingai/SearchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cookingai/searchbar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // This will keep track of the current index for the bottom navigation bar.

  // This method will be called when a navigation item is tapped.
  void _onItemTapped(int index) {
    if (index == _currentIndex) return; // Do nothing if the current tab is tapped again

    setState(() {
      _currentIndex = index; // Update the current index
    });

    switch (index) {
      case 0: // Home icon
        // We are already on the HomePage, no need to navigate
        break;
      case 1: // Search icon
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())); // Navigate to the SearchPage
        break;
      case 2: // Chat icon
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage())); // Navigate to the ChatPage
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SearchBarApp(),
                
                Container(
                  child: const Text('What are we cooking today?',style: TextStyle(
                  color: Color(0xFF030303), // Text color
                  fontSize: 32, // Font size in points
                  fontFamily: 'Be Vietnam Pro', // Font family
                  fontWeight: FontWeight.w600, // Font weight
                  height: 1.4, // Line height (assuming 'lineHeight' represents the line spacing)
                ),),
                
                ),
          
                const SizedBox(
                  height: 30,
                ),
            
                  const Text(
                    'Recipe of the day',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFFF030303),
                      fontSize: 18,
                      fontFamily: 'Be Vietnam Pro',
                      fontWeight: FontWeight.w600,
                      
                    ),
                  ),
                 
                  Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), // Apply border radius here
              child: Container(
                color: Colors.transparent,
                child: Ink.image(
          image: AssetImage('assets/images/recipe.jpeg'),
          fit: BoxFit.cover,
          width: double.infinity, // Take up all available width
          height: 165, // Fixed height
          child: InkWell(
            onTap: () {
              // Handle image tap
              print("Image tapped!");
            },
            splashColor: const Color.fromARGB(255, 217, 14, 14).withAlpha(30), // Custom splash color
          ),
                ),
              ),
            ),
          ),
          
          
          
          
          
                  const SizedBox(
                    height: 40,
                  ),
                  Text('Ideas',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w600 ),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      
                     Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
          // Define what you want to happen when the image is tapped
          print("Image tapped");
                },
                child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Set desired radius
          child: Image.asset(
            'assets/images/food_camera_logo1.jpeg',
            fit: BoxFit.cover,
            height: 160,
            width: 160,
          ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(7, 10, 0, 0),
                child: Text(
          "Search by image",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
                ),
              ),
            ],
          ),
                        // SizedBox(
                        //   width: 10,
                        // ),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
          // Define what you want to happen when the image is tapped
          print("Image tapped");
                },
                child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Set desired radius
          child: Image.asset(
            'assets/images/food_search_img.png',
            fit: BoxFit.cover,
            height: 160,
            width: 160,
          ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(7, 10, 0, 0),
                child: Text(
          "Search by text",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
                ),
              ),
            ],
          ),
          
                        
                      // Image(image: AssetImage('assets/images/food_camera_logo2.jpeg'))
                    ],),
                  )    
              ],
            ),
                
            
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex, // Pass the current index here.
        onTap: _onItemTapped,) // Pass the onTap callback here.),
    );
  }
}