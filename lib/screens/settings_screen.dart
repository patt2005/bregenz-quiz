import 'dart:io';
import 'package:bregenz_quiz_game/models/game_manager.dart';
import 'package:bregenz_quiz_game/utils/utils.dart';
import 'package:bregenz_quiz_game/widgets/fade_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File? imageFile;

  void _showCupertinoPopup(BuildContext context) {
    final provider = Provider.of<GameManager>(context, listen: false);
    final controller = TextEditingController();

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Enter name'),
          content: Column(
            children: [
              const SizedBox(height: 8.0),
              CupertinoTextField(
                controller: controller,
                placeholder: 'Nickname...',
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Submit'),
              onPressed: () async {
                provider.setNickname(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameManager>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.01),
              Consumer<GameManager>(
                builder: (context, value, child) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [redColor, whiteColor, redColor],
                    ),
                  ),
                  width: screenSize.width,
                  child: value.profileImagePath.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            File(value.profileImagePath),
                            width: screenSize.width,
                            height: screenSize.height * 0.22,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
                          "assets/images/profile_image.png",
                          width: screenSize.width,
                          height: screenSize.height * 0.22,
                        ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Container(
                width: screenSize.width,
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [redColor, whiteColor, redColor],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<GameManager>(
                      builder: (context, value, child) => Text(
                        value.nickname.isEmpty ? "Nickname" : value.nickname,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              FadeButton(
                text: "Set nickname",
                onPressed: () {
                  _showCupertinoPopup(context);
                },
              ),
              const SizedBox(height: 10),
              FadeButton(
                text: "Set profile picture",
                onPressed: () async {
                  final imagePicker = ImagePicker();
                  final image =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    final cacheDir = await getTemporaryDirectory();
                    final filePath =
                        path.join(cacheDir.path, 'profile_picture.png');
                    await File(image.path).copy(filePath);
                    provider.setProfileImagePath(filePath);
                  }
                },
              ),
              const SizedBox(height: 10),
              FadeButton(
                text: "Back",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: screenSize.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
