import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
abstract class ImageHelper{
  static Future<String> pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    late final String imagePath;
    XFile? xFile = await picker.pickImage(source:imageSource);
    if (xFile != null) {
      imagePath= await _saveImageToDocumentsDirectory(File(xFile.path));
    }
    return imagePath;
  }
  static Future<String> _saveImageToDocumentsDirectory(File img) async {
    final String imagePath = await _createImagePath(img);
    late final File imageFile;
    XFile ?file=await _compressImageFromCamera(img, imagePath);
    imageFile = File(file!.path);
    await imageFile.writeAsBytes(await _imageFileToBytes(imageFile));
    return imageFile.path;
  }
  static Future<String> _createImagePath(File img)async{
    final Directory directory = await getApplicationDocumentsDirectory();
    String imageName = basename(img.path);
    return'${directory.path}/$imageName';
  }
  static Future<XFile?> _compressImageFromCamera(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, targetPath, quality: 50);
    return result;
  }
  static Future<Uint8List> _imageFileToBytes(File imageFile) async {
    return await imageFile.readAsBytes();
  }
  static void deleteImageFile(String filePath) {
    File imageFile = File(filePath);
    if (imageFile.existsSync()) {
      imageFile.deleteSync();
    }
  }
}