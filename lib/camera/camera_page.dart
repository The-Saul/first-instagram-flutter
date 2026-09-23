import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'components/camera_bottom_bar.dart';
import 'components/camera_preview.dart';
import 'components/camera_top_bar.dart';
import 'filter_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
  });

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;

  List<CameraDescription> _cameras = [];

  int _cameraAtual = 0;

  bool _carregando = true;

  String? _erro;

  @override
  void initState() {
    super.initState();

    _inicializarCamera();
  }

  // ============================================================
  // INICIALIZAR CÂMERA
  // ============================================================

  Future<void> _inicializarCamera() async {
    try {
      _cameras = await availableCameras();

      if (_cameras.isEmpty) {
        if (!mounted) return;

        setState(() {
          _erro =
              'Nenhuma câmera foi encontrada no Linux. Conecte uma webcam e tente novamente.';
          _carregando = false;
        });

        return;
      }

      await _criarController(
        _cameras[_cameraAtual],
      );
    } catch (e) {
      debugPrint(
        'Erro ao encontrar câmera: $e',
      );

      if (!mounted) return;

      setState(() {
        _erro =
            'Não foi possível acessar a câmera.';

        _carregando = false;
      });
    }
  }

  // ============================================================
  // CRIAR CONTROLLER
  // ============================================================

  Future<void> _criarController(
    CameraDescription camera,
  ) async {
    await _controller?.dispose();

    final controller = CameraController(
      camera,

      ResolutionPreset.high,

      enableAudio: false,
    );

    try {
      await controller.initialize();

      if (!mounted) {
        await controller.dispose();
        return;
      }

      setState(() {
        _controller = controller;

        _carregando = false;

        _erro = null;
      });
    } catch (e) {
      debugPrint(
        'Erro ao inicializar câmera: $e',
      );

      await controller.dispose();

      if (!mounted) return;

      setState(() {
        _erro =
            'Erro ao inicializar a câmera.';

        _carregando = false;
      });
    }
  }

  // ============================================================
  // TROCAR CÂMERA
  // ============================================================

  Future<void> _trocarCamera() async {
    if (_cameras.length < 2) {
      return;
    }

    setState(() {
      _carregando = true;
    });

    _cameraAtual =
        (_cameraAtual + 1) % _cameras.length;

    await _criarController(
      _cameras[_cameraAtual],
    );
  }

  // ============================================================
  // TIRAR FOTO
  // ============================================================

  Future<void> _tirarFoto() async {
    final controller = _controller;

    if (controller == null ||
        !controller.value.isInitialized) {
      return;
    }

    try {
      final foto =
          await controller.takePicture();

      if (!mounted) return;

      Navigator.push(
        context,

        MaterialPageRoute(
          builder: (_) {
            return FilterPage(
              foto: foto,
            );
          },
        ),
      );
    } catch (e) {
      debugPrint(
        'Erro ao tirar foto: $e',
      );
    }
  }

  // ============================================================
  // GALERIA
  // ============================================================

  void _abrirGaleria() {
    // Vamos implementar a galeria depois.
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _controller?.dispose();

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Column(
          children: [
            // --------------------------------------------------
            // BARRA SUPERIOR
            // --------------------------------------------------

            CameraTopBar(
              titulo: 'Camera',

              textoEsquerda: 'Back',

              textoDireita: 'Gallery',

              onEsquerda: () {
                Navigator.pop(context);
              },

              onDireita: _abrirGaleria,
            ),

            // --------------------------------------------------
            // PREVIEW
            // --------------------------------------------------

            Expanded(
              child: _buildCamera(),
            ),

            // --------------------------------------------------
            // BARRA INFERIOR
            // --------------------------------------------------

            CameraBottomBar(
              onTrocarCamera: _trocarCamera,

              onTirarFoto: _tirarFoto,

              onGaleria: _abrirGaleria,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BUILD CAMERA
  // ============================================================

  Widget _buildCamera() {
    if (_carregando) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }

    if (_erro != null) {
      return _buildErro();
    }

    if (_controller == null) {
      return const SizedBox();
    }

    return CameraPreviewWidget(
      controller: _controller!,
    );
  }

  // ============================================================
  // ERRO
  // ============================================================

  Widget _buildErro() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            const Icon(
              Icons.no_photography,
              color: Colors.white,
              size: 60,
            ),

            const SizedBox(height: 20),

            Text(
              _erro!,

              textAlign: TextAlign.center,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _carregando = true;
                  _erro = null;
                });

                _inicializarCamera();
              },

              child: const Text(
                'Tentar novamente',
              ),
            ),
          ],
        ),
      ),
    );
  }
}