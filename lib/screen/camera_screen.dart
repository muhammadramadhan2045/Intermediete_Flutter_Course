import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key, required this.cameras});
  final List<CameraDescription> cameras;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _isCameraInitialized = false;

  CameraController? controller;

  @override
  void initState() {
    onNewCameraSelected(widget.cameras.first);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Ambil Gambar"),
            actions: [
              IconButton(
                onPressed: () => _onCameraSwitch(),
                icon: const Icon(Icons.cameraswitch_outlined),
                tooltip: "switch camera",
              ),
            ],
          ),
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _isCameraInitialized
                    ? CameraPreview(controller!)
                    : const Center(child: CircularProgressIndicator()),
                Align(
                  alignment: const Alignment(0, 0.95),
                  child: _actionWidget(),
                )
              ],
            ),
          ),
        ));
  }

  Widget _actionWidget() {
    return FloatingActionButton(
      heroTag: "take_picture",
      tooltip: "ambil gambar",
      onPressed: _onCameraButtonClick,
      child: const Icon(Icons.camera_alt),
    );
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    final cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
    );

    await previousCameraController?.dispose();

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        controller = cameraController;
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  Future<void> _onCameraButtonClick() async {
    final navigator = Navigator.of(context);
    final image = await controller?.takePicture();
    navigator.pop(image);
  }

  void _onCameraSwitch() {
    final lensDirection = controller?.description.lensDirection;
    onNewCameraSelected(
      widget.cameras
          .firstWhere((element) => element.lensDirection != lensDirection),
    );
  }
}
