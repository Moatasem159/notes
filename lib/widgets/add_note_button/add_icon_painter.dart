part of'add_note_button.dart';
class _AddIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBlue = Paint()..color = Colors.blue..style = PaintingStyle.fill;
    Path pathBlue = Path();
    pathBlue.moveTo(size.width/1.395348837209302,size.height/2);
    pathBlue.lineTo(size.width/1.395348837209302,size.height/2.307692307692308);
    pathBlue.lineTo(size.width/2.222222222222222,size.height/2.307692307692308);
    pathBlue.lineTo(size.width/2.222222222222222,size.height/2);
    pathBlue.close();
    canvas.drawPath(pathBlue, paintBlue);
    Paint paintRed = Paint()..color = Colors.red..style = PaintingStyle.fill;
    Path pathRed = Path();
    pathRed.moveTo(size.width/2.222222222222222,size.height/4.285714285714286);
    pathRed.lineTo(size.width/1.935483870967742,size.height/4.285714285714286);
    pathRed.lineTo(size.width/1.935483870967742,size.height/2.307692307692308);
    pathRed.lineTo(size.width/2.222222222222222,size.height/2);
    pathRed.close();
    canvas.drawPath(pathRed, paintRed);
    Paint paintYellow = Paint()..color =Colors.yellow..style = PaintingStyle.fill;
    Path pathYellow = Path();
    pathYellow.moveTo(size.width/4.285714285714286,size.height/2.307692307692308);
    pathYellow.lineTo(size.width/4.285714285714286, size.height/2);
    pathYellow.lineTo(size.width/2.222222222222222, size.height/2);
    pathYellow.lineTo(size.width/2.222222222222222, size.height/2.307692307692308);
    pathYellow.close();
    canvas.drawPath(pathYellow, paintYellow);
    Paint paintGreen = Paint()..color = Colors.green..style = PaintingStyle.fill;
    Path pathGreen = Path();
    pathGreen.moveTo(size.width/2.222222222222222,size.height/2);
    pathGreen.lineTo(size.width/1.935483870967742,size.height/2);
    pathGreen.lineTo(size.width/1.935483870967742,size.height/1.395348837209302);
    pathGreen.lineTo(size.width/2.222222222222222,size.height/1.395348837209302);
    pathGreen.close();
    canvas.drawPath(pathGreen, paintGreen);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>false;
}