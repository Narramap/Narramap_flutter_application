import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecord extends StatefulWidget {
  final void Function(String path)? onStop;

  const AudioRecord({super.key, this.onStop});

  @override
  State<AudioRecord> createState() => _AudioRecordState();
}

class _AudioRecordState extends State<AudioRecord> {
  late final AudioRecorder _recorder;
  bool _isRecording = false;
  Timer? _timer;
  int _seconds = 0;
  String? _currentPath;

  @override
  void initState() {
    super.initState();
    _recorder = AudioRecorder();
  }

  Future<void> _toggleRecording() async {
    if (await _recorder.hasPermission()) {
      if (_isRecording) {
        final path = await _recorder.stop();
        setState(() {
          _isRecording = false;
          _seconds = 0;
        });
        _timer?.cancel();
        if (path != null && widget.onStop != null) {
          widget.onStop!(path);
        }
      } else {
        final dir = await getApplicationDocumentsDirectory();
        final filePath =
            '${dir.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';

        await _recorder.start(
          path: filePath,
          const RecordConfig(
            encoder: AudioEncoder.aacLc,
            bitRate: 128000,
            sampleRate: 44100,
          ),
        );

        setState(() {
          _isRecording = true;
          _currentPath = filePath;
        });

        _timer = Timer.periodic(const Duration(seconds: 1), (_) {
          setState(() => _seconds++);
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permiso de micrófono denegado')),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          iconSize: 60,
          icon: Icon(
            _isRecording ? Icons.stop_circle : Icons.mic,
            color: _isRecording ? Colors.red : Colors.blueGrey,
          ),
          onPressed: _toggleRecording,
        ),
        if (_isRecording)
          Text('Grabando: ${_seconds}s',
              style: const TextStyle(color: Colors.red)),
      ],
    );
  }
}
