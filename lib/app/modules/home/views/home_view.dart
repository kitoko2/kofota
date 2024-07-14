import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import 'package:get/get.dart';
import 'package:kofota/app/components/dialog_component.dart';
import 'package:kofota/app/components/quote_component.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
      vsync: this, duration: const Duration(seconds: 4), upperBound: 2);
  String motivation = "";
  @override
  void initState() {
    _initFlutterChannel();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reset();
        Get.bottomSheet(
            CustomPopUpDialog(
              motivation: motivation,
            ),
            isScrollControlled: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static String packageName = 'com.kitoko.watch';
  static const sendMotivationToFlutter = 'sendMotivationToFlutter';
  final channel = MethodChannel(packageName);

  Future<void> _initFlutterChannel() async {
    channel.setMethodCallHandler((call) async {
      print("Receive data  ------$call-----args : ${call.arguments}------");
      switch (call.method) {
        case sendMotivationToFlutter:
          final data = call.arguments["data"];
          setState(() {
            motivation = data["motivation"];
          });
          if (_controller.status == AnimationStatus.dismissed) {
            _controller.forward();
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShaderBuilder(
        assetKey: 'shaders/shader_ios.glsl',
        (context, shader, child) => AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => _controller.value == 0
              ? child!
              : AnimatedSampler(
                  (image, size, canvas) {
                    shader
                      ..setFloat(0, size.width)
                      ..setFloat(1, size.height)
                      ..setFloat(
                          2,
                          _controller.value *
                              1) // 0.8 makes the effect fit between 0 and 1
                      ..setImageSampler(0, image);

                    final paint = Paint()..shader = shader;
                    canvas.drawRect(
                      Rect.fromLTWH(0, 0, size.width, size.height),
                      paint,
                    );
                  },
                  child: child!,
                ),
          child: child,
        ),
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color(0xFF4F4F4F),
          ),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF7F82D6),
                      Color(0xFF61BAF4)
                    ], // Les couleurs du gradient
                    begin: Alignment
                        .topLeft, // Commence le gradient en haut à gauche
                    end: Alignment
                        .bottomRight, // Termine le gradient en bas à droite
                  ),
                ),
              ),
              Scaffold(
                  extendBodyBehindAppBar: true,
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    title: const Text('kofɔta'),
                    forceMaterialTransparency: true,
                    actions: [
                      IconButton(
                          tooltip: "Play animation ios",
                          onPressed: () {
                            if (_controller.status ==
                                AnimationStatus.dismissed) {
                              _controller.forward();
                            }
                          },
                          icon: const Icon(Icons.play_circle_filled))
                    ],
                  ),
                  body: Stack(
                    children: [
                      Opacity(
                        opacity: .3,
                        child: Image.asset(
                          "assets/bg.png",
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: const QuoteComponent(
                            color: Colors.white,
                            quote:
                                "Rappelez-vous pourquoi vous avez commencé, les raisons profondes qui vous poussent à avancer.",
                            quoteFontSize: 30,
                            quoteIconSize: 50),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
