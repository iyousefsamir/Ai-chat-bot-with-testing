import 'package:flutter/material.dart';

import '../utils/chat_colors.dart';

class ChatLoadingBubble extends StatefulWidget {
  const ChatLoadingBubble({Key? key}) : super(key: key);

  @override
  State<ChatLoadingBubble> createState() => _ChatLoadingBubbleState();
}

class _ChatLoadingBubbleState extends State<ChatLoadingBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(18);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.80,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: ChatColors.incomingBubble,
          borderRadius: BorderRadius.only(
            topLeft: radius,
            topRight: radius,
            bottomLeft: Radius.zero,
            bottomRight: radius,
          ),
        ),
        child: SizedBox(
          height: 18,
          width: 50,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  final startTime = index * 0.2;
                  final animationValue =
                      (_animationController.value - startTime) % 1.0;
                  final opacity = (1 - (animationValue * 2 - 1).abs())
                      .clamp(0, 1)
                      .toDouble();
                  final scale =
                      0.6 + (1 - (animationValue * 2 - 1).abs()) * 0.4;

                  return Opacity(
                    opacity: opacity,
                    child: Transform.scale(
                      scale: scale,
                      child: Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
