//
//  Beer.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation


    // MARK: - Beer
    struct Beer: Codable {
        let id: Int
        let name, tagline, firstBrewed, beerDescription: String
        let imageURL: String
        let abv: Double
        let ibu, targetFg: Double?
        let targetOg: Double?
        let ebc, srm: Double?
        let ph, attenuationLevel: Double?
        let volume, boilVolume: BoilVolume
        let method: Method?
        let ingredients: Ingredients?
        let foodPairing: [String]
        let brewersTips: String
        //let contributedBy: ContributedBy?

        enum CodingKeys: String, CodingKey {
            case id, name, tagline
            case firstBrewed = "first_brewed"
            case beerDescription = "description"
            case imageURL = "image_url"
            case abv, ibu
            case targetFg = "target_fg"
            case targetOg = "target_og"
            case ebc, srm, ph
            case attenuationLevel = "attenuation_level"
            case volume
            case boilVolume = "boil_volume"
            case method, ingredients
            case foodPairing = "food_pairing"
            case brewersTips = "brewers_tips"
            //case contributedBy = "contributed_by"
        }
    }

    // MARK: - BoilVolume
    struct BoilVolume: Codable {
        let value: Double?
        let unit: Unit
    }
//
    enum Unit: String, Codable {
        case celsius = "celsius"
        case grams = "grams"
        case kilograms = "kilograms"
        case litres = "litres"
    }

//    enum ContributedBy: String, Codable {
//        case aliSkinnerLtAliSKinnerGt = "Ali Skinner &lt;Ali SKinner&gt;"
//        case aliSkinnerLtAliSkinnerGt = "Ali Skinner &lt;AliSkinner&gt;"
//        case iainMullanLtIainmullanGt = "Iain Mullan &lt;iainmullan&gt;"
//        case mattBallLtGeordieMattGt = "Matt Ball &lt;GeordieMatt&gt;"
//        case samMasonLtSamjbmasonGt = "Sam Mason &lt;samjbmason&gt;"
//        case sashaLtSashaMasondeCairesGt = "Sasha &lt;SashaMasondeCaires&gt;"
//    }

    // MARK: - Ingredients
    struct Ingredients: Codable {
        let malt: [Malt]
        let hops: [Hop]?
        let yeast: String?
    }

    // MARK: - Hop
    struct Hop: Codable {
        let name: String
        let amount: BoilVolume
        let add: String?
        let attribute: String
    }

//    enum Add: String, Codable {
//        case dryHop = "dry hop"
//        case end = "end"
//        case fv = "FV"
//        case middle = "middle"
//        case start = "start"
//    }

//    enum Attribute: String, Codable {
//        case aroma = "aroma"
//        case bitter = "bitter"
//        case flavour = "flavour"
//        case twist = "twist"
//    }

    // MARK: - Malt
    struct Malt: Codable {
        let name: String
        let amount: BoilVolume
    }

    // MARK: - Method
    struct Method: Codable {
        let mashTemp: [MashTemp]
        let fermentation: Fermentation
        let twist: String?

        enum CodingKeys: String, CodingKey {
            case mashTemp = "mash_temp"
            case fermentation, twist
        }
    }

    // MARK: - Fermentation
    struct Fermentation: Codable {
        let temp: BoilVolume
    }

    // MARK: - MashTemp
    struct MashTemp: Codable {
        let temp: BoilVolume
        let duration: Int?
    }

   
