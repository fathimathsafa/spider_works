// To parse this JSON data, do
//
//     final detailsModel = detailsModelFromJson(jsonString);

import 'dart:convert';

DetailsModel detailsModelFromJson(String str) => DetailsModel.fromJson(json.decode(str));

String detailsModelToJson(DetailsModel data) => json.encode(data.toJson());

class DetailsModel {
    Data? data;

    DetailsModel({
        this.data,
    });

    factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? slug;
    String? title;
    String? shortDescription;
    DateTime? publishedOn;
    PublishedBy? publishedBy;
    String? content;
    dynamic bottomText;
    dynamic bottomButtonText;
    dynamic bottomButtonUrl;
    dynamic bottomButtonTarget;
    FeaturedImage? featuredImage;
    dynamic bannerImage;
    String? browserTitle;
    dynamic ogTitle;
    String? metaDescription;
    dynamic ogDescription;
    dynamic ogImage;
    String? metaKeywords;
    dynamic bottomDescription;
    dynamic extraJs;
    dynamic visitCount;
    List<dynamic>? tags;
    List<RelatedBlog>? relatedBlogs;

    Data({
        this.id,
        this.slug,
        this.title,
        this.shortDescription,
        this.publishedOn,
        this.publishedBy,
        this.content,
        this.bottomText,
        this.bottomButtonText,
        this.bottomButtonUrl,
        this.bottomButtonTarget,
        this.featuredImage,
        this.bannerImage,
        this.browserTitle,
        this.ogTitle,
        this.metaDescription,
        this.ogDescription,
        this.ogImage,
        this.metaKeywords,
        this.bottomDescription,
        this.extraJs,
        this.visitCount,
        this.tags,
        this.relatedBlogs,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        shortDescription: json["short_description"],
        publishedOn: json["published_on"] == null ? null : DateTime.parse(json["published_on"]),
        publishedBy: json["published_by"] == null ? null : PublishedBy.fromJson(json["published_by"]),
        content: json["content"],
        bottomText: json["bottom_text"],
        bottomButtonText: json["bottom_button_text"],
        bottomButtonUrl: json["bottom_button_url"],
        bottomButtonTarget: json["bottom_button_target"],
        featuredImage: json["featured_image"] == null ? null : FeaturedImage.fromJson(json["featured_image"]),
        bannerImage: json["banner_image"],
        browserTitle: json["browser_title"],
        ogTitle: json["og_title"],
        metaDescription: json["meta_description"],
        ogDescription: json["og_description"],
        ogImage: json["og_image"],
        metaKeywords: json["meta_keywords"],
        bottomDescription: json["bottom_description"],
        extraJs: json["extra_js"],
        visitCount: json["visit_count"],
        tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
        relatedBlogs: json["related_blogs"] == null ? [] : List<RelatedBlog>.from(json["related_blogs"]!.map((x) => RelatedBlog.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "short_description": shortDescription,
        "published_on": publishedOn?.toIso8601String(),
        "published_by": publishedBy?.toJson(),
        "content": content,
        "bottom_text": bottomText,
        "bottom_button_text": bottomButtonText,
        "bottom_button_url": bottomButtonUrl,
        "bottom_button_target": bottomButtonTarget,
        "featured_image": featuredImage?.toJson(),
        "banner_image": bannerImage,
        "browser_title": browserTitle,
        "og_title": ogTitle,
        "meta_description": metaDescription,
        "og_description": ogDescription,
        "og_image": ogImage,
        "meta_keywords": metaKeywords,
        "bottom_description": bottomDescription,
        "extra_js": extraJs,
        "visit_count": visitCount,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "related_blogs": relatedBlogs == null ? [] : List<dynamic>.from(relatedBlogs!.map((x) => x.toJson())),
    };
}

class FeaturedImage {
    String? fileName;
    String? filePath;
    String? fileType;
    int? fileSize;
    String? mediaType;
    dynamic altText;

    FeaturedImage({
        this.fileName,
        this.filePath,
        this.fileType,
        this.fileSize,
        this.mediaType,
        this.altText,
    });

    factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
        fileName: json["file_name"],
        filePath: json["file_path"],
        fileType: json["file_type"],
        fileSize: json["file_size"],
        mediaType: json["media_type"],
        altText: json["alt_text"],
    );

    Map<String, dynamic> toJson() => {
        "file_name": fileName,
        "file_path": filePath,
        "file_type": fileType,
        "file_size": fileSize,
        "media_type": mediaType,
        "alt_text": altText,
    };
}

class PublishedBy {
    int? id;
    String? slug;
    String? name;
    String? designation;
    String? shortDescription;
    dynamic facebookLink;
    dynamic twitterLink;
    dynamic linkedinLink;
    dynamic instagramLink;
    dynamic youtubeLink;
    FeaturedImage? featuredImage;

    PublishedBy({
        this.id,
        this.slug,
        this.name,
        this.designation,
        this.shortDescription,
        this.facebookLink,
        this.twitterLink,
        this.linkedinLink,
        this.instagramLink,
        this.youtubeLink,
        this.featuredImage,
    });

    factory PublishedBy.fromJson(Map<String, dynamic> json) => PublishedBy(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        designation: json["designation"],
        shortDescription: json["short_description"],
        facebookLink: json["facebook_link"],
        twitterLink: json["twitter_link"],
        linkedinLink: json["linkedin_link"],
        instagramLink: json["instagram_link"],
        youtubeLink: json["youtube_link"],
        featuredImage: json["featured_image"] == null ? null : FeaturedImage.fromJson(json["featured_image"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "designation": designation,
        "short_description": shortDescription,
        "facebook_link": facebookLink,
        "twitter_link": twitterLink,
        "linkedin_link": linkedinLink,
        "instagram_link": instagramLink,
        "youtube_link": youtubeLink,
        "featured_image": featuredImage?.toJson(),
    };
}

class RelatedBlog {
    int? id;
    String? slug;
    String? title;
    String? shortDescription;
    DateTime? publishedOn;
    PublishedBy? publishedBy;
    FeaturedImage? featuredImage;
    Category? category;
    List<dynamic>? tags;

    RelatedBlog({
        this.id,
        this.slug,
        this.title,
        this.shortDescription,
        this.publishedOn,
        this.publishedBy,
        this.featuredImage,
        this.category,
        this.tags,
    });

    factory RelatedBlog.fromJson(Map<String, dynamic> json) => RelatedBlog(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        shortDescription: json["short_description"],
        publishedOn: json["published_on"] == null ? null : DateTime.parse(json["published_on"]),
        publishedBy: json["published_by"] == null ? null : PublishedBy.fromJson(json["published_by"]),
        featuredImage: json["featured_image"] == null ? null : FeaturedImage.fromJson(json["featured_image"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "short_description": shortDescription,
        "published_on": publishedOn?.toIso8601String(),
        "published_by": publishedBy?.toJson(),
        "featured_image": featuredImage?.toJson(),
        "category": category?.toJson(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    };
}

class Category {
    int? id;
    String? slug;
    String? name;
    String? title;

    Category({
        this.id,
        this.slug,
        this.name,
        this.title,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "title": title,
    };
}
