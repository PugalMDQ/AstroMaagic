import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:permission_handler/permission_handler.dart';
import '../../Components/theme.dart';
import '../../Controller/VastuConsulting/GetPdfViewController.dart';

class PdfViewerPage extends StatefulWidget {
  final File file;
  final String url;

  const PdfViewerPage({
    Key? key,
    required this.file,
    required this.url,
  }) : super(key: key);

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    GetPdfViewController controller = Get.put(GetPdfViewController());

    final name = basename(widget.file.path);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
          centerTitle: true,
          backgroundColor: AppTheme.yellow,
          // actions: [
          //   IconButton(
          //     onPressed: () async {
          //       await saveFile(widget.url, "sample.pdf");
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(
          //           content: Text(
          //             'successfully saved to internal storage "PDF_Download" folder',
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         ),
          //       );
          //     },
          //     icon: const Icon(Icons.download_rounded),
          //   ),
          // ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              width: width,
              height: height * 0.13,
              decoration: BoxDecoration(
                  color: AppTheme.screenBackground,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppTheme.primaryColor, width: 2)),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.userDataProvider.getUserServicesData!.services.toString() ??
                              "",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          controller.userDataProvider.getUserServicesData!.remedy.toString() ??
                              "",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Price: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                controller.userDataProvider.getUserServicesData!.fees.toString() ??
                                    "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),

                        // Padding(
                        //   padding: EdgeInsets.only(left: width * 0.27),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Text(
                        //         controller.servicesData[index]!.createdDateTime
                        //             .toString() ??
                        //             "",
                        //         style: TextStyle(
                        //             fontSize: 12,
                        //             color: AppTheme.primaryColor,
                        //             fontWeight: FontWeight.w400),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 17),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       Text(
                  //         controller.servicesData[index]!.createdDateTime
                  //                 .toString() ??
                  //             "",
                  //         style: TextStyle(
                  //             fontSize: 12,
                  //             color: AppTheme.primaryColor,
                  //             fontWeight: FontWeight.w400),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              height: 400,
              child: PDFView(
                filePath: widget.file.path,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    await FlutterShare.shareFile(
                      title: 'Example share',
                      text: 'Example share text',
                      filePath: widget.file.path,
                    );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text(
                    //       'successfully saved to internal storage "PDF_Download" folder',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),);
                  },
                  icon: const Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () async {
                    await saveFile(widget.url, "sample.pdf");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'successfully saved to internal storage "PDF_Download" folder',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.download_rounded),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

  Future<bool> saveFile(String url, String fileName) async {
    try {
      if (await _requestPermission(Permission.storage)) {
        Directory? directory;
        directory = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath + "/PDF_Download";
        directory = Directory(newPath);

        File saveFile = File(directory.path + "/$fileName");
        if (kDebugMode) {
          print(saveFile.path);
        }
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        if (await directory.exists()) {
          await Dio().download(
            url,
            saveFile.path,
          );
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Future<File> getPdfFile(String pdfData) async {
    // Get the temporary directory path
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    // Create a temporary file
    File pdfFile = File('$tempPath/temp.pdf');

    // Write the PDF data to the file
    await pdfFile.writeAsBytes(Uint8List.fromList(pdfData.codeUnits));

    return pdfFile;
  }

}
