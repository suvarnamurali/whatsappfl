import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class Camera extends StatefulWidget {
  Camera({Key? key}) : super(key: key);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  int index = 0;
  CameraController? _cameracontroller;
  var cameraValue;
  @override
  void initState() {
    super.initState();
    _cameracontroller = CameraController(cameras[index], ResolutionPreset.high);
    cameraValue = _cameracontroller?.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_cameracontroller!);
            }
            return const Center(child: CircularProgressIndicator());
          },
          future: cameraValue,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.insert_photo,
                  size: 50,
                  color: Colors.white,
                ),
                const InkWell(
                  child: Icon(
                    Icons.panorama_fish_eye,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        index = (index == 0) ? 1 : 0;

                        _cameracontroller = CameraController(
                            cameras[index], ResolutionPreset.high);
                        cameraValue = _cameracontroller?.initialize();
                      });
                    },
                    child: const Icon(
                      Icons.switch_camera_sharp,
                      size: 50,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
