import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petterns_getx/controllers/create_controller.dart';



class CreatePage extends StatefulWidget {
  static final String id = "create_page";
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  final CreateController _controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create post'),
      ),
      backgroundColor: Colors.white,
      body: Obx(
            () => Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _controller.titleController(),
                    decoration: InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(right: 15, left: 15),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _controller.bodyController(),
                    decoration: InputDecoration(
                      labelText: "Body",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          right: 15, top: 15, bottom: 50, left: 15),
                    ),
                    maxLines: 7,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      child: FlatButton(
                        onPressed: (){
                          _controller.apiPostCreate();
                        },
                        color: Colors.blue,
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            _controller.isLoading() ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
