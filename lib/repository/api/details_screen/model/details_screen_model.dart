// To parse this JSON data, do
//
//     final detailsModel = detailsModelFromJson(jsonString);

import 'dart:convert';

DetailsModel detailsModelFromJson(String str) => DetailsModel.fromJson(json.decode(str));

String detailsModelToJson(DetailsModel data) => json.encode(data.toJson());

class DetailsModel {
    List<Datum>? data;
    Links? links;
    Meta? meta;

    DetailsModel({
        this.data,
        this.links,
        this.meta,
    });

    factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Datum {
    int? id;
    String? slug;
    String? title;
    String? shortDescription;
    DateTime? publishedOn;
    PublishedBy? publishedBy;
    FeaturedImage? featuredImage;
    Category? category;
    List<dynamic>? tags;

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

class Links {
    String? first;
    String? last;
    dynamic prev;
    dynamic next;

    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    int? currentPage;
    int? from;
    int? lastPage;
    List<Link>? links;
    String? path;
    int? perPage;
    int? to;
    int? total;

    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}

class Link {
    String? url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
