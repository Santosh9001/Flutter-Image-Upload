import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload_web/components/centered_view.dart';
import 'package:image_upload_web/components/file_model.dart';
import 'package:image_upload_web/components/file_view_model.dart';

final homeViewProvider = StateProvider((ref) => ref.watch(fileModelProvider));

class Home_view extends ConsumerWidget {
  Home_view({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Centered_view(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await ref.watch(homeViewProvider).pickFile(ref);
                },
                child: const Text("Choose file")),
            const SizedBox(
              height: 20,
            ),
            Image.memory(
              ref.watch(webImageProvider),
              fit: BoxFit.fill,
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/shoe.png',
                  height: 200,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
