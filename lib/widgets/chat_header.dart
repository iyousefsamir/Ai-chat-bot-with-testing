import 'package:flutter/material.dart';

import '../utils/chat_colors.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Row(
                children: [
                  Icon(Icons.smart_toy, color: ChatColors.primary, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'ChatGPT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ChatColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                '● Online',
                style: TextStyle(
                  fontSize: 12,
                  color: ChatColors.online,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.volume_up, color: Colors.black87),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black87),
          onPressed: () {},
        ),
      ],
    );
  }
}
