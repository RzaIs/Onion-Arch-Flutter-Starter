import 'package:flutter/material.dart';
import 'package:rzagram/domain/entities/post_entity.dart';
import 'package:rzagram/presenter/pages_and_services/base/base_page.dart';
import 'package:rzagram/presenter/pages_and_services/post_list/post_list_service.dart';

class PostListPage extends BaseStatefulPage<PostListService> {
  const PostListPage({
    required super.navigationProvider,
    required super.service,
    super.key,
  });

  @override
  State<PostListPage> createState() => _PostListState();
}

class _PostListState extends State<PostListPage> {
  @override
  void initState() {
    super.initState();
    widget.service.observePosts().listen((posts) {
      setState(() {
        widget.service.posts = posts;
      });
    });
    widget.service.syncPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ...widget.service.posts.map((post) {
                return postCell(postEntity: post);
              })
            ],
          ),
        ),
      ),
    );
  }

  Center postCell({required PostEntity postEntity}) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return widget.navigationProvider.postDetailsPage(
                postEntity: postEntity,
              );
            }),
          );
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            Colors.black,
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(8.0),
          ),
        ),
        child: Column(
          children: [
            Text(
              postEntity.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              postEntity.body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.black,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
