//
//  Recipe.swift
//  SoftXpert
//
//  Created by John Doe on 2022-01-25.
//


import Foundation

// MARK: - Recipe
struct Recipe: Codable {
    var from, to, count: Int?
    var links: RecipeLinks?
    var hits: [Hit]?

    enum CodingKeys: String, CodingKey {
        case from, to, count
        case links = "_links"
        case hits
    }
}

// MARK: - Hit
struct Hit: Codable {
    var recipe: RecipeClass?
    var links: HitLinks?

    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}

// MARK: - HitLinks
struct HitLinks: Codable {
    var linksSelf: Next?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Next
struct Next: Codable {
    var href: String?
    var title: Title?
}

enum Title: String, Codable {
    case nextPage = "Next page"
    case titleSelf = "Self"
}

// MARK: - RecipeClass
struct RecipeClass: Codable {
    var uri: String?
    var label: String?
    var image: String?
    var images: Images?
    var source: String?
    var url: String?
    var shareAs: String?
    var yield: Int?
    var dietLabels, healthLabels: [String]?
    var cautions: [Caution]?
    var ingredientLines: [String]?
    var ingredients: [Ingredient]?
    var calories, totalWeight, totalTime: Double?
    var cuisineType: [String]?
    var mealType: [MealType]?
    var dishType: [String]?
    var totalNutrients, totalDaily: [String: Total]?
    var digest: [Digest]?
}

enum Caution: String, Codable {
    case gluten = "Gluten"
    case sulfites = "Sulfites"
    case wheat = "Wheat"
}

// MARK: - Digest
struct Digest: Codable {
    var label, tag: String?
    var schemaOrgTag: SchemaOrgTag?
    var total: Double?
    var hasRDI: Bool?
    var daily: Double?
    var unit: Unit?
    var sub: [Digest]?
}

enum SchemaOrgTag: String, Codable {
    case carbohydrateContent = "carbohydrateContent"
    case cholesterolContent = "cholesterolContent"
    case fatContent = "fatContent"
    case fiberContent = "fiberContent"
    case proteinContent = "proteinContent"
    case saturatedFatContent = "saturatedFatContent"
    case sodiumContent = "sodiumContent"
    case sugarContent = "sugarContent"
    case transFatContent = "transFatContent"
}

enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

// MARK: - Images
struct Images: Codable {
    var thumbnail, small, regular, large: Large?

    enum CodingKeys: String, CodingKey {
        case thumbnail = "THUMBNAIL"
        case small = "SMALL"
        case regular = "REGULAR"
        case large = "LARGE"
    }
}

// MARK: - Large
struct Large: Codable {
    var url: String?
    var width, height: Int?
}

// MARK: - Ingredient
struct Ingredient: Codable {
    var text: String?
    var quantity: Double?
    var measure: Measure?
    var food: String?
    var weight: Double?
    var foodCategory, foodID: String?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}

enum Measure: String, Codable {
    case cup = "cup"
    case gram = "gram"
    case milliliter = "milliliter"
    case ounce = "ounce"
    case pinch = "pinch"
    case pound = "pound"
    case rib = "rib"
    case stalk = "stalk"
    case tablespoon = "tablespoon"
    case teaspoon = "teaspoon"
    case unit = "<unit>"
}

enum MealType: String, Codable {
    case breakfast = "breakfast"
    case lunchDinner = "lunch/dinner"
    case teatime = "teatime"
}

// MARK: - Total
struct Total: Codable {
    var label: String?
    var quantity: Double?
    var unit: Unit?
}

// MARK: - RecipeLinks
struct RecipeLinks: Codable {
    var next: Next?
}
