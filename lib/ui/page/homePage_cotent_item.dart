import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/hot_search_model.dart';

class JXHomePageContentItem extends StatelessWidget {
  final JXHotSearchModel model;

  const JXHomePageContentItem({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _imageWidget(),
        const SizedBox(width: 8),
        _contentWidget()
      ],
    );
  }

  Widget _contentWidget() {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_titleWidget(), _userInfoWidget()],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Text(
      model.title ?? "",
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 13),
      maxLines: 2,
      textAlign: TextAlign.left,
    );
  }

  Widget _userInfoWidget() {
    return Column(
      children: [
        const Text("up主姓名", style: TextStyle(fontSize: 13)),
        Text(model.hot ?? ""),
      ],
    );
  }

  Widget _imageWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(model.pic ?? ""))),
      width: 160,
      height: 100,
    );
  }
}
