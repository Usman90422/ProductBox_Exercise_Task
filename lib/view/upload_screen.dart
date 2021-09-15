import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/constants/text_style.dart';
import 'package:productbox_flutter_exercise/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/model/Provider/ImageProvider.dart';
import 'package:productbox_flutter_exercise/widgets/DoneButton.dart';
import 'package:productbox_flutter_exercise/widgets/Indicators.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

  ImagesProvider? provider;

  @override
  void initState() {
    Provider.of<ImagesProvider>(context, listen: false);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   provider = Provider.of<ImagesProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.themeData.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: ()
          {
            setState(() {
             provider!.clear();
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: MyThemeData.themeData.backgroundColor,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Upload Documents",
              style: kheadingText,
            ),
            SizedBox(height: 20,),
            Indicators(flag1: provider!.flag1, flag2: provider!.flag2, flag3: provider!.flag3, flag4: provider!.flag4),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  provider!.image1 == null
                      ? provider!.doc == null
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(child: Text("Choose")),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            provider!.getImageFromCamera(1);
                                          },
                                          splashColor: MyThemeData
                                              .themeData.primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(Icons.camera,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Camera"),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            provider!.getImageFromGallery();
                                          },
                                          splashColor: MyThemeData
                                              .themeData.primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(Icons.image,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Gallery"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Material(
                                  child: Container(
                                      color: Colors.black,
                                      height: size.height,
                                      width: size.width,
                                      child: provider!.doc == null
                                          ? SizedBox()
                                          : Image.file(
                                        provider!.doc!,
                                            )),
                                );
                              })
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Material(
                              child: Container(
                                color: Colors.black,
                                height: size.height,
                                width: size.width,
                                child: provider!.image1 == null
                                    ? SizedBox()
                                    : Image.file(provider!.image1!),
                              ),
                            );
                          });
                });
              },
              child: Container(
                height: 60,
                width: size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile Picture",
                      style: knormalText,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: provider!.image1 == null
                          ? provider!.doc == null
                              ? SizedBox()
                              : Image.file(
                        provider!.doc!,
                                  fit: BoxFit.cover,
                                )
                          : Image.file(
                        provider!.image1!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  provider!.image2 == null
                      ? provider!.doc1 == null
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(child: Text("Choose")),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            provider!.getImageFromCamera(2);
                                          },
                                          splashColor: MyThemeData
                                              .themeData.primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(Icons.camera,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Camera"),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            provider!.OpenExplorer(1);
                                          },
                                          splashColor: MyThemeData
                                              .themeData.primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(Icons.image,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Explorer"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Material(
                                  child: Container(
                                      color: Colors.black,
                                      height: size.height,
                                      width: size.width,
                                      child: provider!.doc1 == null
                                          ? SizedBox()
                                          : provider!.file1!.extension == "jpeg" ||
                                          provider!.file1!.extension == "png" ||
                                          provider!.file1!.extension == "jpg"
                                              ? Image.file(
                                        provider!.doc1!,
                                                )
                                              : SfPdfViewer.file(provider!.doc1!)),
                                );
                              })
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Material(
                              child: Container(
                                color: Colors.black,
                                height: size.height,
                                width: size.width,
                                child: provider!.image2 == null
                                    ? SizedBox()
                                    : Image.file(provider!.image2!),
                              ),
                            );
                          });
                });
              },
              child: Container(
                height: 60,
                width: size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Driving License",
                      style: knormalText,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: provider!.image2 == null
                          ? provider!.doc1 == null
                              ? SizedBox()
                              : provider!.file1!.extension == "jpeg" ||
                          provider!.file1!.extension == "png" ||
                          provider!.file1!.extension == "jpg"
                                  ? Image.file(
                                     provider!.doc1!,
                                      fit: BoxFit.cover,
                                    )
                                  : SfPdfViewer.file(provider!.doc1!)
                          : Image.file(
                        provider!.image2!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  provider!.image3 == null
                      ? provider!.doc2 == null
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(child: Text("Choose")),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            provider!.getImageFromCamera(3);
                                          },
                                          splashColor: MyThemeData
                                              .themeData.primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(Icons.camera,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Camera"),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            provider!.OpenExplorer(2);
                                          },
                                          splashColor: MyThemeData
                                              .themeData.primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(Icons.image,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Gallery"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Material(
                                  child: Container(
                                      color: Colors.black,
                                      height: size.height,
                                      width: size.width,
                                      child: provider!.doc2 == null
                                          ? SizedBox()
                                          : provider!.file2!.extension == "jpeg" ||
                                          provider!.file2!.extension == "png" ||
                                          provider!.file2!.extension == "jpg"
                                              ? Image.file(
                                                  provider!.doc2!,
                                                )
                                              : SfPdfViewer.file(provider!.doc2!)),
                                );
                              })
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Material(
                              child: Container(
                                color: Colors.black,
                                height: size.height,
                                width: size.width,
                                child: provider!.image3 == null
                                    ? SizedBox()
                                    : Image.file(provider!.image3!),
                              ),
                            );
                          });
                });
              },
              child: Container(
                height: 60,
                width: size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Certificate",
                      style: knormalText,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: provider!.image3 == null
                          ? provider!.doc2 == null
                              ? SizedBox()
                              : provider!.file2!.extension == "jpeg" ||
                          provider!.file2!.extension == "png" ||
                          provider!.file2!.extension == "jpg"
                                  ? Image.file(
                                      provider!.doc2!,
                                      fit: BoxFit.cover,
                                    )
                                  : SfPdfViewer.file(provider!.doc2!)
                          : Image.file(
                              provider!.image3!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  provider!.image4== null
                      ? provider!.doc3 == null
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Center(child: Text("Choose")),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            provider!.getImageFromCamera(4);
                                          },
                                          splashColor: MyThemeData
                                              .themeData.primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(Icons.camera,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Camera"),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            provider!.OpenExplorer(3);
                                          },
                                          splashColor: MyThemeData
                                              .themeData.primaryColor,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(Icons.image,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Gallery"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Material(
                                  child: Container(
                                      color: Colors.black,
                                      height: size.height,
                                      width: size.width,
                                      child: provider!.doc3 == null
                                          ? SizedBox()
                                          : provider!.file3!.extension == "jpeg" ||
                                          provider!.file3!.extension == "png" ||
                                          provider!.file3!.extension == "jpg"
                                              ? Image.file(
                                                  provider!.doc3!,
                                                )
                                              : SfPdfViewer.file(provider!.doc3!)),
                                );
                              })
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Material(
                              child: Container(
                                color: Colors.black,
                                height: size.height,
                                width: size.width,
                                child: provider!.image4== null
                                    ? SizedBox()
                                    : Image.file(provider!.image4!),
                              ),
                            );
                          });
                });
              },
              child: Container(
                height: 60,
                width: size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Passport",
                      style: knormalText,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: provider!.image4== null
                          ? provider!.doc3 == null
                              ? SizedBox()
                              : provider!.file3!.extension == "jpeg" ||
                          provider!.file3!.extension == "png" ||
                          provider!.file3!.extension == "jpg"
                                  ? Image.file(
                                      provider!.doc3!,
                                      fit: BoxFit.cover,
                                    )
                                  : SfPdfViewer.file(provider!.doc3!)
                          : Image.file(
                              provider!.image4!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            DoneButton(size: size, flag1: provider!.flag1, flag2: provider!.flag2, flag3: provider!.flag3, flag4: provider!.flag4),
          ],
        ),
      ),
    ));
  }
}

