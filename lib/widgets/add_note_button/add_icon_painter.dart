part of'add_note_button.dart';
class _AddIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBlue = Paint()..color = Colors.blue..style = PaintingStyle.fill;
    Path pathBlue = Path();
    pathBlue.moveTo(size.width/1.395348837209302,size.height/1.933333333333333);
    pathBlue.lineTo(size.width/1.395348837209302,size.height/2.230769230769231);
    pathBlue.lineTo(size.width/2.068965517241379,size.height/2.230769230769231);
    pathBlue.lineTo(size.width/2.068965517241379,size.height/1.933333333333333);
    pathBlue.close();
    canvas.drawPath(pathBlue,paintBlue);
    Paint paintRed = Paint()..color = Colors.red..style = PaintingStyle.fill;
    Path pathRed = Path();
    pathRed.moveTo(size.width/2.105263157894737,size.height/3.625);
    pathRed.lineTo(size.width/1.846153846153846,size.height/3.625);
    pathRed.lineTo(size.width/1.846153846153846,size.height/2.230769230769231);
    pathRed.lineTo(size.width/2.105263157894737,size.height/1.841269841269841);
    pathRed.close();
    canvas.drawPath(pathRed, paintRed);
    Paint paintYellow = Paint()..color =const Color(0xfffcbc05)..style = PaintingStyle.fill;
    Path pathYellow = Path();
    pathYellow.moveTo(size.width/3.428571428571429,size.height/2.230769230769231);
    pathYellow.lineTo(size.width/3.428571428571429,size.height/1.933333333333333);
    pathYellow.lineTo(size.width/2.105263157894737,size.height/1.933333333333333);
    pathYellow.lineTo(size.width/2.105263157894737,size.height/2.230769230769231);
    pathYellow.close();
    canvas.drawPath(pathYellow, paintYellow);
    Paint paintGreen = Paint()..color = Colors.green..style = PaintingStyle.fill;
    Path pathGreen = Path();
    pathGreen.moveTo(size.width/2.105263157894737,size.height/1.933333333333333);
    pathGreen.lineTo(size.width/1.846153846153846,size.height/1.933333333333333);
    pathGreen.lineTo(size.width/1.846153846153846,size.height/1.414634146341463);
    pathGreen.lineTo(size.width/2.105263157894737,size.height/1.414634146341463);
    pathGreen.close();
    canvas.drawPath(pathGreen, paintGreen);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>false;
}