//
//  MovieDetailsResponse.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import domain

public class MovieDetailsResponse: Codable {
    let adult: Bool?
    let backdropPath: String?
    //let belongs_to_collection: Any?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbId: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Float?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Float?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        //case belongs_to_collection
        case budget
        case genres
        case homepage
        case id
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    init(
        adult: Bool?,
        backdropPath: String?,
        //belongs_to_collection: Any?,
        budget: Int?,
        genres: [Genre]?,
        homepage: String?,
        id: Int?,
        imdbId: String?,
        originalLanguage: String?,
        originalTitle: String?,
        overview: String?,
        popularity: Float?,
        posterPath: String?,
        productionCompanies: [ProductionCompany]?,
        productionCountries: [ProductionCountry]?,
        releaseDate: String?,
        revenue: Int?,
        runtime: Int?,
        spokenLanguages: [SpokenLanguage]?,
        status: String?,
        tagline: String?,
        title: String?,
        video: Bool?,
        voteAverage: Float?,
        voteCount: Int?
    ) {
        self.adult = adult
        self.backdropPath = backdropPath
        //self.belongs_to_collection = belongs_to_collection
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.id = id
        self.imdbId = imdbId
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.productionCompanies = productionCompanies
        self.productionCountries = productionCountries
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.spokenLanguages = spokenLanguages
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}

extension MovieDetailsResponse {
    func toDomain() -> MovieDetailsDomain {
        return MovieDetailsDomain(
            id: self.id ?? -1,
            overview: self.overview ?? "",
            title: self.title ?? "",
            imageUrl: (!(posterPath?.isEmpty ?? true)) ? ""/*BuildConfiguration.shared.IMAGE_URL_BASE_PATH*/ + (posterPath ?? "") : ""
        )
    }
}
