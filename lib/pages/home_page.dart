import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petterns_getx/controllers/home_controller.dart';
import 'package:petterns_getx/pages/create_page.dart';
import 'package:petterns_getx/views/item_of_post.dart';


class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MobX"),
        ),
        body: Obx(
              () => Stack(
            children: [
              ListView.builder(
                itemCount: _controller.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(_controller, _controller.items[index]);
                },
              ),
              _controller.isLoading()
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Get.to(CreatePage());
          },
          child: Icon(Icons.add),
        ));
  }

}