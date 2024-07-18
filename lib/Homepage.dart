import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'String2.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List images = [
    "assets/img_6.png",
    "assets/img_7.png",
  ];
  int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.cyanAccent[100],
                width: MediaQuery.of(context).size.width / 1,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(14),
                      height: 58,
                      width: 312,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                left: 15,
                                top: 3,
                              ),
                              child: Icon(
                                Icons.search_sharp,
                                size: 28,
                              )),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.all(15),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "What are looking for ?",
                                      hintStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )),
                                )),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.qr_code_scanner,
                              color: Colors.grey[400],
                              size: 26,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.keyboard_voice_rounded,
                              color: Colors.grey[400],
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      height: 53,
                      width: 53,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.shopping_cart_outlined),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1,
                color: Colors.cyan[300],
                height: 46,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(
                        Icons.location_on,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Deliver to Korea , Republic of",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 260,
                child: PageView(
                  onPageChanged: (int index) {
                    setState(() {
                      currenIndex = index;
                    });
                  },
                  children: [
                    itemIntro(
                      image: "assets/img.png",
                      color: Colors.red,
                    ),
                    itemIntro(
                      image: "assets/img_1.png",
                      color: Colors.blue,
                    ),
                    itemIntro(
                      image: "assets/img.png",
                      color: Colors.blue,
                    ),
                    itemIntro(
                      image: "assets/img_1.png",
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndecator(),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular Categerories",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w900)),
                      Text("See more", style: TextStyle(fontSize: 15),)
                    ],
                  )),
              Container(
                margin: EdgeInsets.all(18),
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    product(name: "Women fashion", img: "assets/img_2.png"),
                    product(
                      name: "Men fashion",
                      img: "assets/img_3.png",
                    ),
                    product(
                      name: "Child fashion",
                      img: "assets/img_4.png",
                    ),
                    product(
                      img: "assets/img_5.png",
                      name: " Food \n& Drink",
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    name(text: "For you", isActive: false),
                    name(text: "New Gadjet", isActive: true),
                    name(text: "Best Selling", isActive: false),
                    name(text: "Popular", isActive: false),
                  ],
                ),
              ),
              Container(
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  children:
                  images.map((e) => itemPost(e)).toList(),

                ),
              ),

            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifation',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.messenger_outlined, color: Colors.white,),
        onPressed: () {
        },
      ),
    );
  }

  Widget itemIntro({image, title, description, color}) {
    return Container(
      padding: EdgeInsets.only(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              height: 250,
              color: color,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }

  Widget _indecator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 12,
      width: 12,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isActive ? Colors.blue : Colors.grey),
    );
  }

  List<Widget> _buildIndecator() {
    List<Widget> indecators = [];
    for (int i = 0; i < 4; i++) {
      if (currenIndex == i) {
        indecators.add(_indecator(true));
      } else {
        indecators.add(_indecator(false));
      }
    }
    return indecators;
  }

  Widget product({img, name, icon}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          height: 85,
          width: 85,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(14)
          ),
        ),
        Container(
          margin: EdgeInsets.all(11),
          height: 35,
          width: 60,
          color: Colors.white12,
          child: Center(
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w900,),
            ),
          ),
        )
      ],
    );
  }

  Widget name({text, isActive}) {
    return Container(
      margin: EdgeInsets.only(left: 26,),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.blue : Colors.black45,
            fontSize: 20),
      ),
    );
  }
  Widget itemPost(image) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 90,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          )),
    );
  }
}
