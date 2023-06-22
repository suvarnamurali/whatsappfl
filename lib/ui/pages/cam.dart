import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int index = 0;

  late CameraController _cameraController;
  Future<void>? cameraValue;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[index], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: cameraValue,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    mini: true,
                    onPressed: () {},
                    child: Icon(
                      Icons.insert_photo,
                      size: 30,
                      color: Colors.white,
                    )),
                Icon(Icons.panorama_fish_eye_outlined,
                    size: 80, color: Colors.white),
                FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    mini: true,
                    onPressed: () {
                      setState(() {
                        if (index < cameras.length) {
                          index = (index + 1) % cameras.length;
                          _cameraController = CameraController(
                              cameras[index], ResolutionPreset.high);
                          cameraValue = _cameraController.initialize();
                        }
                      });
                    },
                    child: Icon(Icons.switch_camera,
                        size: 30, color: Colors.white))
              ],
            ),
          ),
        )
      ],
    );
  }
}
