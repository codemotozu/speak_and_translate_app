// import 'dart:math' show pi, cos, sin, atan2;
// import 'dart:ui';

// import 'package:flutter/material.dart';

// class ArchitectureDiagram extends StatelessWidget {
//   const ArchitectureDiagram({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Increase aspect ratio to provide more vertical space
//     return AspectRatio(
//       aspectRatio: 14 / 20, // More vertical space than 16/12
//       // aspectRatio: 34 / 28, // More vertical space than 16/12
//       child: CustomPaint(
//         painter: ArchitectureDiagramPainter(),
//         child: Stack(
//           children: [
//             // Flutter Mobile Client Box - Left side
//             Positioned(
//               left: 40,
//               top: 20,
//               child: _buildComponentBox(
//                 title: 'Flutter Mobile Client',
//                 items: [
//                   'UI Components',
//                   'Riverpod State Management',
//                   'Audio Recording/Playback',
//                   'Audio Playback (just_audio)',
//                   'HTTP Client for API Calls',
//                 ],
//                 boxWidth: 250,
//                 itemColor: Colors.blue,
//                 itemBgColor: Colors.blue.withOpacity(0.1),
//                 itemVerticalSpacing: 12, // More spacing between items
//               ),
//             ),
            
//             // Python FastAPI Backend Box - Center with more spacing
//             Positioned(
//               left: 0,
//               right: 0,
//               top: 380, // Significantly moved down to create more vertical separation
//               bottom: 100,
//               child: Center(
//                 child: _buildComponentBox(
//                   title: 'Python FastAPI Backend',
//                   items: [
//                     'Translation Service',
//                     'Speech Recognition',
//                     'Text-to-Speech Service',
//                     'Gemini AI Translation Processing',
//                   ],
//                   boxWidth: 300,
//                   itemColor: Colors.green,
//                   itemBgColor: Colors.green.withOpacity(0.1),
//                   itemVerticalSpacing: 12,
//                 ),
//               ),
//             ),
            
//             // AI Services Box - Right side
//             Positioned(
//               right: 40,
//               top: 20,
//               child: _buildComponentBox(
//                 title: 'AI Services',
//                 items: [
//                   'Azure Speech Services',
//                   'Google Gemini 2.0',
//                   'Picovoice Wake Word',
//                   'Azure Container Apps',
//                 ],
//                 boxWidth: 250,
//                 itemColor: Colors.purple,
//                 itemBgColor: Colors.purple.withOpacity(0.1),
//                 itemVerticalSpacing: 12,
//               ),
//             ),
            
//             // Deployment Infrastructure Box - Bottom with more spacing
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 20, // Keep at bottom with good spacing
//               child: Center(
//                 child: _buildComponentBox(
//                   title: 'Deployment Infrastructure',
//                   items: [
//                     'GitHub Actions CI/CD',
//                     'Docker Hub Registry',
//                     'Azure Cloud Hosting',
//                   ],
//                   boxWidth: 650, // Wider to give more horizontal space
//                   isHorizontal: true,
//                   horizontalSpacing: 20, // More space between horizontal items
//                   itemColor: Colors.orange,
//                   itemBgColor: Colors.orange.withOpacity(0.1),
//                 ),
//               ),
//             ),
            
//             // Connection labels with better positioning
//             Positioned(
//               left: 300,
//               top: 90, // Adjusted based on new box positions
//               child: _buildConnectionLabel('HTTP Requests'),
//             ),
//             Positioned(
//               left: 300,
//               top: 160, // Adjusted based on new box positions
//               child: _buildConnectionLabel('JSON/Audio Responses'),
//             ),
//             Positioned(
//               right: 300,
//               top: 90, // Adjusted based on new box positions
//               child: _buildConnectionLabel('API Calls'),
//             ),
//             Positioned(
//               right: 300,
//               top: 160, // Adjusted based on new box positions
//               child: _buildConnectionLabel('Cloud Services'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
  
//   Widget _buildConnectionLabel(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.w500,
//           color: Colors.grey[700],
//         ),
//       ),
//     );
//   }

//   Widget _buildComponentBox({
//     required String title,
//     required List<String> items,
//     required double boxWidth,
//     required Color itemColor,
//     required Color itemBgColor,
//     bool isHorizontal = false,
//     double itemVerticalSpacing = 8,
//     double horizontalSpacing = 10,
//   }) {
//     return Container(
//       width: boxWidth,
//       padding: const EdgeInsets.all(20), // Increased padding
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade200),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 19, // Slightly larger font
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16), // More spacing after title
//           if (isHorizontal)
//             Wrap(
//               spacing: horizontalSpacing,
//               runSpacing: horizontalSpacing,
//               children: items.map((item) => _buildComponentItem(
//                 item, 
//                 itemColor: itemColor,
//                 itemBgColor: itemBgColor,
//                 isHorizontal: true,
//               )).toList(),
//             )
//           else
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: items.map((item) => Padding(
//                 padding: EdgeInsets.only(bottom: itemVerticalSpacing),
//                 child: _buildComponentItem(
//                   item, 
//                   itemColor: itemColor,
//                   itemBgColor: itemBgColor
//                 ),
//               )).toList(),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildComponentItem(
//     String text, {
//     required Color itemColor,
//     required Color itemBgColor,
//     bool isHorizontal = false,
//   }) {
//     return Container(
//       width: isHorizontal ? null : double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // More padding
//       decoration: BoxDecoration(
//         color: itemBgColor,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: itemColor.withOpacity(0.2)), // Subtle border
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 15, // Slightly larger font
//           color: itemColor,
//           fontWeight: FontWeight.w500,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

// class ArchitectureDiagramPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.grey.shade400
//       ..strokeWidth = 1.8 // Slightly thicker lines
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     // Draw dashed lines for connections with adjusted positions
//     // From Flutter Client to Backend
//     _drawDashedLine(
//       canvas, 
//       Offset(165, 170), // Adjusted based on new box positions
//       Offset(350, 280), // To Backend
//       paint,
//     );
    
//     // From Backend to Flutter Client
//     _drawDashedLine(
//       canvas, 
//       Offset(350, 310), // From Backend
//       Offset(165, 200), // To Flutter Client
//       paint,
//     );
    
//     // From Backend to AI Services
//     _drawDashedLine(
//       canvas, 
//       Offset(450, 280), // From Backend
//       Offset(635, 170), // To AI Services
//       paint,
//     );
    
//     // From AI Services to Backend
//     _drawDashedLine(
//       canvas, 
//       Offset(635, 200), // From AI Services
//       Offset(450, 310), // To Backend
//       paint,
//     );
    
//     // Draw vertical connections to Deployment Infrastructure
//     _drawDashedLine(
//       canvas, 
//       Offset(size.width / 2, 380), // From Backend
//       Offset(size.width / 2, 440), // To Deployment
//       paint,
//     );
//   }
  
//   void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
//     final path = Path()
//       ..moveTo(start.dx, start.dy)
//       ..lineTo(end.dx, end.dy);
      
//     final dashSize = 5; // Larger dash size
//     final gapSize = 5; // Larger gap size
    
//     canvas.drawPath(
//       dashPath(
//         path,
//         dashArray: CircularIntervalList<double>([dashSize.toDouble(), gapSize.toDouble()]),
//       ),
//       paint,
//     );
    
//     // Draw arrowhead
//     final angle = atan2(end.dy - start.dy, end.dx - start.dx);
//     const arrowSize = 10.0; // Larger arrowhead
    
//     final arrowPath = Path()
//       ..moveTo(end.dx, end.dy)
//       ..lineTo(
//         end.dx - arrowSize * cos(angle - pi / 6),
//         end.dy - arrowSize * sin(angle - pi / 6),
//       )
//       ..lineTo(
//         end.dx - arrowSize * cos(angle + pi / 6),
//         end.dy - arrowSize * sin(angle + pi / 6),
//       )
//       ..close();
      
//     canvas.drawPath(arrowPath, Paint()..color = Colors.grey.shade500..style = PaintingStyle.fill);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

// // Utility class to draw dashed lines
// class CircularIntervalList<T> {
//   final List<T> _values;
//   int _index = 0;

//   CircularIntervalList(this._values);

//   T get next {
//     if (_index >= _values.length) {
//       _index = 0;
//     }
//     return _values[_index++];
//   }
// }

// Path dashPath(
//   Path source, {
//   required CircularIntervalList<double> dashArray,
// }) {
//   final Path dest = Path();
//   for (final PathMetric metric in source.computeMetrics()) {
//     double distance = 0;
//     bool draw = true;
//     while (distance < metric.length) {
//       final double len = dashArray.next;
//       if (draw) {
//         dest.addPath(
//           metric.extractPath(distance, distance + len),
//           Offset.zero,
//         );
//       }
//       distance += len;
//       draw = !draw;
//     }
//   }
//   return dest;
// }






















// import 'dart:math' show pi, cos, sin, atan2;
// import 'dart:ui';

// import 'package:flutter/material.dart';

// class ArchitectureDiagram extends StatelessWidget {
//   const ArchitectureDiagram({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Increase aspect ratio to provide more vertical space
//     return AspectRatio(
//       aspectRatio: 14 / 20, // More vertical space than 16/12
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           // Calculate positions based on available size for more responsive layout
//           final width = constraints.maxWidth;
//           final height = constraints.maxHeight;
//           final centerX = width / 2;
          
//           // Store positions for painter to use
//           final positions = {
//             'flutterClientRight': 290.0,
//             'flutterClientCenter': 165.0,
//             'backendCenter': centerX,
//             'backendTop': 200.0,
//             'aiServicesLeft': width - 290.0,
//             'aiServicesCenter': width - 165.0,
//           };
          
//           return CustomPaint(
//             painter: ArchitectureDiagramPainter(positions: positions),
//             child: Stack(
//               children: [
//                 // Flutter Mobile Client Box - Left side
//                 Positioned(
//                   left: 40,
//                   top: 20,
//                   child: _buildComponentBox(
//                     title: 'Flutter Mobile Client',
//                     items: [
//                       'UI Components',
//                       'Riverpod State Management',
//                       'Audio Recording/Playback',
//                       'Audio Playback (just_audio)',
//                       'HTTP Client for API Calls',
//                     ],
//                     boxWidth: 250,
//                     itemColor: Colors.blue,
//                     itemBgColor: Colors.blue.withOpacity(0.1),
//                     itemVerticalSpacing: 12, // More spacing between items
//                   ),
//                 ),
                
//                 // Python FastAPI Backend Box - Center with more spacing
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   top: 300, // Positioned lower to make room for connection lines
//                   child: Center(
//                     child: _buildComponentBox(
//                       title: 'Python FastAPI Backend',
//                       items: [
//                         'Translation Service',
//                         'Speech Recognition',
//                         'Text-to-Speech Service',
//                         'Gemini AI Translation Processing',
//                       ],
//                       boxWidth: 300,
//                       itemColor: Colors.green,
//                       itemBgColor: Colors.green.withOpacity(0.1),
//                       itemVerticalSpacing: 12,
//                     ),
//                   ),
//                 ),
                
//                 // AI Services Box - Right side
//                 Positioned(
//                   right: 40,
//                   top: 20,
//                   child: _buildComponentBox(
//                     title: 'AI Services',
//                     items: [
//                       'Azure Speech Services',
//                       'Google Gemini 2.0',
//                       'Picovoice Wake Word',
//                       'Azure Container Apps',
//                     ],
//                     boxWidth: 250,
//                     itemColor: Colors.purple,
//                     itemBgColor: Colors.purple.withOpacity(0.1),
//                     itemVerticalSpacing: 12,
//                   ),
//                 ),
                
//                 // Deployment Infrastructure Box - Bottom with more spacing
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   bottom: 20, // Keep at bottom with good spacing
//                   child: Center(
//                     child: _buildComponentBox(
//                       title: 'Deployment Infrastructure',
//                       items: [
//                         'GitHub Actions CI/CD',
//                         'Docker Hub Registry',
//                         'Azure Cloud Hosting',
//                       ],
//                       boxWidth: 650, // Wider to give more horizontal space
//                       isHorizontal: true,
//                       horizontalSpacing: 20, // More space between horizontal items
//                       itemColor: Colors.orange,
//                       itemBgColor: Colors.orange.withOpacity(0.1),
//                     ),
//                   ),
//                 ),
                
//                 // Connection labels with better positioning
//                 // Between Flutter Client and Backend
//                 Positioned(
//                   left: 240,
//                   top: 100,
//                   child: _buildConnectionLabel('HTTP Requests'),
//                 ),
//                 Positioned(
//                   left: 170,
//                   top: 200,
//                   child: _buildConnectionLabel('JSON/Audio Responses'),
//                 ),
                
//                 // Between Backend and AI Services
//                 Positioned(
//                   right: 240,
//                   top: 100,
//                   child: _buildConnectionLabel('API Calls'),
//                 ),
//                 Positioned(
//                   right: 170,
//                   top: 200,
//                   child: _buildConnectionLabel('Service Responses'),
//                 ),
                
//                 // Between Backend and Deployment
//                 Positioned(
//                   left: centerX + 20,
//                   top: 440,
//                   child: _buildConnectionLabel('Deploy & Host'),
//                 ),
//               ],
//             ),
//           );
//         }
//       ),
//     );
//   }
  
//   Widget _buildConnectionLabel(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 13,
//           fontWeight: FontWeight.w500,
//           color: Colors.grey[700],
//         ),
//       ),
//     );
//   }

//   Widget _buildComponentBox({
//     required String title,
//     required List<String> items,
//     required double boxWidth,
//     required Color itemColor,
//     required Color itemBgColor,
//     bool isHorizontal = false,
//     double itemVerticalSpacing = 8,
//     double horizontalSpacing = 10,
//   }) {
//     return Container(
//       width: boxWidth,
//       padding: const EdgeInsets.all(20), // Increased padding
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade200),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontSize: 19, // Slightly larger font
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16), // More spacing after title
//           if (isHorizontal)
//             Wrap(
//               spacing: horizontalSpacing,
//               runSpacing: horizontalSpacing,
//               children: items.map((item) => _buildComponentItem(
//                 item, 
//                 itemColor: itemColor,
//                 itemBgColor: itemBgColor,
//                 isHorizontal: true,
//               )).toList(),
//             )
//           else
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: items.map((item) => Padding(
//                 padding: EdgeInsets.only(bottom: itemVerticalSpacing),
//                 child: _buildComponentItem(
//                   item, 
//                   itemColor: itemColor,
//                   itemBgColor: itemBgColor
//                 ),
//               )).toList(),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildComponentItem(
//     String text, {
//     required Color itemColor,
//     required Color itemBgColor,
//     bool isHorizontal = false,
//   }) {
//     return Container(
//       width: isHorizontal ? null : double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // More padding
//       decoration: BoxDecoration(
//         color: itemBgColor,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: itemColor.withOpacity(0.2)), // Subtle border
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 15, // Slightly larger font
//           color: itemColor,
//           fontWeight: FontWeight.w500,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

// class ArchitectureDiagramPainter extends CustomPainter {
//   final Map<String, double> positions;
  
//   ArchitectureDiagramPainter({required this.positions});
  
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Define colors for each component's connections
//     final flutterColor = Colors.blue.shade400;
//     final backendColor = Colors.green.shade400;
//     final aiServicesColor = Colors.purple.shade400;
//     final deploymentColor = Colors.orange.shade400;
    
//     // Calculate key positions
//     final flutterClientRight = positions['flutterClientRight'] ?? 290.0;
//     final flutterClientCenter = positions['flutterClientCenter'] ?? 165.0;
//     final backendCenter = positions['backendCenter'] ?? size.width / 2;
//     final backendTop = positions['backendTop'] ?? 200.0;
//     final aiServicesLeft = positions['aiServicesLeft'] ?? (size.width - 290.0);
//     final aiServicesCenter = positions['aiServicesCenter'] ?? (size.width - 165.0);
//     final backendY = 300; // Top of backend box
    
//     // 1. Flutter Client to Backend (HTTP Requests)
//     _drawDashedLine(
//       canvas, 
//       Offset(flutterClientRight, 60), // Right side of Flutter client
//       Offset(backendCenter - 75, backendY as double), // Left side of Backend
//       flutterColor,
//     );
    
//     // 2. Backend to Flutter Client (JSON/Audio Responses)
//     _drawDashedLine(
//       canvas, 
//       Offset(backendCenter - 20, backendY + 40), // Left side of Backend (lower)
//       Offset(flutterClientCenter + 50, 220), // Bottom part of Flutter client
//       backendColor,
//     );
    
//     // 3. Backend to AI Services (API Calls)
//     _drawDashedLine(
//       canvas, 
//       Offset(backendCenter + 100, backendY as double), // Right side of Backend
//       Offset(aiServicesLeft, 120), // Left side of AI Services
//       backendColor,
//     );
    
//     // 4. AI Services to Backend (Service Responses)
//     _drawDashedLine(
//       canvas, 
//       Offset(aiServicesCenter - 50, 220), // Bottom part of AI Services
//       Offset(backendCenter + 80, backendY + 40), // Right side of Backend (lower)
//       aiServicesColor,
//     );
    
//     // 5. Backend to Deployment Infrastructure
//     _drawDashedLine(
//       canvas, 
//       Offset(backendCenter, backendY + 80), // Bottom of Backend
//       Offset(backendCenter, size.height - 90), // Top of Deployment
//       deploymentColor,
//     );
//   }
  
//   void _drawDashedLine(Canvas canvas, Offset start, Offset end, Color color) {
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
      
//     final path = Path()
//       ..moveTo(start.dx, start.dy)
//       ..lineTo(end.dx, end.dy);
    
//     // Use different dash patterns for different connections
//     final dashSize = 6.0; 
//     final gapSize = 4.0;
    
//     canvas.drawPath(
//       dashPath(
//         path,
//         dashArray: CircularIntervalList<double>([dashSize, gapSize]),
//       ),
//       paint,
//     );
    
//     // Draw arrowhead with matching color
//     final angle = atan2(end.dy - start.dy, end.dx - start.dx);
//     const arrowSize = 10.0;
    
//     final arrowPath = Path()
//       ..moveTo(end.dx, end.dy)
//       ..lineTo(
//         end.dx - arrowSize * cos(angle - pi / 6),
//         end.dy - arrowSize * sin(angle - pi / 6),
//       )
//       ..lineTo(
//         end.dx - arrowSize * cos(angle + pi / 6),
//         end.dy - arrowSize * sin(angle + pi / 6),
//       )
//       ..close();
    
//     // Use the same color for the arrowhead
//     canvas.drawPath(arrowPath, Paint()..color = color..style = PaintingStyle.fill);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

// // Utility class to draw dashed lines
// class CircularIntervalList<T> {
//   final List<T> _values;
//   int _index = 0;

//   CircularIntervalList(this._values);

//   T get next {
//     if (_index >= _values.length) {
//       _index = 0;
//     }
//     return _values[_index++];
//   }
// }

// Path dashPath(
//   Path source, {
//   required CircularIntervalList<double> dashArray,
// }) {
//   final Path dest = Path();
//   for (final PathMetric metric in source.computeMetrics()) {
//     double distance = 0;
//     bool draw = true;
//     while (distance < metric.length) {
//       final double len = dashArray.next;
//       if (draw) {
//         dest.addPath(
//           metric.extractPath(distance, distance + len),
//           Offset.zero,
//         );
//       }
//       distance += len;
//       draw = !draw;
//     }
//   }
//   return dest;
// }



import 'dart:math' show pi, cos, sin, atan2;
import 'dart:ui';

import 'package:flutter/material.dart';

class ArchitectureDiagram extends StatelessWidget {
  const ArchitectureDiagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Increase aspect ratio to provide more vertical space
    return AspectRatio(
      aspectRatio: 14 / 20, // More vertical space than 16/12
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate positions based on available size for more responsive layout
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          final centerX = width / 2;
          
          // Store positions for painter to use
          final positions = {
            'flutterClientRight': 290.0,
            'flutterClientCenter': 165.0,
            'backendCenter': centerX,
            'backendTop': 300.0,  // Adjusted to match SVG
            'aiServicesLeft': width - 290.0,
            'aiServicesCenter': width - 165.0,
          };
          
          return CustomPaint(
            painter: ArchitectureDiagramPainter(positions: positions),
            child: Stack(
              children: [
                // Flutter Mobile Client Box - Left side
                Positioned(
                  left: 40,
                  top: 20,
                  child: _buildComponentBox(
                    title: 'Flutter Mobile Client',
                    items: [
                      'UI Components',
                      'Riverpod State Management',
                      'Audio Recording/Playback',
                      'Audio Playback (just_audio)',
                      'HTTP Client for API Calls',
                    ],
                    boxWidth: 250,
                    itemColor: Colors.blue,
                    itemBgColor: Colors.blue.withOpacity(0.1),
                    itemVerticalSpacing: 12, // More spacing between items
                  ),
                ),
                
                // Python FastAPI Backend Box - Center with more spacing
                Positioned(
                  left: 0,
                  right: 0,
                  top: 300, // Positioned to match SVG
                  child: Center(
                    child: _buildComponentBox(
                      title: 'Python FastAPI Backend',
                      items: [
                        'Translation Service',
                        'Speech Recognition',
                        'Text-to-Speech Service',
                        'Gemini AI Translation Processing',
                      ],
                      boxWidth: 300,
                      itemColor: Colors.green,
                      itemBgColor: Colors.green.withOpacity(0.1),
                      itemVerticalSpacing: 12,
                    ),
                  ),
                ),
                
                // AI Services Box - Right side
                Positioned(
                  right: 40,
                  top: 20,
                  child: _buildComponentBox(
                    title: 'AI Services',
                    items: [
                      'Azure Speech Services',
                      'Google Gemini 2.0',
                      'Picovoice Wake Word',
                      'Azure Container Apps',
                    ],
                    boxWidth: 250,
                    itemColor: Colors.purple,
                    itemBgColor: Colors.purple.withOpacity(0.1),
                    itemVerticalSpacing: 12,
                  ),
                ),
                
                // Deployment Infrastructure Box - Bottom with more spacing
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20, // Keep at bottom with good spacing
                  child: Center(
                    child: _buildComponentBox(
                      title: 'Deployment Infrastructure',
                      items: [
                        'GitHub Actions CI/CD',
                        'Docker Hub Registry',
                        'Azure Cloud Hosting',
                      ],
                      boxWidth: 650, // Wider to give more horizontal space
                      isHorizontal: true,
                      horizontalSpacing: 20, // More space between horizontal items
                      itemColor: Colors.orange,
                      itemBgColor: Colors.orange.withOpacity(0.1),
                    ),
                  ),
                ),
                
                // Connection labels with positioning to match SVG
                // Between Flutter Client and Backend
                Positioned(
                  left: 295,
                  top: 230,
                  child: _buildConnectionLabel('HTTP Requests'),
                ),
                Positioned(
                  left: 190,
                  top: 320,
                  child: _buildConnectionLabel('JSON/Audio Responses'),
                ),
                
                // Between Backend and AI Services
                Positioned(
                  right: 280,
                  top: 280,
                  child: _buildConnectionLabel('API Calls'),
                ),
                Positioned(
                  right: 170,
                  top: 300,
                  child: _buildConnectionLabel('Service Responses'),
                ),
                
                // Between Backend and Deployment
                Positioned(
                  left: centerX + 20,
                  top: 515,
                  child: _buildConnectionLabel('Deploy & Host'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
  
  Widget _buildConnectionLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildComponentBox({
    required String title,
    required List<String> items,
    required double boxWidth,
    required Color itemColor,
    required Color itemBgColor,
    bool isHorizontal = false,
    double itemVerticalSpacing = 8,
    double horizontalSpacing = 10,
  }) {
    return Container(
      width: boxWidth,
      padding: const EdgeInsets.all(20), // Increased padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 19, // Slightly larger font
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16), // More spacing after title
          if (isHorizontal)
            Wrap(
              spacing: horizontalSpacing,
              runSpacing: horizontalSpacing,
              children: items.map((item) => _buildComponentItem(
                item, 
                itemColor: itemColor,
                itemBgColor: itemBgColor,
                isHorizontal: true,
              )).toList(),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: items.map((item) => Padding(
                padding: EdgeInsets.only(bottom: itemVerticalSpacing),
                child: _buildComponentItem(
                  item, 
                  itemColor: itemColor,
                  itemBgColor: itemBgColor
                ),
              )).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildComponentItem(
    String text, {
    required Color itemColor,
    required Color itemBgColor,
    bool isHorizontal = false,
  }) {
    return Container(
      width: isHorizontal ? null : double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // More padding
      decoration: BoxDecoration(
        color: itemBgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: itemColor.withOpacity(0.2)), // Subtle border
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15, // Slightly larger font
          color: itemColor,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ArchitectureDiagramPainter extends CustomPainter {
  final Map<String, double> positions;
  
  ArchitectureDiagramPainter({required this.positions});
  
  @override
  void paint(Canvas canvas, Size size) {
    // Define colors for each component's connections
    final flutterColor = Colors.blue.shade400;
    final backendColor = Colors.green.shade400;
    final aiServicesColor = Colors.purple.shade400;
    final deploymentColor = Colors.orange.shade400;
    
    // Calculate key positions
    final flutterClientRight = positions['flutterClientRight'] ?? 290.0;
    final flutterClientCenter = positions['flutterClientCenter'] ?? 165.0;
    final backendCenter = positions['backendCenter'] ?? size.width / 2;
    final backendTop = positions['backendTop'] ?? 300.0;
    final aiServicesLeft = positions['aiServicesLeft'] ?? (size.width - 290.0);
    final aiServicesCenter = positions['aiServicesCenter'] ?? (size.width - 165.0);
    
    // 1. Flutter Client to Backend (HTTP Requests) - Curved path to match SVG
    _drawCurvedDashedLine(
      canvas, 
      Offset(290, 180), // From right side of Flutter client
      Offset(330, 350), // To left side of Backend
      [Offset(330, 180)], // Control points for curve
      flutterColor,
    );
    
    // 2. Backend to Flutter Client (JSON/Audio Responses) - Curved path
    _drawCurvedDashedLine(
      canvas, 
      Offset(290, 380), // From left side of Backend
      Offset(250, 250), // To bottom of Flutter client
      [Offset(250, 380)], // Control points for curve
      backendColor,
    );
    
    // 3. Backend to AI Services (API Calls) - Curved path
    _drawCurvedDashedLine(
      canvas, 
      Offset(470, 350), // From right side of Backend
      Offset(550, 250), // To left side of AI Services
      [Offset(470, 280), Offset(550, 280)], // Control points for curve
      backendColor,
    );
    
    // 4. AI Services to Backend (Service Responses) - Curved path
    _drawCurvedDashedLine(
      canvas, 
      Offset(510, 270), // From bottom left of AI Services
      Offset(450, 350), // To right side of Backend
      [Offset(470, 270), Offset(450, 320)], // Control points for curve
      aiServicesColor,
    );
    
    // 5. Backend to Deployment Infrastructure - Straight path
    _drawDashedLine(
      canvas, 
      Offset(400, 500), // From bottom of Backend
      Offset(400, 550), // To top of Deployment
      deploymentColor,
    );
  }
  
  // Draw a curved dashed line with control points
  void _drawCurvedDashedLine(Canvas canvas, Offset start, Offset end, List<Offset> controlPoints, Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
      
    final path = Path()
      ..moveTo(start.dx, start.dy);
    
    // Create a curved path using control points
    if (controlPoints.length == 1) {
      // Quadratic curve with one control point
      path.quadraticBezierTo(
        controlPoints[0].dx, controlPoints[0].dy,
        end.dx, end.dy,
      );
    } else if (controlPoints.length >= 2) {
      // Cubic curve with two control points
      path.cubicTo(
        controlPoints[0].dx, controlPoints[0].dy,
        controlPoints[1].dx, controlPoints[1].dy,
        end.dx, end.dy,
      );
    }
    
    // Draw the dashed path
    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>([6.0, 4.0]),
      ),
      paint,
    );
    
    // Draw arrowhead with matching color
    final angle = _getAngleAtEnd(path);
    const arrowSize = 10.0;
    
    final arrowPath = Path()
      ..moveTo(end.dx, end.dy)
      ..lineTo(
        end.dx - arrowSize * cos(angle - pi / 6),
        end.dy - arrowSize * sin(angle - pi / 6),
      )
      ..lineTo(
        end.dx - arrowSize * cos(angle + pi / 6),
        end.dy - arrowSize * sin(angle + pi / 6),
      )
      ..close();
    
    // Use the same color for the arrowhead
    canvas.drawPath(arrowPath, Paint()..color = color..style = PaintingStyle.fill);
  }
  
  // Draw a straight dashed line
  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
      
    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(end.dx, end.dy);
    
    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>([6.0, 4.0]),
      ),
      paint,
    );
    
    // Draw arrowhead with matching color
    final angle = atan2(end.dy - start.dy, end.dx - start.dx);
    const arrowSize = 10.0;
    
    final arrowPath = Path()
      ..moveTo(end.dx, end.dy)
      ..lineTo(
        end.dx - arrowSize * cos(angle - pi / 6),
        end.dy - arrowSize * sin(angle - pi / 6),
      )
      ..lineTo(
        end.dx - arrowSize * cos(angle + pi / 6),
        end.dy - arrowSize * sin(angle + pi / 6),
      )
      ..close();
    
    // Use the same color for the arrowhead
    canvas.drawPath(arrowPath, Paint()..color = color..style = PaintingStyle.fill);
  }
  
  // Calculate the angle at the end of a path (for curved paths)
  double _getAngleAtEnd(Path path) {
    final metrics = path.computeMetrics().toList();
    if (metrics.isEmpty) return 0;
    
    final lastMetric = metrics.last;
    final tangent = lastMetric.getTangentForOffset(lastMetric.length);
    
    if (tangent == null) return 0;
    return atan2(tangent.vector.dy, tangent.vector.dx);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Utility class to draw dashed lines
class CircularIntervalList<T> {
  final List<T> _values;
  int _index = 0;

  CircularIntervalList(this._values);

  T get next {
    if (_index >= _values.length) {
      _index = 0;
    }
    return _values[_index++];
  }
}

Path dashPath(
  Path source, {
  required CircularIntervalList<double> dashArray,
}) {
  final Path dest = Path();
  for (final PathMetric metric in source.computeMetrics()) {
    double distance = 0;
    bool draw = true;
    while (distance < metric.length) {
      final double len = dashArray.next;
      if (draw) {
        dest.addPath(
          metric.extractPath(distance, distance + len),
          Offset.zero,
        );
      }
      distance += len;
      draw = !draw;
    }
  }
  return dest;
}