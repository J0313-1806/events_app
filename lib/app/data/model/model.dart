// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

class EventModel {
  EventModel({
    required this.success,
    required this.data,
    required this.message,
    required this.type,
  });

  final bool success;
  final Data data;
  final String message;
  final String type;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        type: json["type"],
      );
}

class Data {
  Data({
    required this.advertisments,
    required this.packages,
    required this.sections,
  });

  final List<Advertisment> advertisments;
  final List<Package> packages;
  final List<Section> sections;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        advertisments: List<Advertisment>.from(
            json["advertisments"].map((x) => Advertisment.fromJson(x))),
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
      );
}

class Advertisment {
  Advertisment({
    required this.id,
    required this.thumbnail,
    required this.productId,
    required this.packageId,
    required this.page,
    required this.row,
    required this.sectionId,
    required this.giftId,
    required this.offerId,
    required this.type,
    required this.userId,
    required this.priority,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.rating,
    required this.reviewsCount,
    required this.ratingText,
    // required this.product,
    // required this.package,
  });

  final int id;
  final String thumbnail;
  final int productId;
  final int packageId;
  final String page;
  final int row;
  final int sectionId;
  final int giftId;
  final int offerId;
  final int type;
  final int userId;
  final int priority;
  final String imageUrl;
  final String thumbnailUrl;
  final double rating;
  final int reviewsCount;
  final PackageRatingText ratingText;
  // final dynamic product;
  // final Package package;

  factory Advertisment.fromJson(Map<String, dynamic> json) => Advertisment(
        id: json["id"],
        thumbnail: json["thumbnail"],
        productId: json["product_id"] == null ? 0 : json["product_id"],
        packageId: json["package_id"],
        page: json["page"],
        row: json["row"],
        sectionId: json["section_id"],
        giftId: json["gift_id"],
        offerId: json["offer_id"],
        type: json["type"],
        userId: json["user_id"],
        priority: json["priority"],
        imageUrl: json["image_url"],
        thumbnailUrl: json["thumbnail_url"],
        rating: json["rating"].toDouble(),
        reviewsCount: json["reviews_count"],
        ratingText: PackageRatingText.fromJson(json["rating_text"]),
        // product: json["product"] == null ? "" : json["product"],
        // package: json["package"] == null ? null : Package.fromJson(json["package"]),
      );
// json["package"] == null ? null :
}

class Package {
  Package({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.deliveryCharge,
    required this.tax,
    required this.total,
    required this.totalPartPayment,
    required this.headerImageUrl,
    required this.displayRating,
    required this.vendorProfileUrl,
    required this.vendorCompanyName,
    required this.totalProductsPrice,
    required this.type,
    required this.totalDiscount,
    required this.reviewsCount,
    required this.ratingText,
    required this.taxPrice,
    required this.fPrice,
    required this.fDeliveryCharge,
    required this.fTotal,
    required this.fTaxPrice,
    required this.fTotalDiscount,
    required this.fTotalProductsPrice,
    required this.products,
  });

  final int id;
  final String name;
  final int price;
  final String description;
  final int rating;
  final int deliveryCharge;
  final int tax;
  final double total;
  final double totalPartPayment;
  final String headerImageUrl;
  final String displayRating;
  final String vendorProfileUrl;
  final String vendorCompanyName;
  final double totalProductsPrice;
  final String type;
  final double totalDiscount;
  final int reviewsCount;
  final PackageRatingText ratingText;
  final int taxPrice;
  final String fPrice;
  final String fDeliveryCharge;
  final String fTotal;
  final String fTaxPrice;
  final String fTotalDiscount;
  final String fTotalProductsPrice;
  final List<ProductElement> products;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        rating: json["rating"],
        deliveryCharge: json["delivery_charge"],
        tax: json["tax"],
        total: json["total"].toDouble(),
        totalPartPayment: json["total_part_payment"].toDouble(),
        headerImageUrl: json["header_image_url"],
        displayRating: json["display_rating"],
        vendorProfileUrl: json["vendor_profile_url"],
        vendorCompanyName: json["vendor_company_name"],
        totalProductsPrice: json["total_products_price"].toDouble(),
        type: json["type"],
        totalDiscount: json["total_discount"].toDouble(),
        reviewsCount: json["reviews_count"],
        ratingText: PackageRatingText.fromJson(json["rating_text"]),
        taxPrice: json["tax_price"],
        fPrice: json["f_price"],
        fDeliveryCharge: json["f_delivery_charge"],
        fTotal: json["f_total"],
        fTaxPrice: json["f_tax_price"],
        fTotalDiscount: json["f_total_discount"],
        fTotalProductsPrice: json["f_total_products_price"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );
}

class ProductElement {
  ProductElement({
    required this.id,
    required this.packageId,
    required this.productId,
    required this.partPayment,
    required this.price,
    required this.fPrice,
    required this.fPartPayment,
    required this.product,
  });

  final int id;
  final int packageId;
  final int productId;
  final int partPayment;
  final double price;
  final String fPrice;
  final String fPartPayment;
  final ProductProduct product;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"],
        packageId: json["package_id"],
        productId: json["product_id"],
        partPayment: json["part_payment"],
        price: json["price"].toDouble(),
        fPrice: json["f_price"],
        fPartPayment: json["f_part_payment"],
        product: ProductProduct.fromJson(json["product"]),
      );
}

class ProductProduct {
  ProductProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.currencyId,
    required this.price,
    required this.deliveryCharges,
    required this.extraAttributes,
    required this.paymentMethods,
    required this.deliveryMethods,
    required this.discount,
    required this.total,
    required this.rating,
    required this.tax,
    required this.bannerImageUrl,
    required this.isFavourite,
    required this.discountPrice,
    required this.taxPrice,
    required this.type,
    required this.inStock,
    required this.fPrice,
    required this.fPriceWithoutOffer,
    required this.fDiscountPrice,
    required this.fTaxPrice,
    required this.fTotal,
    // required this.user,
  });

  final int id;
  final String name;
  final String description;
  final int categoryId;
  final int currencyId;
  final int price;
  final int deliveryCharges;
  final String extraAttributes;
  final String paymentMethods;
  final String deliveryMethods;
  final int discount;
  final double total;
  final double rating;
  final int tax;
  final String bannerImageUrl;
  final bool isFavourite;
  final double discountPrice;
  final double taxPrice;
  final String type;
  final int inStock;
  final String fPrice;
  final String fPriceWithoutOffer;
  final String fDiscountPrice;
  final String fTaxPrice;
  final String fTotal;
  // final User user;

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        currencyId: json["currency_id"],
        price: json["price"],
        deliveryCharges: json["delivery_charges"],
        extraAttributes: json["extra_attributes"],
        paymentMethods: json["payment_methods"],
        deliveryMethods: json["delivery_methods"],
        discount: json["discount"],
        total: json["total"].toDouble(),
        rating: json["rating"].toDouble(),
        tax: json["tax"],
        bannerImageUrl: json["banner_image_url"],
        isFavourite: json["is_favourite"],
        discountPrice: json["discount_price"].toDouble(),
        taxPrice: json["tax_price"].toDouble(),
        type: json["type"],
        inStock: json["in_stock"],
        fPrice: json["f_price"],
        fPriceWithoutOffer: json["f_price_without_offer"],
        fDiscountPrice: json["f_discount_price"],
        fTaxPrice: json["f_tax_price"],
        fTotal: json["f_total"],
        // user: User.fromJson(json["user"]),
      );
}

// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.currentTeamId,
//     required this.profilePhotoPath,
//     required this.phone,
//     required this.countryId,
//     required this.age,
//     required this.gender,
//     required this.dob,
//     required this.companyName,
//     required this.username,
//     required this.rating,
//     required this.reviews,
//     required this.address,
//     required this.description,
//     required this.balance,
//     required this.interest,
//     required this.like,
//     required this.dislike,
//     required this.businessLicense,
//     required this.commission,
//     required this.contract,
//     required this.dobStatus,
//     required this.isSupport,
//     required this.token,
//     required this.chances,
//     required this.googleId,
//     required this.fbId,
//     required this.appleId,
//     required this.twitterId,
//     required this.profileUrl,
//     required this.countryData,
//     required this.defaultAddress,
//     required this.totalPurchasedItems,
//     required this.totalFavouriteItems,
//     required this.totalPurchased,
//     required this.businessLicenseUrl,
//     required this.contractUrl,
//     required this.vendorImages,
//     required this.reviewsCount,
//     required this.ratingText,
//     required this.avgProductPrice,
//     required this.avgOffersDiscount,
//     required this.nearBy,
//     required this.fBalance,
//     required this.fAvgProductPrice,
//     required this.fAvgOffersDiscount,
//   });

//   final int id;
//   final String name;
//   final String email;
//   final dynamic currentTeamId;
//   final dynamic profilePhotoPath;
//   final String phone;
//   final int countryId;
//   final int age;
//   final int gender;
//   final String dob;
//   final String companyName;
//   final String username;
//   final int rating;
//   final int reviews;
//   final String address;
//   final String description;
//   final int balance;
//   final int interest;
//   final int like;
//   final int dislike;
//   final String businessLicense;
//   final double commission;
//   final String contract;
//   final int dobStatus;
//   final int isSupport;
//   final dynamic token;
//   final int chances;
//   final dynamic googleId;
//   final dynamic fbId;
//   final dynamic appleId;
//   final dynamic twitterId;
//   final String profileUrl;
//   final CountryData countryData;
//   final dynamic defaultAddress;
//   final int totalPurchasedItems;
//   final int totalFavouriteItems;
//   final int totalPurchased;
//   final String businessLicenseUrl;
//   final String contractUrl;
//   final List<VendorImage> vendorImages;
//   final int reviewsCount;
//   final UserRatingText ratingText;
//   final double avgProductPrice;
//   final double avgOffersDiscount;
//   final String nearBy;
//   final String fBalance;
//   final String fAvgProductPrice;
//   final String fAvgOffersDiscount;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         currentTeamId: json["current_team_id"],
//         profilePhotoPath: json["profile_photo_path"],
//         phone: json["phone"],
//         countryId: json["country_id"],
//         age: json["age"],
//         gender: json["gender"],
//         dob: json["dob"],
//         companyName: json["company_name"],
//         username: json["username"],
//         rating: json["rating"],
//         reviews: json["reviews"],
//         address: json["address"],
//         description: json["description"],
//         balance: json["balance"],
//         interest: json["interest"],
//         like: json["like"],
//         dislike: json["dislike"],
//         businessLicense: json["business_license"],
//         commission: json["commission"].toDouble(),
//         contract: json["contract"],
//         dobStatus: json["dob_status"],
//         isSupport: json["is_support"],
//         token: json["token"],
//         chances: json["chances"],
//         googleId: json["google_id"],
//         fbId: json["fb_id"],
//         appleId: json["apple_id"],
//         twitterId: json["twitter_id"],
//         profileUrl: json["profile_url"],
//         countryData: CountryData.fromJson(json["country_data"]),
//         defaultAddress: json["default_address"],
//         totalPurchasedItems: json["total_purchased_items"],
//         totalFavouriteItems: json["total_favourite_items"],
//         totalPurchased: json["total_purchased"],
//         businessLicenseUrl: json["business_license_url"],
//         contractUrl: json["contract_url"],
//         vendorImages: List<VendorImage>.from(
//             json["vendor_images"].map((x) => VendorImage.fromJson(x))),
//         reviewsCount: json["reviews_count"],
//         ratingText: UserRatingText.fromJson(json["rating_text"]),
//         avgProductPrice: json["avg_product_price"].toDouble(),
//         avgOffersDiscount: json["avg_offers_discount"].toDouble(),
//         nearBy: json["near_by"],
//         fBalance: json["f_balance"],
//         fAvgProductPrice: json["f_avg_product_price"],
//         fAvgOffersDiscount: json["f_avg_offers_discount"],
//       );
// }

// class CountryData {
//   CountryData({
//     required this.id,
//     required this.countryCode,
//     required this.countryName,
//     required this.dialCode,
//     required this.flagUrl,
//   });

//   final int id;
//   final String countryCode;
//   final String countryName;
//   final String dialCode;
//   final String flagUrl;

//   factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
//         id: json["id"],
//         countryCode: json["country_code"],
//         countryName: json["country_name"],
//         dialCode: json["dial_code"],
//         flagUrl: json["flag_url"],
//       );
// }

// class UserRatingText {
//   UserRatingText({
//     required this.color,
//     required this.value,
//     required this.text,
//   });

//   final String color;
//   final int value;
//   final String text;

//   factory UserRatingText.fromJson(Map<String, dynamic> json) => UserRatingText(
//         color: json["color"],
//         value: json["value"],
//         text: json["text"],
//       );
// }

// class VendorImage {
//   VendorImage({
//     required this.imageUrl,
//   });

//   final String imageUrl;

//   factory VendorImage.fromJson(Map<String, dynamic> json) => VendorImage(
//         imageUrl: json["image_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "image_url": imageUrl,
//       };
// }

class PackageRatingText {
  PackageRatingText({
    required this.color,
    required this.text,
  });

  final String color;
  final String text;

  factory PackageRatingText.fromJson(Map<String, dynamic> json) =>
      PackageRatingText(
        color: json["color"],
        text: json["text"],
      );
}

class Section {
  Section({
    required this.id,
    required this.title,
    required this.image,
    required this.headerImage,
    required this.userId,
    required this.imageUrl,
    required this.headerImageUrl,
  });

  final int id;
  final String title;
  final String image;
  final String headerImage;
  final int userId;
  final String imageUrl;
  final String headerImageUrl;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        headerImage: json["header_image"],
        userId: json["user_id"],
        imageUrl: json["image_url"],
        headerImageUrl: json["header_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "header_image": headerImage,
        "user_id": userId,
        "image_url": imageUrl,
        "header_image_url": headerImageUrl,
      };
}

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
