import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:store_web/views/side_bar_screens/banner_screen.dart';
import 'package:store_web/views/side_bar_screens/buyers_screen.dart';
import 'package:store_web/views/side_bar_screens/category_screen.dart';
import 'package:store_web/views/side_bar_screens/orders_screen.dart';
import 'package:store_web/views/side_bar_screens/product_screen.dart';
import 'package:store_web/views/side_bar_screens/vendors_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = VendorsScreen();

  screenSelector(item){
    switch(item.route){
      case BuyersScreen.id:
      setState(() {
        _selectedScreen = BuyersScreen();
      });
      break;

      case VendorsScreen.id:
      setState(() {
        _selectedScreen = VendorsScreen();
      });
      break;
        case OrdersScreen.id:
      setState(() {
        _selectedScreen = OrdersScreen();
      });
      break;
      case CategoryScreen.id:
      setState(() {
        _selectedScreen = CategoryScreen();
      });
      break;

      case UploadBannerScreen.id:
      setState(() {
        _selectedScreen = UploadBannerScreen();
      });
      break;
        case ProductScreen.id:
      setState(() {
        _selectedScreen = ProductScreen();
      });
      break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Management"),
      ),
      body: _selectedScreen,
      sideBar: SideBar(items: [
        AdminMenuItem(title: "Vendors",route: VendorsScreen.id,icon: CupertinoIcons.person_3),
        AdminMenuItem(title: "Buyers",route: BuyersScreen.id,icon: CupertinoIcons.person),
        AdminMenuItem(title: "Orders",route: OrdersScreen.id,icon: CupertinoIcons.shopping_cart),
        AdminMenuItem(title: "Categories",route: CategoryScreen.id,icon: Icons.category),
        AdminMenuItem(title: "Upload Banners",route: UploadBannerScreen.id,icon: CupertinoIcons.plus),
        AdminMenuItem(title: "Products",route: ProductScreen.id,icon: CupertinoIcons.shopping_cart),
      ], selectedRoute: VendorsScreen.id,
      onSelected: (item) {
        screenSelector(item);
      },
      ),
      );
  }
}