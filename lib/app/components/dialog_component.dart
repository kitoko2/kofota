import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:kofota/app/components/quote_component.dart';

class CustomPopUpDialog extends StatefulWidget {
  final String motivation;
  const CustomPopUpDialog({super.key, required this.motivation});

  @override
  State<CustomPopUpDialog> createState() => _CustomPopUpDialogState();
}

class _CustomPopUpDialogState extends State<CustomPopUpDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  late final Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 1.0, end: 0.0).animate(controller);

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShaderBuilder(
            assetKey: 'shaders/split_reversed_snap_effect_shader.glsl',
            (context, shader, child) => AnimatedBuilder(
              animation: animation,
              builder: (context, child) => animation.value == 0
                  ? child!
                  : AnimatedSampler(
                      (image, size, canvas) {
                        shader
                          ..setFloat(0, size.width)
                          ..setFloat(1, size.height)
                          ..setFloat(
                              2,
                              animation.value *
                                  0.8) // 0.8 makes the effect fit between 0 and 1
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
            child: Image.asset(
              "assets/watch-rb.png",
              width: 200,
            ),
          ),
          const SizedBox(
            width: 200,
            child: Text(
              "Vous avez liké une citation depuis votre apple watch",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 20),
          QuoteComponent(
              color: Colors.black,
              quote: widget.motivation.isNotEmpty
                  ? widget.motivation
                  : "Rappelez-vous pourquoi vous avez commencé, les raisons profondes qui vous poussent à avancer.",
              quoteFontSize: 20,
              quoteIconSize: 50),
          const SizedBox(height: 20),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Partager la citation",
                style: TextStyle(fontSize: 18),
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
