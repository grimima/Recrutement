import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as foundation;

class FinalEmploiState {
  final String? selectedChoice;
  final bool reg1;
  final bool reg2;
  final bool reg3;
  final bool reg4;
  final bool reg5;
  final bool reg6;
  final bool reg7;
  final bool reg8;
  final bool reg9;
  final bool reg10;
  final bool reg11;
  final bool reg12;
  final bool national;

  FinalEmploiState({
    this.selectedChoice,
    this.reg1 = false,
    this.reg2 = false,
    this.reg3 = false,
    this.reg4 = false,
    this.reg5 = false,
    this.reg6 = false,
    this.reg7 = false,
    this.reg8 = false,
    this.reg9 = false,
    this.reg10 = false,
    this.reg11 = false,
    this.reg12 = false,
    this.national = false,
  });
  FinalEmploiState copyWith({
    String? selectedChoice,
    bool? reg1,
    bool? reg2,
    bool? reg3,
    bool? reg4,
    bool? reg5,
    bool? reg6,
    bool? reg7,
    bool? reg8,
    bool? reg9,
    bool? reg10,
    bool? reg11,
    bool? reg12,
    bool? national,
  }) {
    return FinalEmploiState(
      selectedChoice: selectedChoice ?? this.selectedChoice,
      reg1: reg1 ?? this.reg1,
      reg2: reg2 ?? this.reg2,
      reg3: reg3 ?? this.reg3,
      reg4: reg4 ?? this.reg4,
      reg5: reg5 ?? this.reg5,
      reg6: reg6 ?? this.reg6,
      reg7: reg7 ?? this.reg7,
      reg8: reg8 ?? this.reg8,
      reg9: reg9 ?? this.reg9,
      reg10: reg10 ?? this.reg10,
      reg11: reg11 ?? this.reg11,
      reg12: reg12 ?? this.reg12,
      national: national ?? this.national,
    );
  }
}

class FinalEmploiNotifier extends StateNotifier<FinalEmploiState> {
  FinalEmploiNotifier() : super(FinalEmploiState());

  void updateChoice(String? newChoice) {
    state = FinalEmploiState(selectedChoice: newChoice ?? '');
  }

  void updatereg(bool value, int regIndex) {
    switch (regIndex) {
      case 1:
        state = state.copyWith(reg1: value);
        break;
      case 2:
        state = state.copyWith(reg2: value);
        break;
      case 3:
        state = state.copyWith(reg3: value);
        break;
      case 4:
        state = state.copyWith(reg4: value);
        break;
      case 5:
        state = state.copyWith(reg5: value);
        break;
      case 6:
        state = state.copyWith(reg6: value);
        break;
      case 7:
        state = state.copyWith(reg7: value);
        break;
      case 8:
        state = state.copyWith(reg8: value);
        break;
      case 9:
        state = state.copyWith(reg9: value);
        break;
      case 10:
        state = state.copyWith(reg10: value);
        break;
      case 11:
        state = state.copyWith(reg11: value);
        break;
      case 12:
        state = state.copyWith(reg12: value);
        break;
      default:
        break;
    }
  }

  void updateNational(bool value) {
    state = state.copyWith(national: value);
    // Update all regs if "National" is checked/unchecked
    state = state.copyWith(
      reg1: value,
      reg2: value,
      reg3: value,
      reg4: value,
      reg5: value,
      reg6: value,
      reg7: value,
      reg8: value,
      reg9: value,
      reg10: value,
      reg11: value,
      reg12: value,
    );
  }
}

final FinalEmploiProvider =
    StateNotifierProvider<FinalEmploiNotifier, FinalEmploiState>(
  (ref) => FinalEmploiNotifier(),
);

final finalStageProvider =
    StateNotifierProvider<FinalEmploiNotifier, FinalEmploiState>(
  (ref) => FinalEmploiNotifier(),
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
