class JXHotSearchModel {
  String? title;
  String? desc;
  String? pic;
  String? hot;
  String? url;

  JXHotSearchModel({this.title, this.desc, this.pic, this.hot, this.url});

  JXHotSearchModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    pic = json['pic'];
    hot = json['hot'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['pic'] = pic;
    data['hot'] = hot;
    data['url'] = url;
    return data;
  }
}