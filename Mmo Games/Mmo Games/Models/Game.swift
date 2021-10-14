//
//  Game.swift
//  Mmo Games
//
//  Created by Mobilitat on 14/10/21.
//

import Foundation

// MARK: - Game
struct Game: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String
    let gameURL: String
    let genre: Genre
    let platform: Platform
    let publisher, developer, releaseDate: String
    let profileURL: String

    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail
        case shortDescription = "short_description"
        case gameURL = "game_url"
        case genre, platform, publisher, developer
        case releaseDate = "release_date"
        case profileURL = "profile_url"
    }
}

enum Genre: String, Codable {
    case actionRPG = "Action RPG"
    case arpg = "ARPG"
    case battleRoyale = "Battle Royale"
    case card = "Card"
    case cardGame = "Card Game"
    case fantasy = "Fantasy"
    case fighting = "Fighting"
    case genreMMORPG = " MMORPG"
    case mmo = "MMO"
    case mmorpg = "MMORPG"
    case moba = "MOBA"
    case racing = "Racing"
    case shooter = "Shooter"
    case social = "Social"
    case sports = "Sports"
    case strategy = "Strategy"
}

enum Platform: String, Codable {
    case pcWindows = "PC (Windows)"
    case pcWindowsWebBrowser = "PC (Windows), Web Browser"
    case webBrowser = "Web Browser"
}


