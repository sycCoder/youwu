import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class CubePage extends StatelessWidget {
  const CubePage({Key? key}) : super(key: key);

  // 获取3D模型
  Future<File> getObjFile(String urlPath, String savePath) async{
    Dio dio = Dio();
    final response = await dio.download(urlPath, savePath);
    return response.data;
  }
  Future<String> loadModel(String urlPath, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    String savePath = '${directory.path}/$fileName';
    // 下载.obj文件
    final file = await getObjFile(urlPath, savePath);
    // 加载.obj文件
    final path = file.path;
    return path;
  }
  // FutureBuilder(
  // future: loadModel(arguments['cubeUrl'], '${arguments['itemId']}.obj'),
  // builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
  // if (snapshot.hasData) {
  // final path = snapshot.data;
  // return Cube(
  // onSceneCreated: (Scene scene) {
  // scene.world.add(Object(fileName: path));
  // },
  // );
  // } else if (snapshot.hasError) {
  // print(snapshot.error);
  // return Text(snapshot.error.toString());
  // } else {
  // return const CircularProgressIndicator();
  // }
  // },
  //
  // )
  @override
  Widget build(BuildContext context) {


    final Map<String, dynamic> arguments = ModalRoute.of(context)?.settings.arguments as  Map<String, dynamic>;
    return Scaffold(
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(Object(fileName: 'assets/cube/bugatti.obj'));
          },
        )
      ),
    );
  }
}
