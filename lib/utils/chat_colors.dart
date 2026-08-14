import 'package:flutter/material.dart';

class ChatColors {
  ChatColors._();

  // Primary brand color used for outgoing bubbles/avatar
  static const Color primary = Color(0xFF4C7DFA);
  static const Color onPrimary = Colors.white;

  // Incoming message bubble background
  static const Color incomingBubble = Color(0xFFF2F3F5);

  // Outgoing message bubble background
  static const Color outgoingBubble = primary;

  // Input field background
  static const Color inputBackground = Color(0xFFFAFBFD);

  // Online indicator
  static const Color online = Color(0xFF2ECC71);
}
