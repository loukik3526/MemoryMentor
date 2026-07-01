import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel _model;

  GeminiService(String apiKey)
      : _model = GenerativeModel(
          model: 'gemini-2.5-flash',
          apiKey: apiKey,
        );

  Future<String> generateSummary(String text) async {
    try {
      final prompt = """
You are an AI study assistant. 
Summarize the following study material.

Return:

1. Summary

2. Important Topics

3. Difficulty

Text:
$text
""";

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      return response.text ?? 'No response generated.';
    } catch (e) {
      return 'Error generating summary: $e';
    }
  }

  Future<List<Map<String, String>>> generateMemories(String text) async {
    try {
      final prompt = """
You are an AI study assistant.

Extract the 10 most important study concepts from the text below.

Return ONLY valid JSON.

Format:

[
  {
    "title":"...",
    "description":"..."
  }
]

No markdown.

No explanation.

No extra text.

Text:
$text
""";

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text == null) return [];

      final String cleanedResponse = response.text!.replaceAll('```json', '').replaceAll('```', '').trim();
      final List<dynamic> jsonData = jsonDecode(cleanedResponse);

      return jsonData.map((item) {
        return {
          'title': (item['title'] as String?) ?? 'Untitled',
          'description': (item['description'] as String?) ?? 'No description provided.',
        };
      }).toList();
    } catch (e) {
      print('Error generating memories: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> generateQuiz(String text) async {
    try {
      final prompt = """
You are an expert educator.

Generate exactly 10 multiple-choice questions from the text below.

Return ONLY valid JSON.

Format:

[
  {
    "question":"...",
    "options":[
      "...",
      "...",
      "...",
      "..."
    ],
    "answer":1,
    "explanation":"..."
  }
]

Rules:

- No markdown.
- No explanation outside JSON.
- Exactly four options.
- answer is the correct option index (0 to 3).
- Questions should cover different topics.
- Difficulty should match the material.

Text:
$text
""";

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text == null) return [];

      final String cleanedResponse =
          response.text!.replaceAll('```json', '').replaceAll('```', '').trim();
      final List<dynamic> jsonData = jsonDecode(cleanedResponse);

      return jsonData
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    } catch (e) {
      print('Error generating quiz: $e');
      return [];
    }
  }
}
