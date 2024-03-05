import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/widgets/toast/toast_widget.dart';
abstract class CustomToast{
  static showToast(context,{required String msg}) {
    FToast().init(context);
    FToast().showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
      child:ToastWidget(msg: msg));
  }
}