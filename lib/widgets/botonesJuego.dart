import 'package:flutter/material.dart';

class BotonesJuego extends StatelessWidget {
  const BotonesJuego({
    super.key,
    required this.onChoiceSelected,
  });

  final void Function(String) onChoiceSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildGameButton('🪨', 'piedra'),
        const SizedBox(width: 16),
        _buildGameButton('📄', 'papel'),
        const SizedBox(width: 16),
        _buildGameButton('✂️', 'tijeras'),
      ],
    );
  }

  Widget _buildGameButton(String emoji, String choice) {
    return ElevatedButton(
      onPressed: () => onChoiceSelected(choice),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}