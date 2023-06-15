import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcons {
  static String svgHome(bool isSelected) {
    String color = isSelected ? "3364E0" : "A5A9B2";
    return '''
<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M14 20V17" stroke="#${color}" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M12.07 4.81997L5.14 10.37C4.36 10.99 3.86 12.3 4.03 13.28L5.36 21.24C5.6 22.66 6.96 23.81 8.4 23.81H19.6C21.03 23.81 22.4 22.65 22.64 21.24L23.97 13.28C24.13 12.3 23.63 10.99
 22.86 10.37L15.93 4.82997C14.86 3.96997 13.13 3.96997 12.07 4.81997Z"
  stroke="#${color}" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''';
  }

  static String svgSearch(bool isSelected) {
    String color = isSelected ? "3364E0" : "A5A9B2";
    return '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M10.5 18C14.6421 18 18 14.6421 18 10.5C18 6.35786 14.6421 3 10.5 3C6.35786 3 3 6.35786 3 10.5C3 14.6421 6.35786 18 10.5 18Z" stroke="#${color}" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M21 21L18 18" stroke="#${color}" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''';
  }

  static String svgCart(bool isSelected) {
    String color = isSelected ? "3364E0" : "A5A9B2";

    return '''
<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M10.81 4L7.19 7.63" stroke="#${color}" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M17.19 4L20.81 7.63" stroke="#${color}" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M4 9.84998C4 7.99998 4.99 7.84998 6.22 7.84998H21.78C23.01 7.84998 24 7.99998 24 9.84998C24 12 23.01 11.85 21.78 11.85H6.22C4.99 11.85 4 12 4 9.84998Z" stroke="#${color}" stroke-width="2"/>
<path d="M11.76 16V19.55" stroke="#${color}" stroke-width="2" stroke-linecap="round"/>
<path d="M16.36 16V19.55" stroke="#${color}" stroke-width="2" stroke-linecap="round"/>
<path d="M5.5 12L6.91 20.64C7.23 22.58 8 24 10.86 24H16.89C20 24 20.46 22.64 20.82 20.76L22.5 12" stroke="#${color}" stroke-width="2" stroke-linecap="round"/>
</svg>
''';
  }

  static String svgProfile(bool isSelected) {
    String color = isSelected ? "3364E0" : "A5A9B2";

    return '''
<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M14.12 14.78C14.05 14.77 13.96 14.77 13.88 14.78C12.12 14.72 10.72 13.28 10.72 11.51C10.72 9.69998 12.18 8.22998 14 8.22998C15.81 8.22998 17.28 9.69998 17.28 11.51C17.27 13.28 15.88 14.72 14.12 14.78Z" stroke="#${color}" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M20.74 21.38C18.96 23.01 16.6 24 14 24C11.4 24 9.04001 23.01 7.26001 21.38C7.36001 20.44 7.96001 19.52 9.03001 18.8C11.77 16.98 16.25 16.98 18.97 18.8C20.04 19.52 20.64 20.44 20.74 21.38Z" stroke="#${color}" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M14 24C19.5228 24 24 19.5228 24 14C24 8.47715 19.5228 4 14 4C8.47715 4 4 8.47715 4 14C4 19.5228 8.47715 24 14 24Z" stroke="#${color}" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>

''';
  }

  static String svgLocation = '''
<svg width="18" height="20" viewBox="0 0 18 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M11.5 8.50051C11.5 7.11924 10.3808 6 9.00051 6C7.61924 6 6.5 7.11924 6.5 8.50051C6.5 9.88076 7.61924 11 9.00051 11C10.3808 11 11.5 9.88076 11.5 8.50051Z" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.99951 19C7.80104 19 1.5 13.8984 1.5 8.56329C1.5 4.38664 4.8571 1 8.99951 1C13.1419 1 16.5 4.38664 16.5 8.56329C16.5 13.8984 10.198 19 8.99951 19Z" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''';
}
