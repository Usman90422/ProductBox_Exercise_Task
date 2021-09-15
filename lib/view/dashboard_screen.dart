import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/constants/text_style.dart';
import 'package:productbox_flutter_exercise/controller/imageController.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  ImageController imageController=ImageController();
  List? dataa;
  Random random=Random();

  @override
  void initState() {
    imageController.getImages();
  }

  @override
  Widget build(BuildContext context) {
    dataa=imageController.data;
    var ran=random.nextInt(100);
    var randm=random.nextInt(10);

    return SafeArea(
      child: Scaffold(
        body:ListView(
          children: [
            SizedBox(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(dataa==null? 0:10, (index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Container(
                          width: 80,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.black),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 2, color: Colors.red),
                                      image: DecorationImage(
                                        image: NetworkImage(dataa![index+ran]["download_url"]),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ),
            Divider(),
            Column(
              children: List.generate(dataa==null? 0:10, (index) {
                return  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 15, bottom: 15),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2,color: Colors.red ),
                                image: DecorationImage(
                                    image: NetworkImage(dataa![index+ran]["download_url"]),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(dataa![index+ran]["author"],style: knormalText3,),
                        ],
                      ),
                    ),
                    Container(
                      height:300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(dataa![index+randm]["download_url"]),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ],
                );

              }),
            ),
          ],
        ),
      ),
    );
  }


}

