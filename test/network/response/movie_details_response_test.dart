import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_movie_app/network/response/response.dart';
import 'package:flutter_movie_app/network/models/models.dart';

void main() {
  group('MovieDetailsResponse', () {
    group('fromJson', () {
      test('initialize null values with correct values', () {
        expect(
          MovieDetailsResponse.fromJson({}),
          MovieDetailsResponse(
            adult: false,
            backdropPath: '',
            budget: 0,
            genres: [],
            homepage: '',
            id: 0,
            imdbId: '',
            originCountry: [],
            originalLanguage: '',
            originalTitle: '',
            overview: '',
            popularity: 0.0,
            posterPath: '',
            productionCompanies: [],
            productionCountries: [],
            releaseDate: '',
            revenue: 0,
            runtime: 0,
            spokenLanguages: [],
            status: '',
            tagline: '',
            title: '',
            video: false,
            voteAverage: 0.0,
            voteCount: 0,
          ),
        );
      });

      test('initialize with correct values', () {
        final json = {
          "adult": false,
          "backdrop_path": "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
          "belongs_to_collection": {
            "id": 558216,
            "name": "Venom Collection",
            "poster_path": "/aC1yeoBdQL0fukiKrEAFocJ572O.jpg",
            "backdrop_path": "/vq340s8DxA5Q209FT8PHA6CXYOx.jpg"
          },
          "budget": 120000000,
          "genres": [
            {"id": 28, "name": "Action"},
            {"id": 878, "name": "Science Fiction"},
            {"id": 12, "name": "Adventure"},
            {"id": 53, "name": "Thriller"}
          ],
          "homepage": "https://venom.movie",
          "id": 912649,
          "imdb_id": "tt16366836",
          "origin_country": ["US"],
          "original_language": "en",
          "original_title": "Venom: The Last Dance",
          "overview":
              "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
          "popularity": 4545.315,
          "poster_path": "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
          "production_companies": [
            {
              "id": 5,
              "logo_path": "/71BqEFAF4V3qjjMPCpLuyJFB9A.png",
              "name": "Columbia Pictures",
              "origin_country": "US"
            },
            {
              "id": 84041,
              "logo_path": "/nw4kyc29QRpNtFbdsBHkRSFavvt.png",
              "name": "Pascal Pictures",
              "origin_country": "US"
            },
            {
              "id": 53462,
              "logo_path": "/nx8B3Phlcse02w86RW4CJqzCnfL.png",
              "name": "Matt Tolmach Productions",
              "origin_country": "US"
            },
            {
              "id": 91797,
              "logo_path": null,
              "name": "Hutch Parker Entertainment",
              "origin_country": "US"
            },
            {
              "id": 14439,
              "logo_path": null,
              "name": "Arad Productions",
              "origin_country": "US"
            }
          ],
          "production_countries": [
            {"iso_3166_1": "US", "name": "United States of America"}
          ],
          "release_date": "2024-10-22",
          "revenue": 468513700,
          "runtime": 109,
          "spoken_languages": [
            {"english_name": "English", "iso_639_1": "en", "name": "English"}
          ],
          "status": "Released",
          "tagline": "'Til death do they part.",
          "title": "Venom: The Last Dance",
          "video": false,
          "vote_average": 6.8,
          "vote_count": 1877
        };

        expect(
          MovieDetailsResponse.fromJson(json),
          MovieDetailsResponse(
            adult: false,
            backdropPath: '/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg',
            budget: 120000000,
            genres: [
              ApiGenre(id: 28, name: 'Action'),
              ApiGenre(id: 878, name: 'Science Fiction'),
              ApiGenre(id: 12, name: 'Adventure'),
              ApiGenre(id: 53, name: 'Thriller'),
            ],
            homepage: 'https://venom.movie',
            id: 912649,
            imdbId: 'tt16366836',
            originCountry: ['US'],
            originalLanguage: 'en',
            originalTitle: 'Venom: The Last Dance',
            overview:
                'Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie\'s last dance.',
            popularity: 4545.315,
            posterPath: '/aosm8NMQ3UyoBVpSxyimorCQykC.jpg',
            productionCompanies: [
              ApiProductionCompany(
                id: 5,
                logoPath: '/71BqEFAF4V3qjjMPCpLuyJFB9A.png',
                name: 'Columbia Pictures',
                originCountry: 'US',
              ),
              ApiProductionCompany(
                id: 84041,
                logoPath: '/nw4kyc29QRpNtFbdsBHkRSFavvt.png',
                name: 'Pascal Pictures',
                originCountry: 'US',
              ),
              ApiProductionCompany(
                id: 53462,
                logoPath: '/nx8B3Phlcse02w86RW4CJqzCnfL.png',
                name: 'Matt Tolmach Productions',
                originCountry: 'US',
              ),
              ApiProductionCompany(
                id: 91797,
                logoPath: '',
                name: 'Hutch Parker Entertainment',
                originCountry: 'US',
              ),
              ApiProductionCompany(
                id: 14439,
                logoPath: '',
                name: 'Arad Productions',
                originCountry: 'US',
              ),
            ],
            productionCountries: [
              ApiProductionCountry(
                  iso_3166_1: 'US', name: 'United States of America'),
            ],
            releaseDate: '2024-10-22',
            revenue: 468513700,
            runtime: 109,
            spokenLanguages: [
              ApiSpokenLanguage(
                englishName: 'English',
                iso_639_1: 'en',
                name: 'English',
              ),
            ],
            status: 'Released',
            tagline: '\'Til death do they part.',
            title: 'Venom: The Last Dance',
            video: false,
            voteAverage: 6.8,
            voteCount: 1877,
          ),
        );
      });
    });
  });
}
