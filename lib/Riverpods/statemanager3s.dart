import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as foundation;

class finalStageState {
  DateTime? selectedDay;
  final String? selectedChoice;

  finalStageState({
    this.selectedDay,
    this.selectedChoice,
  });
  finalStageState copyWith({
    DateTime? selectedDay,
    String? selectedChoice,
  }) {
    return finalStageState(
      selectedDay: selectedDay,
      selectedChoice: selectedChoice ?? this.selectedChoice,
    );
  }
}

class finalStageNotifier extends StateNotifier<finalStageState> {
  finalStageNotifier() : super(finalStageState());

  void updateChoice(String? newChoice) {
    state = finalStageState(selectedChoice: newChoice ?? '');
  }
}

final finalStageProvider =
    StateNotifierProvider<finalStageNotifier, finalStageState>(
  (ref) => finalStageNotifier(),
);

class FileState {
  final PlatformFile? file;
  final String? error;

  FileState({this.file, this.error});
}

class FileNotifier extends StateNotifier<FileState> {
  FileNotifier() : super(FileState());

  Future<void> pickPdfFile() async {
    try {
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (pickedFile != null) {
        final fileSize =
            pickedFile.files.single.size / (1024 * 1024); // size in MB
        if (fileSize > 100) {
          state = FileState(error: 'File size exceeds 100MB');
        } else {
          state = FileState(file: pickedFile.files.single);
        }
      }
    } catch (e) {
      state = FileState(error: 'Failed to pick file: $e');
    }
  }

  Future<void> uploadPdfFile() async {
    bool isWeb = foundation.kIsWeb;
    if (state.file == null) return;

    try {
      if (isWeb) {
        // Web platform
        final fileBytes = state.file!.bytes!;
        final formData = FormData.fromMap({
          'file':
              MultipartFile.fromBytes(fileBytes, filename: state.file!.name),
        });

        final dio = Dio();
        await dio.post('YOUR_UPLOAD_URL', data: formData);
      } else {
        // Mobile platform
        final formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(state.file!.path!,
              filename: state.file!.name),
        });

        final dio = Dio();
        await dio.post('YOUR_UPLOAD_URL', data: formData);
      }
    } catch (e) {
      state = FileState(error: 'Failed to upload file: $e');
    }
  }
}

final fileProvider = StateNotifierProvider<FileNotifier, FileState>((ref) {
  return FileNotifier();
});
