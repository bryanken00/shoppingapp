import 'package:flutter/material.dart';
import 'package:shoppingapp/components/button_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // index
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  final List<Widget> _pages = [
    // ShopePage
    const ShopPage(),

    //CartPage
    const CartPage(),
  ];

  @override
  Widget build(Object context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: MyButtonNavBar(
          onTabChange: (index) => navigateBottomBar(index!),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // Logo
                  const SizedBox(height: 40),
                  Image.asset('lib/images/KBN_icon.png',
                      height: 150, color: Colors.white),

                  // divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Divider(
                      color: Colors.grey[700],
                    ),
                  ),

                  // Buttons
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.home, color: Colors.white),
                      title: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.info, color: Colors.white),
                      title: Text(
                        'About',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25, bottom: 25),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
