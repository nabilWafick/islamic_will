import 'package:flutter/material.dart';

class AppColors {
// Primary Colors
  static const Color primary = Color(0xFF0C7B7B);
  static const Color secondary = Color(0xFFE7DFD3);
// Background Colors
  static const Color background = Color(0xFFF2ECE4);
  static const Color darkBackground = Color(0xFF1A2235);
// Text Colors
  static const Color primaryText = Color(0xFF333333);
  static const Color secondaryText = Color(0xFF666666);
  static const Color lightText = Color(0xFFFFFFFF);
  static const Color darkModeSecondaryText = Color(0xFFCCCCCC);
// Card/UI Elements
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardIconBackground = Color(0xFFE8F4F4);
  static const Color iconColor = Color(0xFF0C7B7B);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color activeElement = Color(0xFFD7C8B6);
// Dark Mode Specific
  static const Color darkModeSurface = Color(0xFF2A3446);
  static const Color darkModeCardBackground = Color(0xFF2A3446);
  static const Color darkModeBorderColor = Color(0xFF3A4456);
// Button Colors
  static const Color buttonPrimary = Color(0xFF0C7B7B);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const List<Color> backgroundGradient = [
    Color(0xFF4A6DE5),
    Color(0xFF5173E8),
    Color(0xFF7E99F4),
  ];
}

class AppSvgs {
  static const accountsTransfert = 'assets/svgs/accounts_transfert.svg';
  static const logo = 'assets/svgs/logo.svg';
  static const walletCards = 'assets/svgs/wallet_cards.svg';
  static const withdrawal = 'assets/svgs/withdrawal.svg';
}

class AppPngs {
  static const handsWallets = 'assets/pngs/hands_wallet.png';
  static const hands = 'assets/pngs/hands.png';
  static const tractor = 'assets/pngs/tractor.png';
}

class AppDimensions {
// Card Radius
  static const double cardRadius = 16.0;

// Icon Card Radius (smaller radius for icon background)
  static const double iconCardRadius = 12.0;

// Card circular border
  static BorderRadius cardBorder = BorderRadius.circular(cardRadius);

// Icon Card circular border
  static BorderRadius iconCardBorder = BorderRadius.circular(iconCardRadius);

// Horizontal padding
  static double horizontalPadding = 16.0;

// Vertical padding
  static double verticalPadding = 12.0;

// Page Padding
  static EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: horizontalPadding,
    vertical: verticalPadding,
  );

// Card Padding
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
// Content Padding (used inside cards)
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
// Item Spacing
  static const double itemSpacing = 12.0;
// Grid Spacing
  static const double gridSpacing = 16.0;
// Button Height
  static const double buttonHeight = 48.0;
// Search Bar Height
  static const double searchBarHeight = 48.0;
// Icon Size
  static const double iconSize = 24.0;
// Icon Container Size
  static const double iconContainerSize = 48.0;
// Text Sizes
  static const double headingTextSize = 20.0;
  static const double titleTextSize = 16.0;
  static const double bodyTextSize = 14.0;
  static const double captionTextSize = 12.0;
}

class AppValues {
  static const padding = 24.0;
  static const cardRadius = 16.0;
  static var cardMidRadius = cardRadius * .5;
  static var circularBorder = BorderRadius.circular(cardRadius);
  static var midCircularBorder = BorderRadius.circular(cardRadius);
}
