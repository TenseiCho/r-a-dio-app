import 'dart:convert';
import 'package:http/http.dart' as http;

class RadioApiService {
  static const String apiUrl = 'https://r-a-d.io/api';

  Future<Map<String, dynamic>> getRadioInfo() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final main = data['main'];
      final np = main['np'];
      final parts = np.split(' - ');
      
      // Handle potential null or empty DJ image
      final djImagePath = main['dj']['djimage'];
      final djImageUrl = djImagePath != null && djImagePath.isNotEmpty
          ? 'https://r-a-d.io/api/dj-image/${Uri.encodeComponent(djImagePath)}'
          : '';

      return {
        'artist': parts.isNotEmpty ? parts[0] : '',
        'title': parts.length > 1 ? parts[1] : '',
        'dj_name': main['dj']['djname'] ?? 'Unknown DJ',
        'listener_count': main['listeners'] ?? 0,
        'dj_image_url': djImageUrl,
      };
    } else {
      throw Exception('Failed to load radio info');
    }
  }
}