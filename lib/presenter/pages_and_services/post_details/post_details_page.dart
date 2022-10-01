import 'package:flutter/material.dart';
import 'package:rzagram/presenter/pages_and_services/base/base_page.dart';
import 'package:rzagram/presenter/pages_and_services/post_details/post_details_service.dart';

class PostDetailsPage extends BaseStatelessPage<PostDetailsService> {
  const PostDetailsPage({
    required super.navigationProvider,
    required super.service,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: Column(
        children: [
          Text(
            service.postEntity.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            service.postEntity.body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
