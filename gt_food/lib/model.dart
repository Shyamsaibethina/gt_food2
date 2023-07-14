// To parse this JSON data, do
//
// final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  DateTime startDate;
  int menuTypeId;
  List<Day> days;
  int id;
  DateTime lastUpdated;
  bool boldAllEntreesEnabled;

  Model({
    required this.startDate,
    required this.menuTypeId,
    required this.days,
    required this.id,
    required this.lastUpdated,
    required this.boldAllEntreesEnabled,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        startDate: DateTime.parse(json["start_date"]),
        menuTypeId: json["menu_type_id"],
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
        id: json["id"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        boldAllEntreesEnabled: json["bold_all_entrees_enabled"],
      );

  Map<String, dynamic> toJson() => {
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "menu_type_id": menuTypeId,
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
        "id": id,
        "last_updated": lastUpdated.toIso8601String(),
        "bold_all_entrees_enabled": boldAllEntreesEnabled,
      };

  Day getMenuDay(DateTime date) {
    return days.firstWhere((element) => element.date.day == date.day);
  }
}

class Day {
  DateTime date;
  bool hasUnpublishedMenus;
  List<MenuItem> menuItems;

  Day({
    required this.date,
    required this.hasUnpublishedMenus,
    required this.menuItems,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        date: DateTime.parse(json["date"]),
        hasUnpublishedMenus: json["has_unpublished_menus"],
        menuItems: List<MenuItem>.from(
            json["menu_items"].map((x) => MenuItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "has_unpublished_menus": hasUnpublishedMenus,
        "menu_items": List<dynamic>.from(menuItems.map((x) => x.toJson())),
      };
}

class SectionOptions {
  String displayName;
  bool useSectionTitle;
  bool sectionTitleCanExpandCollapse;

  SectionOptions({
    required this.displayName,
    required this.useSectionTitle,
    required this.sectionTitleCanExpandCollapse,
  });

  factory SectionOptions.fromJson(Map<String, dynamic> json) => SectionOptions(
        displayName: json["display_name"] ?? "",
        useSectionTitle: json["use_section_title"],
        sectionTitleCanExpandCollapse:
            json["section_title_can_expand_collapse"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "use_section_title": useSectionTitle,
        "section_title_can_expand_collapse": sectionTitleCanExpandCollapse,
      };
}

class MenuItem {
  int id;
  dynamic date;
  int position;
  bool isSectionTitle;
  bool bold;
  bool featured;
  HallLocation? text;
  bool noLineBreak;
  bool blankLine;
  Food? food;
  bool isHoliday;
  dynamic foodList;
  int stationId;
  bool isStationHeader;
  bool stationIsCollapsible;
  String image;
  dynamic imageDescription;
  String? imageAlt;
  String imageThumbnail;
  Category category;
  double? price;
  dynamic servingSize;
  double? servingSizeAmount;
  ServingSizeUnit? servingSizeUnit;
  dynamic smartRecipeId;
  int menuId;

  MenuItem({
    required this.id,
    this.date,
    required this.position,
    required this.isSectionTitle,
    required this.bold,
    required this.featured,
    required this.text,
    required this.noLineBreak,
    required this.blankLine,
    this.food,
    required this.isHoliday,
    this.foodList,
    required this.stationId,
    required this.isStationHeader,
    required this.stationIsCollapsible,
    required this.image,
    this.imageDescription,
    this.imageAlt,
    required this.imageThumbnail,
    required this.category,
    this.price,
    this.servingSize,
    this.servingSizeAmount,
    this.servingSizeUnit,
    this.smartRecipeId,
    required this.menuId,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        id: json["id"],
        date: json["date"],
        position: json["position"],
        isSectionTitle: json["is_section_title"],
        bold: json["bold"],
        featured: json["featured"],
        text: textValues.map[json["text"]],
        noLineBreak: json["no_line_break"],
        blankLine: json["blank_line"],
        food: json["food"] == null ? null : Food.fromJson(json["food"]),
        isHoliday: json["is_holiday"],
        foodList: json["food_list"],
        stationId: json["station_id"],
        isStationHeader: json["is_station_header"],
        stationIsCollapsible: json["station_is_collapsible"],
        image: json["image"],
        imageDescription: json["image_description"],
        imageAlt: json["image_alt"],
        imageThumbnail: json["image_thumbnail"],
        category: categoryValues.map[json["category"]]!,
        price: json["price"]?.toDouble(),
        servingSize: json["serving_size"],
        servingSizeAmount: json["serving_size_amount"]?.toDouble(),
        servingSizeUnit: servingSizeUnitValues.map[json["serving_size_unit"]],
        smartRecipeId: json["smart_recipe_id"],
        menuId: json["menu_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "position": position,
        "is_section_title": isSectionTitle,
        "bold": bold,
        "featured": featured,
        "text": textValues.reverse[text],
        "no_line_break": noLineBreak,
        "blank_line": blankLine,
        "food": food?.toJson(),
        "is_holiday": isHoliday,
        "food_list": foodList,
        "station_id": stationId,
        "is_station_header": isStationHeader,
        "station_is_collapsible": stationIsCollapsible,
        "image": image,
        "image_description": imageDescription,
        "image_alt": imageAlt,
        "image_thumbnail": imageThumbnail,
        "category": categoryValues.reverse[category],
        "price": price,
        "serving_size": servingSize,
        "serving_size_amount": servingSizeAmount,
        "serving_size_unit": servingSizeUnitValues.reverse[servingSizeUnit],
        "smart_recipe_id": smartRecipeId,
        "menu_id": menuId,
      };
}

enum Category {
  EMPTY,
  GRAIN,
  DESSERT,
  ENTREE,
  SIDE,
  CONDIMENT,
  SALAD,
  VEGETABLE,
  MEAT,
  OTHER
}

final categoryValues = EnumValues({
  "condiment": Category.CONDIMENT,
  "dessert": Category.DESSERT,
  "": Category.EMPTY,
  "entree": Category.ENTREE,
  "grain": Category.GRAIN,
  "side": Category.SIDE,
  "salad": Category.SALAD,
  "vegetable": Category.VEGETABLE,
  "meat": Category.MEAT,
  "other": Category.OTHER
});

class Food {
  int id;
  String name;
  Description description;
  String subtext;
  String? imageUrl;
  String? hoverpicUrl;
  double? price;
  String ingredients;
  Category foodCategory;
  dynamic foodHighlightMessage;
  String fileUrl;
  DownloadLabel downloadLabel;
  Map<String, double?> roundedNutritionInfo;
  ServingSizeInfo servingSizeInfo;
  bool hasNutritionInfo;
  Icons icons;
  bool iconsApproved;
  List<int> nestedFoods;
  AggregatedData aggregatedData;
  bool orderingEnabled;
  List<dynamic> foodSizes;
  String dsCaloriesOverride;
  String syncedId;
  dynamic syncPlaceholder;
  bool hasOptionsOrSides;
  String digest;
  String posItemId;
  dynamic smartRecipeId;
  bool hasSubfoods;
  dynamic mealPlanPrice;
  bool useCustomSizes;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.subtext,
    this.imageUrl,
    this.hoverpicUrl,
    this.price,
    required this.ingredients,
    required this.foodCategory,
    this.foodHighlightMessage,
    required this.fileUrl,
    required this.downloadLabel,
    required this.roundedNutritionInfo,
    required this.servingSizeInfo,
    required this.hasNutritionInfo,
    required this.icons,
    required this.iconsApproved,
    required this.nestedFoods,
    required this.aggregatedData,
    required this.orderingEnabled,
    required this.foodSizes,
    required this.dsCaloriesOverride,
    required this.syncedId,
    this.syncPlaceholder,
    required this.hasOptionsOrSides,
    required this.digest,
    required this.posItemId,
    this.smartRecipeId,
    required this.hasSubfoods,
    this.mealPlanPrice,
    required this.useCustomSizes,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
        description: descriptionValues.map[json["description"]]!,
        subtext: json["subtext"],
        imageUrl: json["image_url"],
        hoverpicUrl: json["hoverpic_url"],
        price: json["price"]?.toDouble(),
        ingredients: json["ingredients"],
        foodCategory: categoryValues.map[json["food_category"]]!,
        foodHighlightMessage: json["food_highlight_message"],
        fileUrl: json["file_url"],
        downloadLabel: downloadLabelValues.map[json["download_label"]]!,
        roundedNutritionInfo: Map.from(json["rounded_nutrition_info"])
            .map((k, v) => MapEntry<String, double?>(k, v?.toDouble())),
        servingSizeInfo: ServingSizeInfo.fromJson(json["serving_size_info"]),
        hasNutritionInfo: json["has_nutrition_info"],
        icons: Icons.fromJson(json["icons"]),
        iconsApproved: json["icons_approved"],
        nestedFoods: List<int>.from(json["nested_foods"].map((x) => x)),
        aggregatedData: AggregatedData.fromJson(json["aggregated_data"]),
        orderingEnabled: json["ordering_enabled"],
        foodSizes: List<dynamic>.from(json["food_sizes"].map((x) => x)),
        dsCaloriesOverride: json["ds_calories_override"],
        syncedId: json["synced_id"],
        syncPlaceholder: json["sync_placeholder"],
        hasOptionsOrSides: json["has_options_or_sides"],
        digest: json["digest"],
        posItemId: json["pos_item_id"],
        smartRecipeId: json["smart_recipe_id"],
        hasSubfoods: json["has_subfoods"],
        mealPlanPrice: json["meal_plan_price"],
        useCustomSizes: json["use_custom_sizes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": descriptionValues.reverse[description],
        "subtext": subtext,
        "image_url": imageUrl,
        "hoverpic_url": hoverpicUrl,
        "price": price,
        "ingredients": ingredients,
        "food_category": categoryValues.reverse[foodCategory],
        "food_highlight_message": foodHighlightMessage,
        "file_url": fileUrl,
        "download_label": downloadLabelValues.reverse[downloadLabel],
        "rounded_nutrition_info": Map.from(roundedNutritionInfo)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "serving_size_info": servingSizeInfo.toJson(),
        "has_nutrition_info": hasNutritionInfo,
        "icons": icons.toJson(),
        "icons_approved": iconsApproved,
        "nested_foods": List<dynamic>.from(nestedFoods.map((x) => x)),
        "aggregated_data": aggregatedData.toJson(),
        "ordering_enabled": orderingEnabled,
        "food_sizes": List<dynamic>.from(foodSizes.map((x) => x)),
        "ds_calories_override": dsCaloriesOverride,
        "synced_id": syncedId,
        "sync_placeholder": syncPlaceholder,
        "has_options_or_sides": hasOptionsOrSides,
        "digest": digest,
        "pos_item_id": posItemId,
        "smart_recipe_id": smartRecipeId,
        "has_subfoods": hasSubfoods,
        "meal_plan_price": mealPlanPrice,
        "use_custom_sizes": useCustomSizes,
      };
}

class AggregatedData {
  double priceAdjustment;
  bool iconsApproved;
  List<dynamic> foodIcons;
  double calories;

  AggregatedData({
    required this.priceAdjustment,
    required this.iconsApproved,
    required this.foodIcons,
    required this.calories,
  });

  factory AggregatedData.fromJson(Map<String, dynamic> json) => AggregatedData(
        priceAdjustment: json["price_adjustment"].toDouble(),
        iconsApproved: json["icons_approved"],
        foodIcons: List<dynamic>.from(json["food_icons"].map((x) => x)),
        calories: json["calories"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "price_adjustment": priceAdjustment,
        "icons_approved": iconsApproved,
        "food_icons": List<dynamic>.from(foodIcons.map((x) => x)),
        "calories": calories,
      };
}

enum Description { EMPTY, BURRITO_OR_BOWL_OR_TWISTED_NACHOS }

final descriptionValues = EnumValues({
  "Burrito or Bowl or Twisted Nachos.":
      Description.BURRITO_OR_BOWL_OR_TWISTED_NACHOS,
  "": Description.EMPTY
});

enum DownloadLabel { VIEW_MANUFACTURER_S_LABEL, EMPTY }

final downloadLabelValues = EnumValues({
  "": DownloadLabel.EMPTY,
  "View Manufacturer's Label": DownloadLabel.VIEW_MANUFACTURER_S_LABEL
});

class Icons {
  List<Icon> foodIcons;
  List<Icon> myplateIcons;

  Icons({
    required this.foodIcons,
    required this.myplateIcons,
  });

  factory Icons.fromJson(Map<String, dynamic> json) => Icons(
        foodIcons:
            List<Icon>.from(json["food_icons"].map((x) => Icon.fromJson(x))),
        myplateIcons:
            List<Icon>.from(json["myplate_icons"].map((x) => Icon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "food_icons": List<dynamic>.from(foodIcons.map((x) => x.toJson())),
        "myplate_icons":
            List<dynamic>.from(myplateIcons.map((x) => x.toJson())),
      };
}

class Icon {
  int id;
  Name iconSyncedName;
  bool iconEnabled;
  Sprite sprite;
  dynamic customIconUrl;
  dynamic customIcon;
  int type;
  int behavior;
  bool isFilter;
  bool isHighlight;
  bool isDigitalSignageOnly;
  PurpleSlug slug;
  IconSlugEnum iconSlug;
  Name name;
  Name syncedName;
  HelpText helpText;
  int sortOrder;
  bool enabled;
  int foodIconGroup;

  Icon({
    required this.id,
    required this.iconSyncedName,
    required this.iconEnabled,
    required this.sprite,
    this.customIconUrl,
    this.customIcon,
    required this.type,
    required this.behavior,
    required this.isFilter,
    required this.isHighlight,
    required this.isDigitalSignageOnly,
    required this.slug,
    required this.iconSlug,
    required this.name,
    required this.syncedName,
    required this.helpText,
    required this.sortOrder,
    required this.enabled,
    required this.foodIconGroup,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        id: json["id"],
        iconSyncedName: nameValues.map[json["synced_name"]]!,
        iconEnabled: json["enabled"],
        sprite: Sprite.fromJson(json["sprite"]),
        customIconUrl: json["custom_icon_url"],
        customIcon: json["custom_icon"],
        type: json["type"],
        behavior: json["behavior"],
        isFilter: json["is_filter"],
        isHighlight: json["is_highlight"],
        isDigitalSignageOnly: json["is_digital_signage_only"],
        slug: purpleSlugValues.map[json["slug"]]!,
        iconSlug: iconSlugEnumValues.map[json["icon_slug"]]!,
        name: nameValues.map[json["name"]]!,
        syncedName: nameValues.map[json["_synced_name"]]!,
        helpText: helpTextValues.map[json["help_text"]]!,
        sortOrder: json["sort_order"],
        enabled: json["_enabled"],
        foodIconGroup: json["food_icon_group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "synced_name": nameValues.reverse[iconSyncedName],
        "enabled": iconEnabled,
        "sprite": sprite.toJson(),
        "custom_icon_url": customIconUrl,
        "custom_icon": customIcon,
        "type": type,
        "behavior": behavior,
        "is_filter": isFilter,
        "is_highlight": isHighlight,
        "is_digital_signage_only": isDigitalSignageOnly,
        "slug": purpleSlugValues.reverse[slug],
        "icon_slug": iconSlugEnumValues.reverse[iconSlug],
        "name": nameValues.reverse[name],
        "_synced_name": nameValues.reverse[syncedName],
        "help_text": helpTextValues.reverse[helpText],
        "sort_order": sortOrder,
        "_enabled": enabled,
        "food_icon_group": foodIconGroup,
      };
}

enum HelpText {
  THIS_CONTAINS_WHEAT,
  THIS_CONTAINS_CHICKEN,
  ITEM_CONTAINS_GLUTEN,
  THIS_IS_HALAL,
  THIS_IS_FREE_OF_ANY_ANIMAL_PRODUCTS_AND_SUITABLE_FOR_VEGANS,
  THIS_IS_GLUTEN_FREE,
  THIS_CONTAINS_MILK,
  THIS_CONTAINS_EGG,
  THIS_CONTAINS_SOY,
  THIS_IS_MEAT_FREE_AND_SUITABLE_FOR_VEGETARIANS,
  THIS_CONTAINS_BEEF,
  THIS_CONTAINS_SESAME,
  THIS_CONTAINS_TREE_NUTS,
  THIS_CONTAINS_PORK,
  THIS_CONTAINS_TURKEY,
  THIS_CONTAINS_FISH,
  THIS_CONTAINS_SHELLFISH,
  THIS_CONTAINS_GRAIN,
  THIS_CONTAINS_PROTEIN,
  THIS_CONTAINS_VEGETABLES,
  THIS_CONTAINS_DAIRY,
  THIS_CONTAINS_FRUIT,
  HAS_CEREALS_CONTAINING_GLUTEN
}

final helpTextValues = EnumValues({
  "Has cereals containing gluten": HelpText.HAS_CEREALS_CONTAINING_GLUTEN,
  "Item contains gluten": HelpText.ITEM_CONTAINS_GLUTEN,
  "This contains beef": HelpText.THIS_CONTAINS_BEEF,
  "This contains chicken": HelpText.THIS_CONTAINS_CHICKEN,
  "This contains dairy": HelpText.THIS_CONTAINS_DAIRY,
  "This contains egg": HelpText.THIS_CONTAINS_EGG,
  "This contains fish": HelpText.THIS_CONTAINS_FISH,
  "This contains fruit": HelpText.THIS_CONTAINS_FRUIT,
  "This contains grain": HelpText.THIS_CONTAINS_GRAIN,
  "This contains milk": HelpText.THIS_CONTAINS_MILK,
  "This contains pork": HelpText.THIS_CONTAINS_PORK,
  "This contains protein": HelpText.THIS_CONTAINS_PROTEIN,
  "This contains sesame": HelpText.THIS_CONTAINS_SESAME,
  "This contains shellfish": HelpText.THIS_CONTAINS_SHELLFISH,
  "This contains soy": HelpText.THIS_CONTAINS_SOY,
  "This contains tree nuts": HelpText.THIS_CONTAINS_TREE_NUTS,
  "This contains turkey": HelpText.THIS_CONTAINS_TURKEY,
  "This contains vegetables": HelpText.THIS_CONTAINS_VEGETABLES,
  "This contains wheat": HelpText.THIS_CONTAINS_WHEAT,
  "This is free of any animal products and suitable for vegans":
      HelpText.THIS_IS_FREE_OF_ANY_ANIMAL_PRODUCTS_AND_SUITABLE_FOR_VEGANS,
  "This is gluten-free!": HelpText.THIS_IS_GLUTEN_FREE,
  "This is halal": HelpText.THIS_IS_HALAL,
  "This is meat-free and suitable for vegetarians":
      HelpText.THIS_IS_MEAT_FREE_AND_SUITABLE_FOR_VEGETARIANS
});

enum IconSlugEnum {
  DEFAULT_WHEAT,
  DEFAULT_CHICKEN,
  DEFAULT_CEREALS_CONTAINING_GLUTEN,
  DEFAULT_HALAL,
  DEFAULT_VEGAN,
  DEFAULT_GLUTEN_FREE,
  DEFAULT_MILK,
  DEFAULT_EGG,
  DEFAULT_SOY,
  DEFAULT_VEGETARIAN,
  DEFAULT_BEEF,
  DEFAULT_SESAME,
  DEFAULT_TREE_NUTS,
  DEFAULT_PORK,
  DEFAULT_TURKEY,
  DEFAULT_FISH,
  DEFAULT_SHELLFISH,
  MYPLATE_GRAIN,
  MYPLATE_PROTEIN,
  MYPLATE_VEGETABLE,
  MYPLATE_DAIRY,
  MYPLATE_FRUIT
}

final iconSlugEnumValues = EnumValues({
  "default.beef": IconSlugEnum.DEFAULT_BEEF,
  "default.cereals-containing-gluten":
      IconSlugEnum.DEFAULT_CEREALS_CONTAINING_GLUTEN,
  "default.chicken": IconSlugEnum.DEFAULT_CHICKEN,
  "default.egg": IconSlugEnum.DEFAULT_EGG,
  "default.fish": IconSlugEnum.DEFAULT_FISH,
  "default.gluten-free": IconSlugEnum.DEFAULT_GLUTEN_FREE,
  "default.halal": IconSlugEnum.DEFAULT_HALAL,
  "default.milk": IconSlugEnum.DEFAULT_MILK,
  "default.pork": IconSlugEnum.DEFAULT_PORK,
  "default.sesame": IconSlugEnum.DEFAULT_SESAME,
  "default.shellfish": IconSlugEnum.DEFAULT_SHELLFISH,
  "default.soy": IconSlugEnum.DEFAULT_SOY,
  "default.tree-nuts": IconSlugEnum.DEFAULT_TREE_NUTS,
  "default.turkey": IconSlugEnum.DEFAULT_TURKEY,
  "default.vegan": IconSlugEnum.DEFAULT_VEGAN,
  "default.vegetarian": IconSlugEnum.DEFAULT_VEGETARIAN,
  "default.wheat": IconSlugEnum.DEFAULT_WHEAT,
  "myplate.dairy": IconSlugEnum.MYPLATE_DAIRY,
  "myplate.fruit": IconSlugEnum.MYPLATE_FRUIT,
  "myplate.grain": IconSlugEnum.MYPLATE_GRAIN,
  "myplate.protein": IconSlugEnum.MYPLATE_PROTEIN,
  "myplate.vegetable": IconSlugEnum.MYPLATE_VEGETABLE
});

enum Name {
  WHEAT,
  CHICKEN,
  GLUTEN,
  HALAL,
  VEGAN,
  GLUTEN_FREE,
  MILK,
  EGG,
  SOY,
  VEGETARIAN,
  BEEF,
  SESAME,
  TREE_NUTS,
  PORK,
  TURKEY,
  FISH,
  SHELLFISH,
  GRAIN,
  PROTEIN,
  VEGETABLE,
  DAIRY,
  FRUIT,
  CONTAINING_GLUTEN,
  GLUTEN_FRIENDLY,
  CEREALS_CONTAINING_GLUTEN
}

final nameValues = EnumValues({
  "Beef": Name.BEEF,
  "Cereals Containing Gluten": Name.CEREALS_CONTAINING_GLUTEN,
  "Chicken": Name.CHICKEN,
  "Containing Gluten": Name.CONTAINING_GLUTEN,
  "Dairy": Name.DAIRY,
  "Egg": Name.EGG,
  "Fish": Name.FISH,
  "Fruit": Name.FRUIT,
  "GLUTEN": Name.GLUTEN,
  "Gluten Free": Name.GLUTEN_FREE,
  "Gluten Friendly": Name.GLUTEN_FRIENDLY,
  "Grain": Name.GRAIN,
  "Halal": Name.HALAL,
  "Milk": Name.MILK,
  "Pork": Name.PORK,
  "Protein": Name.PROTEIN,
  "Sesame": Name.SESAME,
  "Shellfish": Name.SHELLFISH,
  "Soy": Name.SOY,
  "Tree Nuts": Name.TREE_NUTS,
  "Turkey": Name.TURKEY,
  "Vegan": Name.VEGAN,
  "Vegetable": Name.VEGETABLE,
  "Vegetarian": Name.VEGETARIAN,
  "Wheat": Name.WHEAT
});

enum PurpleSlug {
  WHEAT,
  CHICKEN,
  CONTAINING_GLUTEN,
  HALAL,
  VEGAN,
  GLUTEN_FRIENDLY,
  MILK,
  EGG,
  SOY,
  VEGETARIAN,
  BEEF,
  SESAME,
  TREE_NUTS,
  PORK,
  TURKEY,
  FISH,
  SHELLFISH,
  GRAIN,
  PROTEIN,
  VEGETABLE,
  DAIRY,
  FRUIT
}

final purpleSlugValues = EnumValues({
  "beef": PurpleSlug.BEEF,
  "chicken": PurpleSlug.CHICKEN,
  "containing-gluten": PurpleSlug.CONTAINING_GLUTEN,
  "dairy": PurpleSlug.DAIRY,
  "egg": PurpleSlug.EGG,
  "fish": PurpleSlug.FISH,
  "fruit": PurpleSlug.FRUIT,
  "gluten-friendly": PurpleSlug.GLUTEN_FRIENDLY,
  "grain": PurpleSlug.GRAIN,
  "halal": PurpleSlug.HALAL,
  "milk": PurpleSlug.MILK,
  "pork": PurpleSlug.PORK,
  "protein": PurpleSlug.PROTEIN,
  "sesame": PurpleSlug.SESAME,
  "shellfish": PurpleSlug.SHELLFISH,
  "soy": PurpleSlug.SOY,
  "tree-nuts": PurpleSlug.TREE_NUTS,
  "turkey": PurpleSlug.TURKEY,
  "vegan": PurpleSlug.VEGAN,
  "vegetable": PurpleSlug.VEGETABLE,
  "vegetarian": PurpleSlug.VEGETARIAN,
  "wheat": PurpleSlug.WHEAT
});

class Sprite {
  IconSlugEnum slug;
  Name name;
  HelpText helpText;
  ClassName className;

  Sprite({
    required this.slug,
    required this.name,
    required this.helpText,
    required this.className,
  });

  factory Sprite.fromJson(Map<String, dynamic> json) => Sprite(
        slug: iconSlugEnumValues.map[json["slug"]]!,
        name: nameValues.map[json["name"]]!,
        helpText: helpTextValues.map[json["help_text"]]!,
        className: classNameValues.map[json["class_name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "slug": iconSlugEnumValues.reverse[slug],
        "name": nameValues.reverse[name],
        "help_text": helpTextValues.reverse[helpText],
        "class_name": classNameValues.reverse[className],
      };
}

enum ClassName {
  WHEAT_ICON,
  CHICKEN_ICON,
  CEREALS_W_GLUTEN_ICON,
  HALAL_ICON,
  VEGAN_ICON,
  GLUTEN_FREE_ICON,
  MILK_ICON,
  EGG_ICON,
  SOY_ICON,
  VEGETARIAN_ICON,
  BEEF_ICON,
  SESAME_ICON,
  TREE_NUTS_ICON,
  PORK_ICON,
  TURKEY_ICON,
  FISH_ICON,
  SHELLFISH_ICON,
  GRAIN_GROUP,
  PROTEIN_GROUP,
  VEGETABLE_GROUP,
  DAIRY_GROUP,
  FRUIT_GROUP
}

final classNameValues = EnumValues({
  "beef-icon": ClassName.BEEF_ICON,
  "cereals-w-gluten-icon": ClassName.CEREALS_W_GLUTEN_ICON,
  "chicken-icon": ClassName.CHICKEN_ICON,
  "dairy-group": ClassName.DAIRY_GROUP,
  "egg-icon": ClassName.EGG_ICON,
  "fish-icon": ClassName.FISH_ICON,
  "fruit-group": ClassName.FRUIT_GROUP,
  "gluten-free-icon": ClassName.GLUTEN_FREE_ICON,
  "grain-group": ClassName.GRAIN_GROUP,
  "halal-icon": ClassName.HALAL_ICON,
  "milk-icon": ClassName.MILK_ICON,
  "pork-icon": ClassName.PORK_ICON,
  "protein-group": ClassName.PROTEIN_GROUP,
  "sesame-icon": ClassName.SESAME_ICON,
  "shellfish-icon": ClassName.SHELLFISH_ICON,
  "soy-icon": ClassName.SOY_ICON,
  "tree-nuts-icon": ClassName.TREE_NUTS_ICON,
  "turkey-icon": ClassName.TURKEY_ICON,
  "vegan-icon": ClassName.VEGAN_ICON,
  "vegetable-group": ClassName.VEGETABLE_GROUP,
  "vegetarian-icon": ClassName.VEGETARIAN_ICON,
  "wheat-icon": ClassName.WHEAT_ICON
});

class ServingSizeInfo {
  String? servingSizeAmount;
  ServingSizeUnit? servingSizeUnit;

  ServingSizeInfo({
    this.servingSizeAmount,
    this.servingSizeUnit,
  });

  factory ServingSizeInfo.fromJson(Map<String, dynamic> json) =>
      ServingSizeInfo(
        servingSizeAmount: json["serving_size_amount"],
        servingSizeUnit: servingSizeUnitValues.map[json["serving_size_unit"]],
      );

  Map<String, dynamic> toJson() => {
        "serving_size_amount": servingSizeAmount,
        "serving_size_unit": servingSizeUnitValues.reverse[servingSizeUnit],
      };
}

enum ServingSizeUnit {
  EACH,
  SLICE,
  OZ,
  THE_3_OZ_SCOOP,
  THE_4_OZ_LADLE,
  SERVING,
  THE_4_OZ_PORTION,
  CUPS,
  THE_12_CUP,
  CUP,
  THE_2_OZ_PORTION,
  SLICE_18_PIZZA,
  PORTION
}

final servingSizeUnitValues = EnumValues({
  "cup": ServingSizeUnit.CUP,
  "cups": ServingSizeUnit.CUPS,
  "each": ServingSizeUnit.EACH,
  "oz": ServingSizeUnit.OZ,
  "portion": ServingSizeUnit.PORTION,
  "serving": ServingSizeUnit.SERVING,
  "slice": ServingSizeUnit.SLICE,
  "slice (1/8 pizza)": ServingSizeUnit.SLICE_18_PIZZA,
  "1/2 cup": ServingSizeUnit.THE_12_CUP,
  "2 oz portion": ServingSizeUnit.THE_2_OZ_PORTION,
  "3 oz scoop": ServingSizeUnit.THE_3_OZ_SCOOP,
  "4 oz ladle": ServingSizeUnit.THE_4_OZ_LADLE,
  "4 oz portion": ServingSizeUnit.THE_4_OZ_PORTION
});

enum HallLocation {
  WHITE_GOLD_GRILL,
  GRILL_TOPPINGS,
  EMPTY,
  GINGER_SPICE,
  VEGAN_VEGETARIAN,
  LEANING_TOWER,
  MINDFUL_BYTES,
  TECH_TAQUERIA,
  FRUIT,
  RAMBLIN_COFFEE,
  RAMBLIN_SWEETS,
  YOGURT,
  BAKED_GOODS,
  SIDEWAYS_DINER,
  GLOBAL_CONNECTION,
  ACTION_EXPO,
  HOME_NETWORK,
  PI_ZONE,
  WELLNESS_INNOVATION,
  BUZZIN_BLENDS,
  SOUP_OF_THE_DAY,
  ENGINEERED_SALADS,
  FRESH_CUT_SALADS,
  DRESSINGS,
  HI_REZ_PASTRIES
}

final textValues = EnumValues({
  "": HallLocation.EMPTY,
  "Fruit": HallLocation.FRUIT,
  "Ginger & Spice": HallLocation.GINGER_SPICE,
  "Leaning Tower": HallLocation.LEANING_TOWER,
  "Mindful Bytes": HallLocation.MINDFUL_BYTES,
  "Ramblin' Coffee": HallLocation.RAMBLIN_COFFEE,
  "Ramblin' Sweets": HallLocation.RAMBLIN_SWEETS,
  "Tech Taqueria": HallLocation.TECH_TAQUERIA,
  "Vegan/Vegetarian": HallLocation.VEGAN_VEGETARIAN,
  "White & Gold Grill": HallLocation.WHITE_GOLD_GRILL,
  "Grill Toppings": HallLocation.GRILL_TOPPINGS,
  "Yogurt": HallLocation.YOGURT,
  "Baked Goods": HallLocation.BAKED_GOODS,
  "Action Expo": HallLocation.ACTION_EXPO,
  "Buzzin' Blends": HallLocation.BUZZIN_BLENDS,
  "Dressings": HallLocation.DRESSINGS,
  "Engineered Salads": HallLocation.ENGINEERED_SALADS,
  "Fresh Cut Salads": HallLocation.FRESH_CUT_SALADS,
  "Global Connection": HallLocation.GLOBAL_CONNECTION,
  "Hi Rez Pastries": HallLocation.HI_REZ_PASTRIES,
  "Home Network": HallLocation.HOME_NETWORK,
  "Pi Zone": HallLocation.PI_ZONE,
  "Sideways Diner": HallLocation.SIDEWAYS_DINER,
  "Soup of the Day": HallLocation.SOUP_OF_THE_DAY,
  "Wellness Innovation": HallLocation.WELLNESS_INNOVATION
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
