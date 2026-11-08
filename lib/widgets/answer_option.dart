import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String answer;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.answer,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? const Color(0xFF6558D3) : Colors.white;

    return Material(
      color: color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF6558D3)
                  : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: isSelected
                    ? Colors.white
                    : const Color(0xFFEDEAFF),
                child: Text(
                  label,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xFF6558D3)
                        : Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  answer,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (isSelected)
                const Icon(Icons.check_circle, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
