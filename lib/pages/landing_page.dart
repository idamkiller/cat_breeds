import 'package:cat_breeds/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../models/cat.dart';
import '../widgets/cat_card_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Cat> _cats = <Cat>[];
  List<Cat> _filteredCats = <Cat>[];

  @override
  void initState() {
    _fetchCats();
    super.initState();
  }

  Future<void> _fetchCats() async {
    try {
      if (dotenv.env['API_KEY'] == null) {
        throw Exception('API_KEY is not set');
      }
      final result = await Dio().get(
        '$catAPI?api_key=${dotenv.env['API_KEY']}',
      );
      final List<dynamic> data = result.data as List<dynamic>;
      final List<Cat> cats = data
          .map((dynamic e) => Cat.fromJson(e as Map<String, dynamic>))
          .toList();
      setState(() {
        _cats = cats;
        _filteredCats = cats;
      });
      FlutterNativeSplash.remove();
    } catch (e) {
      debugPrint('Error fetching cats: $e');
    }
  }

  void _searchCats(String query) {
    final List<Cat> filteredCats;
    if (query.isEmpty) {
      filteredCats = _cats;
    } else {
      filteredCats = _cats.where((cat) {
        return cat.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {
      _filteredCats = filteredCats;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cats.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Breeds'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              onChanged: _searchCats,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredCats.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CatCard(cat: _filteredCats[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
