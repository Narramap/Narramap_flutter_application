import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;

class AudioRecord extends StatefulWidget {
  const AudioRecord({super.key});

  @override
  State<AudioRecord> createState() => _AudioRecordState();
}

class _AudioRecordState extends State<AudioRecord> {
  late final AudioRecorder _recorder;
  late final AudioPlayer _player;
  bool _isRecording = false;
  bool _isPlaying = false;
  String? _tempFilePath;
  Timer? _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _recorder = AudioRecorder();
    _player = AudioPlayer();
    _player.playerStateStream.listen((state) {
      setState(() {
        _isPlaying = state.playing;
      });
    });
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
        if (path != null) {
          setState(() {
            _tempFilePath = path;
          });
          await _player.setFilePath(path); // Preparar audio para reproducir
        }
      } else {
        final dir = await getTemporaryDirectory();
        final tempPath =
            '${dir.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';

        await _recorder.start(
          path: tempPath,
          const RecordConfig(
            encoder: AudioEncoder.aacLc,
            bitRate: 128000,
            sampleRate: 44100,
          ),
        );

        setState(() {
          _isRecording = true;
          _tempFilePath = null;
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

  Future<void> _togglePlayback() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.seek(Duration.zero); // reproducir desde el inicio
      await _player.play();
    }
  }

  Future<void> _sendToAPI() async {
    if (_tempFilePath == null) return;

    try {
      final file = File(_tempFilePath!);
      final bytes = await file.readAsBytes();

      final response = await http.post(
        Uri.parse('https://tu-api.com/upload'),
        headers: {
          'Content-Type': 'audio/m4a',
        },
        body: bytes,
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Audio enviado con éxito')),
        );
        await _player.stop();
        await file.delete();
        setState(() {
          _tempFilePath = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}')),
        );
      }
    } catch (e) {
      print('Error al enviar el audio: $e');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recorder.dispose();
    _player.dispose();
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

        if (_tempFilePath != null) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause_circle : Icons.play_circle,
                  size: 48,
                ),
                onPressed: _togglePlayback,
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: _sendToAPI,
                icon: const Icon(Icons.send),
                label: const Text("Enviar"),
              ),
            ],
          ),
          const Text('Puedes escuchar y enviar tu audio.'),
        ]
      ],
    );
  }
}

