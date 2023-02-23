// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'preview_page.dart';
class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
   CameraController? _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future takePicture() async {
    if (!_cameraController!.value.isInitialized ){
      return null;
    }
    if (_cameraController!.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController?.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController!.takePicture();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewPage(
                picture: picture,
              )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera() async {
    _cameraController =
        CameraController(CameraDescription(lensDirection: _isRearCameraSelected ?  CameraLensDirection.back : CameraLensDirection.front, name: '', sensorOrientation: 0), ResolutionPreset.high);
    try {
      await _cameraController?.initialize().then((value) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: [
            (_cameraController == null) ? Container() :
            (_cameraController!.value.isInitialized)
                ? CameraPreview(_cameraController!)
                : Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator())),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      color: Colors.black),
                  child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [

                         IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 30,
                          icon: Icon(
                              _isRearCameraSelected
                                  ? CupertinoIcons.switch_camera
                                  : CupertinoIcons.switch_camera_solid,
                              color: Colors.white),
                          onPressed: () {
                            setState(
                                    () => _isRearCameraSelected = !_isRearCameraSelected);
                          },
                        ),
                         IconButton(
                          onPressed: takePicture,
                          iconSize: 50,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.circle, color: Colors.white),
                        ),
                    const Spacer(),
                  ]),
                )),
          ]),
        ));
  }
}