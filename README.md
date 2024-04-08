# arosaje_mobile

A new Flutter project.
onScanDocumentPressed() async {
await ImagePicker()
.pickImage(source: ImageSource.camera)
.then((value) async {
if (value != null) {
await cropImage(value);
}
}).onError((PlatformException platformException, stackTrace) {
if (platformException.code == "camera_access_denied") {
showSnackbar("checkYourCameraAccess".tr, SnackStatusEnum.warning);
}
return;
});
}

onPressedCameraPicker(BuildContext context) async {
Navigator.pop(context);
if (deviceMemory! <= 3072 || deviceModel.contains('SM-A32')) {
await Get.to(
() => CameraInApp(
cameras: camerasList,
newExpenseViewController: this,
key: const Key(""),
),
transition: Transition.circularReveal,
);
} else {
onScanDocumentPressed();
}
}

...........
onImagePickerSelected() async {
Get.back();
imagePicker();
}

imagePicker() async {
XFile? result = await ImagePicker().pickImage(
source: ImageSource.gallery,
imageQuality: 80,
);
if (result != null) {
int sizeInBytes = File(result.path).lengthSync();
double sizeInMb = sizeInBytes / (1024 \* 1024);
if (sizeInMb < 5) {
// File size is within the limit
imageFile.value = File(result.path);
isKlippaLoading.value = true;
imageData = await imageFile.value.readAsBytes();
isAttached.value = true;
getReceiptName(imageFile.value);
} else {
showSnackbar('${"fileTooLarge".tr} (${sizeInMb.round()} Mo)',
SnackStatusEnum.warning);
isAttached.value = false;
}
} else {
showSnackbar("emptyDocument", SnackStatusEnum.warning);
isAttached.value = false;
}
if (!hasPhotoPermission.value) {
showSnackbar("checkYourCameraAccess".tr, SnackStatusEnum.warning);
}
}

// Compresse le document scanné sinon erreur de l'api
Future<File> compressFile(File file) async {
var temporaryDirectory = await getTemporaryDirectory();
String fileName = "${file.path.split('/').last}.jpg";
    String path = "${temporaryDirectory.path}/$fileName";
final File compressedFile = File(path);
await FlutterImageCompress.compressAndGetFile(
file.path,
compressedFile.path,
quality: 50,
);

    return compressedFile;

}

Future<void> cropImage(XFile? pickedFile) async {
if (pickedFile != null) {
croppedFile = (await ImageCropper().cropImage(
sourcePath: pickedFile.path,
compressFormat: ImageCompressFormat.jpg,
compressQuality: 100,
uiSettings: [
AndroidUiSettings(
toolbarTitle: 'cropProof'.tr,
toolbarColor: black,
toolbarWidgetColor: Colors.white,
activeControlsWidgetColor: redChip,
initAspectRatio: CropAspectRatioPreset.original,
lockAspectRatio: false),
IOSUiSettings(
title: 'cropProof'.tr,
),
],
))!;
imageFile.value = File(croppedFile.path);
imageFile.value = await compressFile(imageFile.value);
imageData = await imageFile.value.readAsBytes();
isAttached.value = true;
isKlippaLoading.value = true;
isModifiedAttachment.value = true;
getReceiptName(imageFile.value);
}
}

String getFileExtension(String filePath) {
int lastIndex = filePath.lastIndexOf('.');

    // Utilisation de la classe Path pour extraire l'extension
    if (lastIndex != -1 && lastIndex < filePath.length - 1) {
      // Récupérer l'extension en utilisant la sous-chaîne
      String extension = filePath.substring(lastIndex + 1);
      return extension;
    } else {
      // Aucune extension trouvée
      return '';
    }

}

String getReceiptName(File imageFile) {
if (name.text.isNotEmpty) {
String value = name.text;
value = value.replaceAll(' ', '\_');
imageName.value =
'$value.${isEdit.value && !isModifiedAttachment.value ? currentExpenseAttachment.value.fileExtension : getFileExtension(imageFile.path)}';
return imageName.value;
} else {
imageName.value = '${'receipt'.tr}.${getFileExtension(imageFile.path)}';
return imageName.value;
}
}

// SCAN DU DOCUMENT
onScanDocumentPressed() async {
await ImagePicker()
.pickImage(source: ImageSource.camera)
.then((value) async {
if (value != null) {
await cropImage(value);
}
}).onError((PlatformException platformException, stackTrace) {
if (platformException.code == "camera_access_denied") {
showSnackbar("checkYourCameraAccess".tr, SnackStatusEnum.warning);
}
return;
});
}

onPressedCameraPicker(BuildContext context) async {
Navigator.pop(context);
if (deviceMemory! <= 3072 || deviceModel.contains('SM-A32')) {
await Get.to(
() => CameraInApp(
cameras: camerasList,
newExpenseViewController: this,
key: const Key(""),
),
transition: Transition.circularReveal,
);
} else {
onScanDocumentPressed();
}
}

// Lancement du imagePicker pour prendre une photo
Future<void> takePictureWithCameraInApp(
BuildContext context, CameraController cameraController) async {
XFile? response;
await cameraController.takePicture().then((value) {
response = value;
}).catchError((e) {
log(
name: ' NewExpenseViewController --> takePictureWithCameraInApp()',
"Impossible de prendre la photo");
showSnackbar("cannotGetPicture".tr, SnackStatusEnum.error);
return e;
});

    if (response != null) {
      imageFile.value = File(response?.path ?? "");
      imageFile.value = await compressFile(imageFile.value);
      imageData = await imageFile.value.readAsBytes();
      isAttached.value = true;
      isModifiedAttachment.value = true;
      Get.back();
      isKlippaLoading.value = true;
      getReceiptName(imageFile.value);
    } else {
      showSnackbar(
        "restApiRequestException".tr,
        SnackStatusEnum.error,
      );
    }

}

Uint8List fileData = Uint8List(0);
Uint8List imageData = Uint8List(0);
php artisan serve --host=0.0.0.0