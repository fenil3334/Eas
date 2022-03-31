class MiddleDataModel {
  List<Category>? category;
  List<Unstitched>? unstitched;
  List<BoutiqueCollection>? boutiqueCollection;
  String? status;
  String? message;

  MiddleDataModel(
      {this.category,
        this.unstitched,
        this.boutiqueCollection,
        this.status,
        this.message});

  MiddleDataModel.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['Unstitched'] != null) {
      unstitched = <Unstitched>[];
      json['Unstitched'].forEach((v) {
        unstitched!.add(Unstitched.fromJson(v));
      });
    }
    if (json['boutique_collection'] != null) {
      boutiqueCollection = <BoutiqueCollection>[];
      json['boutique_collection'].forEach((v) {
        boutiqueCollection!.add(BoutiqueCollection.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (unstitched != null) {
      data['Unstitched'] = unstitched!.map((v) => v.toJson()).toList();
    }
    if (boutiqueCollection != null) {
      data['boutique_collection'] =
          boutiqueCollection!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Category {
  String? categoryId;
  String? name;
  String? tintColor;
  String? image;
  String? sortOrder;

  Category(
      {this.categoryId, this.name, this.tintColor, this.image, this.sortOrder});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    tintColor = json['tint_color'];
    image = json['image'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['tint_color'] = tintColor;
    data['image'] = image;
    data['sort_order'] = sortOrder;
    return data;
  }
}

class Unstitched {
  String? rangeId;
  String? name;
  String? image;

  Unstitched({this.rangeId, this.name, this.image});

  Unstitched.fromJson(Map<String, dynamic> json) {
    rangeId = json['range_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['range_id'] = rangeId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class BoutiqueCollection {
  String? bannerImage;
  String? bannerType;
  String? bannerId;

  BoutiqueCollection({this.bannerImage, this.bannerType, this.bannerId});

  BoutiqueCollection.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    bannerType = json['banner_type'];
    bannerId = json['banner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_image'] = bannerImage;
    data['banner_type'] = bannerType;
    data['banner_id'] = bannerId;
    return data;
  }
}