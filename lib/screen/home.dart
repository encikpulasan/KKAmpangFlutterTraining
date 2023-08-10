import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Post {
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  factory Post.fromJson(dynamic json) {
    return Post(
      userId: json['albumId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  String toString() {
    return '{ $userId, $id, $title, $body }';
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dio = Dio();

  List<Post> posts = [];
  int currentIndex = 1;

  void getHttp(int index) async {
    var response = await dio
        .get('https://jsonplaceholder.typicode.com/posts/$index')
        .then((value) => value.toString());
    var post = Post.fromJson(json.decode(response));
    // photos = list.map((photo) => Photo.fromJson(photo)).toList();
    setState(() {
      posts.add(post);
      currentIndex++;
    });
  }

  ScrollController controller = ScrollController();
  @override
  void initState() {
    getHttp(currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => getHttp(currentIndex),
              child: const Text('Fetch Data'),
            ),
            Expanded(
              child: ListView.builder(
                controller: ScrollController(),
                // Total number of widget to loop
                itemCount: posts.length,
                // Generate widget index by index
                itemBuilder: (BuildContext context, int index) {
                  return _PortfolioContent(post: posts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PortfolioContent extends StatelessWidget {
  const _PortfolioContent({
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: Container(
            color: Colors.amber,
            child: Center(
              child: Text(
                '${post.id}',
                style: const TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(post.title ?? 'title'),
        const SizedBox(height: 8),
        Text(post.body ?? 'body'),
      ],
    );
  }
}
