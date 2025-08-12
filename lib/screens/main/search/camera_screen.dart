import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:rockelcoks_market/screens/main/search/qr_code_camera.dart';
import 'package:rockelcoks_market/utils/app_button_auth.dart';
import 'package:rockelcoks_market/utils/custom_gradient_tabBarIndicator.dart';
import 'dart:io';
import 'package:rockelcoks_market/utils/app_styles.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with SingleTickerProviderStateMixin {
  late List<CameraDescription> cameras;
  late CameraController controller;
  bool isCameraInitialized = false;
  bool showSearchButton = true;

  bool cameraGranted = false;
  bool galleryGranted = false;

  late TabController _tabController;
  List<AssetEntity> galleryImages = [];
  List<AssetEntity> recentImages = [];
  List<AssetEntity> screenshotImages = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    requestAllPermissions();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      controller = CameraController(
        cameras[0],
        ResolutionPreset.high,
        enableAudio: false, 
      );
      await controller.initialize();
      setState(() {
        isCameraInitialized = true;
      });
    }
  }

  Future<void> requestAllPermissions() async {
    final camStatus = await Permission.camera.request();
    cameraGranted = camStatus.isGranted;

    final photoPermission = await PhotoManager.requestPermissionExtend();
    galleryGranted = photoPermission.isAuth;

    setState(() {}); 

    if (cameraGranted) {
      await initializeCamera();
    }
    if (galleryGranted) {
      await loadImages();
    }
  }

  Future<void> loadImages() async {
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(type: RequestType.image);

    List<AssetEntity> allImages = [];
    List<AssetEntity> screenshots = [];

    for (var album in albums) {
      final assets = await album.getAssetListRange(start: 0, end: 100);
      if (album.name.toLowerCase().contains('screenshot')) {
        screenshots.addAll(assets);
      } else {
        allImages.addAll(assets);
      }
    }

    allImages = allImages.toSet().toList();
    allImages.sort((a, b) => b.createDateTime.compareTo(a.createDateTime));

    setState(() {
      galleryImages = allImages;
      recentImages = allImages.take(12).toList();
      screenshotImages = screenshots;
    });
  }

  @override
  void dispose() {
    if (isCameraInitialized) controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              child: !cameraGranted
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Дайте доступ к камере", style: AppStyles.getAppTextStyle(
                               color: Colors.white,
                               fontSize: 20,
                               fontWeight: FontWeight.w500,
                               context: context,
                               fontFamily: 'roboto',
                             ),
                            ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              final status = await Permission.camera.request();
                              if (status.isGranted) {
                                setState(() => cameraGranted = true);
                                await initializeCamera();
                              }
                            },
                              style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.grey, 
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10),
                               ),
                             ),
                           child: Text("Разрешить",  style: AppStyles.getAppTextStyle(
                               color: Colors.black,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                               context: context,
                               fontFamily: 'roboto',
                             ),
                           ),
                          )
                        ],
                      ),
                    )
                  : (isCameraInitialized
                      ? Stack(
                          fit: StackFit.expand,
                          children: [
                            CameraPreview(controller),
                            QRScannerOverlay(overlayColour: Colors.transparent),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 40, left: 10),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/icons/ic_left_white.png',
                                    width: 10,
                                    height: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                            if (showSearchButton)
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30, right: 10),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green.withOpacity(0.3),
                                      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      minimumSize: Size(150, 60),
                                    ),
                                    child: Text(
                                      'Поиск',
                                      style: AppStyles.getAppTextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        context: context,
                                        fontFamily: 'roboto',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )
                      : Center(child: CircularProgressIndicator())),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
               Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft, 
                    child: Text(
                      'Загрузить с телефона',
                      style: AppStyles.getAppTextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        context: context,
                        fontFamily: 'roboto',
                      ),
                    ),
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicator: CustomGradientTabIndicator(
                    gradient: LinearGradient(
                      colors: [Color(0xff035D41), Color(0xff75F94C)],
                    ),
                    strokeWidth: 2,
                    indicatorWidth: 0.8,
                    bottomPadding: 10,
                  ),
                  dividerHeight: 0,
                  tabs: [
                    Tab(text: 'Галерея'),
                    Tab(text: 'Недавнее'),
                    Tab(text: 'Скриншоты'),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: !galleryGranted
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Дайте доступ к фото", style: AppStyles.getAppTextStyle(
                               color: Colors.black,
                               fontSize: 20,
                               fontWeight: FontWeight.w500,
                               context: context,
                               fontFamily: 'roboto',
                             ),
                            ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              final permission = await PhotoManager.requestPermissionExtend();
                              if (permission.isAuth) {
                                setState(() => galleryGranted = true);
                                await loadImages();
                              }
                            },
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.grey, 
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10),
                               ),
                             ),
                            child: Text("Разрешить",  style: AppStyles.getAppTextStyle(
                               color: Colors.black,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                               context: context,
                               fontFamily: 'roboto',
                             ),
                           ),
                          )
                        ],
                      ),
                    )
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        buildImageGrid(galleryImages),
                        buildImageGrid(recentImages),
                        buildImageGrid(screenshotImages),
                      ],
                    ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: CustomButtonAuth(
                text: 'Выбрать',
                textColor: const Color(0xff505050),
                backgroundColor: const Color(0xffA8A8A8),
                borderColor: Colors.transparent,
                borderRadius: 10,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                fontFamily: 'agdasima',
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageGrid(List<AssetEntity> images) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return FutureBuilder<File?>(
            future: images[index].file,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                return Image.file(snapshot.data!, fit: BoxFit.cover);
              }
              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}

