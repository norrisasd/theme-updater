// ignore_for_file: no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:archive/archive.dart';

class UpdateButton extends StatefulWidget {
  final TextEditingController controller;

  UpdateButton({required this.controller});

  @override
  _UpdateButtonState createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<UpdateButton> {
  final _isLoading = ValueNotifier<bool>(false);
  final _progress = ValueNotifier<double>(0);
  final _log = ValueNotifier<String>('');

  @override
  void dispose() {
    _isLoading.dispose();
    _progress.dispose();
    _log.dispose();
    super.dispose();
  }

  Future<void> _downloadAndExtractMaps() async {
    _isLoading.value = true;
    var dir = Directory(widget.controller.text);
    var zipPath = '${dir.path}/file.zip';
    var dio = Dio();

    try {
      _log.value += 'Starting download... --- TITAS MAPS ZIP ---\n';
      await dio.download(
        'https://firebasestorage.googleapis.com/v0/b/titas-67eec.appspot.com/o/Map.zip?alt=media&token=8c247edb-5fa2-4ab4-ad74-90a98e254e58',
        zipPath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            _progress.value = received / total;
          }
        },
      );
      _log.value +=
          'Download completed.\nStarting extraction... TITAS MAPS ZIP\n';

      final bytes = File(zipPath).readAsBytesSync();
      final archive = ZipDecoder().decodeBytes(bytes);

      for (final file in archive) {
        final filename = '${dir.path}/textures/map/${file.name}';
        if (file.isFile) {
          final data = file.content as List<int>;
          File(filename)
            ..createSync(recursive: true)
            ..writeAsBytesSync(data);
        } else {
          Directory(filename).createSync(recursive: true);
        }
      }
      _log.value += 'Extraction completed.\n';

      await File(zipPath).delete();
    } catch (e) {
      _log.value += 'Error: $e\n';
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _downloadAndExtractDataEffects() async {
    _isLoading.value = true;
    var dir = Directory(widget.controller.text);
    var zipPath = '${dir.path}/file.zip';
    var dio = Dio();

    try {
      _log.value +=
          'Starting download... --- TITAS SKILLS DATA EFFECTS ZIP ---\n';
      await dio.download(
        'https://firebasestorage.googleapis.com/v0/b/titas-67eec.appspot.com/o/DataEffects.zip?alt=media&token=db82b374-a1e3-4b04-99f5-9953ca57540a',
        zipPath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            _progress.value = received / total;
          }
        },
      );
      _log.value +=
          'Download completed.\nStarting extraction... TITAS SKILLS DATA EFFECTS ZIP\n';

      final bytes = File(zipPath).readAsBytesSync();
      final archive = ZipDecoder().decodeBytes(bytes);

      for (final file in archive) {
        final filename = '${dir.path}/data/effect/${file.name}';
        if (file.isFile) {
          final data = file.content as List<int>;
          File(filename)
            ..createSync(recursive: true)
            ..writeAsBytesSync(data);
        } else {
          Directory(filename).createSync(recursive: true);
        }
      }
      _log.value += 'Extraction completed.\n';

      await File(zipPath).delete();
    } catch (e) {
      _log.value += 'Error: $e\n';
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _downloadAndExtractTexturesEffect() async {
    _isLoading.value = true;
    var dir = Directory(widget.controller.text);
    var zipPath = '${dir.path}/file.zip';
    var dio = Dio();

    try {
      _log.value +=
          'Starting download... --- TITAS SKILLS TEXTURES EFFECTS ZIP ---\n';
      await dio.download(
        'https://firebasestorage.googleapis.com/v0/b/titas-67eec.appspot.com/o/DataEffects.zip?alt=media&token=db82b374-a1e3-4b04-99f5-9953ca57540a',
        zipPath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            _progress.value = received / total;
          }
        },
      );
      _log.value +=
          'Download completed.\nStarting extraction... TITAS SKILLS TEXTURES EFFECTS ZIP\n';

      final bytes = File(zipPath).readAsBytesSync();
      final archive = ZipDecoder().decodeBytes(bytes);

      for (final file in archive) {
        final filename = '${dir.path}/data/effect/${file.name}';
        if (file.isFile) {
          final data = file.content as List<int>;
          File(filename)
            ..createSync(recursive: true)
            ..writeAsBytesSync(data);
        } else {
          Directory(filename).createSync(recursive: true);
        }
      }
      _log.value += 'Extraction completed.\n';

      await File(zipPath).delete();
    } catch (e) {
      _log.value += 'Error: $e\n';
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _downloadAndExtractPet() async {
    _isLoading.value = true;
    var dir = Directory(widget.controller.text);
    var zipPath = '${dir.path}/file.zip';
    var dio = Dio();

    try {
      _log.value += 'Starting download... --- TITAS PET ZIP ---\n';
      await dio.download(
        'https://firebasestorage.googleapis.com/v0/b/titas-67eec.appspot.com/o/Pet.zip?alt=media&token=b3bf00c7-88c3-4e37-a4b2-5884f57f8eb2',
        zipPath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            _progress.value = received / total;
          }
        },
      );
      _log.value +=
          'Download completed.\nStarting extraction... TITAS PET ZIP\n';

      final bytes = File(zipPath).readAsBytesSync();
      final archive = ZipDecoder().decodeBytes(bytes);

      for (final file in archive) {
        final filename = '${dir.path}/textures/effect/${file.name}';
        if (file.isFile) {
          final data = file.content as List<int>;
          File(filename)
            ..createSync(recursive: true)
            ..writeAsBytesSync(data);
        } else {
          Directory(filename).createSync(recursive: true);
        }
      }

      for (final file in archive) {
        final filename = '${dir.path}/textures/effect/skill/${file.name}';
        if (file.isFile) {
          final data = file.content as List<int>;
          File(filename)
            ..createSync(recursive: true)
            ..writeAsBytesSync(data);
        } else {
          Directory(filename).createSync(recursive: true);
        }
      }

      for (final file in archive) {
        final filename = '${dir.path}/textures/effect/skill/magic/${file.name}';
        if (file.isFile) {
          final data = file.content as List<int>;
          File(filename)
            ..createSync(recursive: true)
            ..writeAsBytesSync(data);
        } else {
          Directory(filename).createSync(recursive: true);
        }
      }
      // Delete the zip file

      _log.value += 'Extraction completed.\n';

      await File(zipPath).delete();
    } catch (e) {
      _log.value += 'Error: $e\n';
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> deleteGuardAndTransform() async {
    final dir = Directory("${widget.controller.text}/data/effect");
    if (await dir.exists()) {
      // List all files in the directory
      final files = dir.listSync(recursive: true, followLinks: false);

      for (FileSystemEntity file in files) {
        // Check if the file name contains 'guard' or 'transform'
        if (file is File &&
            (file.path.contains('guard') || file.path.contains('transform'))) {
          // Delete the file
          await file.delete();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
            // Your existing TextFormField code...
            ),
        const SizedBox(height: 20),
        ValueListenableBuilder<bool>(
          valueListenable: _isLoading,
          builder: (context, isLoading, child) {
            return isLoading
                ? ValueListenableBuilder<double>(
                    valueListenable: _progress,
                    builder: (context, progress, child) {
                      return LinearProgressIndicator(value: progress);
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder<String>(
          valueListenable: _log,
          builder: (context, log, child) {
            return Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: 1.0,
                child: SizedBox(
                  height: 200, // Set the height of the container
                  child: SingleChildScrollView(
                    child: Text(
                      log,
                      style: GoogleFonts.inter(color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder<bool>(
            valueListenable: _isLoading,
            builder: (context, isLoading, child) {
              return SizedBox(
                height: 45,
                width: 170,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors
                              .grey; // Use the color you want for a disabled button
                        }
                        return Theme.of(context)
                            .colorScheme
                            .primary; // Use the default color for an enabled button
                      },
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          var controllerText = widget.controller.text;
                          var message = "";
                          if (controllerText == "") {
                            final snackBar = SnackBar(
                              content: const Text(
                                  'Path is empty, please select a path'),
                              action: SnackBarAction(
                                label: 'Close',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            return;
                          }
                          try {
                            _isLoading.value = true;
                            await _downloadAndExtractDataEffects();
                            await _downloadAndExtractTexturesEffect();
                            await _downloadAndExtractMaps();
                            await _downloadAndExtractPet();
                            await deleteGuardAndTransform();
                            message = "Download and Extraction Completed";
                          } catch (e) {
                            message = e.toString();
                          } finally {
                            _isLoading.value = false;
                            final snackBar = SnackBar(
                              content: Text(message),
                              action: SnackBarAction(
                                label: 'Close',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                  child: _isLoading.value
                      ? const SizedBox(
                          height: 20, // Set the height
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Update',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                ),
              );
            }),
      ],
    );
  }
}