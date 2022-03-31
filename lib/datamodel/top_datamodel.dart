class TopDataModel {
  List<MainStickyMenu>? mainStickyMenu;
  List<OfferCodeBanner>? offerCodeBanner;
  String? status;
  String? message;

  TopDataModel(
      {this.mainStickyMenu, this.offerCodeBanner, this.status, this.message});

  TopDataModel.fromJson(Map<String, dynamic> json) {
    if (json['main_sticky_menu'] != null) {
      mainStickyMenu = <MainStickyMenu>[];
      json['main_sticky_menu'].forEach((v) {
        mainStickyMenu!.add(MainStickyMenu.fromJson(v));
      });
    }
    if (json['offer_code_banner'] != null) {
      offerCodeBanner = <OfferCodeBanner>[];
      json['offer_code_banner'].forEach((v) {
        offerCodeBanner!.add(OfferCodeBanner.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mainStickyMenu != null) {
      data['main_sticky_menu'] =
          mainStickyMenu!.map((v) => v.toJson()).toList();
    }
    if (offerCodeBanner != null) {
      data['offer_code_banner'] =
          offerCodeBanner!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class MainStickyMenu {
  String? title;
  String? image;
  String? sortOrder;
  List<SliderImages>? sliderImages;

  MainStickyMenu({this.title, this.image, this.sortOrder, this.sliderImages});

  MainStickyMenu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    if (json['slider_images'] != null) {
      sliderImages = <SliderImages>[];
      json['slider_images'].forEach((v) {
        sliderImages!.add(SliderImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['sort_order'] = sortOrder;
    if (sliderImages != null) {
      data['slider_images'] =
          sliderImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderImages {
  String? title;
  String? image;
  String? sortOrder;
  String? cta;

  SliderImages({this.title, this.image, this.sortOrder, this.cta});

  SliderImages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    sortOrder = json['sort_order'];
    cta = json['cta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['sort_order'] = sortOrder;
    data['cta'] = cta;
    return data;
  }
}

class OfferCodeBanner {
  String? bannerImage;
  String? type;

  OfferCodeBanner({this.bannerImage, this.type});

  OfferCodeBanner.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_image'] = bannerImage;
    data['type'] = type;
    return data;
  }
}