import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/common/components/btn.dart';
import 'package:bamtol_market_app/src/common/components/place_name_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class TradeLocationMap extends StatefulWidget {
  final String? label;
  final LatLng? location;
  const TradeLocationMap({
    super.key,
    this.label,
    this.location,
  });

  @override
  State<TradeLocationMap> createState() => _TradeLocationMapState();
}

class _TradeLocationMapState extends State<TradeLocationMap> {
  final _mapController = MapController();
  String lable = '';
  LatLng? location;

  @override
  void initState() {
    super.initState();
    lable = widget.label ?? '';
    location = widget.location;
  }

  Future<LatLng> _determinePosition() async {
    // Web에서는 기본 위치 반환 (서울 시청)
    if (kIsWeb) {
      return LatLng(37.5665, 126.9780);
    }
    
    // 모바일에서는 기본 위치 반환 (geolocator 제거)
    return LatLng(37.5665, 126.9780);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212123),
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: Get.back,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset('assets/svg/icons/back.svg'),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppFont(
                  '이웃과 만나서\n거래하고 싶은 장소를 선택해주세요.',
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
                SizedBox(height: 15),
                AppFont(
                  '만나서 거래할 때는 누구나 찾기 쉬운 공공장소가 좋아요.',
                  size: 13,
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<LatLng>(
              future: _determinePosition(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var myLocation = snapshot.data!;
                  if (location != null) {
                    myLocation = location!;
                  }
                  return FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: myLocation,
                      onPositionChanged: (position, hasGesture) {
                        if (hasGesture) {
                          setState(() {
                            lable = '';
                          });
                        }
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      ),
                      if (lable != '')
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color.fromARGB(255, 208, 208, 208),
                                ),
                                child: AppFont(
                                  lable,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                              const SizedBox(height: 100)
                            ],
                          ),
                        ),
                      Center(
                        child: SvgPicture.asset(
                          'assets/svg/icons/want_location_marker.svg',
                          width: 45,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: Get.mediaQuery.padding.bottom),
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Btn(
                                onTap: () async {
                                  var result = await Get.dialog<String>(
                                    useSafeArea: false,
                                    PlaceNamePopup(),
                                  );
                                  Get.back(result: {
                                    'label': result,
                                    'location': _mapController.camera.center
                                  });
                                },
                                child: const AppFont(
                                  '선택 완료',
                                  align: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom + 30),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff212123),
          child: Icon(Icons.location_searching),
        ),
      ),
    );
  }
}

class SimpleTradeLocationMap extends StatelessWidget {
  final String? lable;
  final LatLng myLocation;
  final int interactiveFlags;

  const SimpleTradeLocationMap({
    super.key,
    required this.myLocation,
    this.lable,
    this.interactiveFlags = InteractiveFlag.pinchZoom | InteractiveFlag.drag,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: myLocation,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        if (lable != '')
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromARGB(255, 208, 208, 208),
                  ),
                  child: AppFont(
                    lable!,
                    color: Colors.black,
                    size: 12,
                  ),
                ),
                const SizedBox(height: 100)
              ],
            ),
          ),
        Center(
          child: SvgPicture.asset(
            'assets/svg/icons/want_location_marker.svg',
            width: 45,
          ),
        ),
      ],
    );
  }
}
