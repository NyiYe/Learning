//
//  Match.swift
//  BallGuru
//
//  Created by Barry on 07/09/2023.
//

import Foundation

// MARK: - DetermineResponse
struct DetermineResponse: Codable {
    let success: Bool
    @Ignore
    var data: [League]? = []
    let message: String
}

// MARK: - Datum
struct League: Codable ,Identifiable {
    let id = UUID()
    let leagueID: Int
    let leagueName, leagueIcon: String
    let priority: Int
    @Ignore
    var  match: [Match]? = []
    var leagueIconUrl : URL?{
        return URL(string: "\(EndPoint.BASE_IMAGE_URL)\(leagueIcon)")
    }

    enum CodingKeys: String, CodingKey {
        case leagueID = "league_id"
        case leagueName = "league_name"
        case leagueIcon = "league_icon"
        case priority, match
    }
}

// MARK: - Match
struct Match: Codable , Identifiable {
    let id: Int
    let date, time: String
    let leagueID, home, away: Int
    let homeCanWin, canDraw, awayCanWin, over: String
    let under, startBody, startGoal, morningBody: String
    let morningGoal: String
    let eveningBody, eveningGoal: String?
    @Ignore
    var bothTeamOdd : String? = nil
    @Ignore
    var oneTeamOdd :String? = nil
    @Ignore
    var bothTeamPossible :String? = nil
    @Ignore
    var oneTeamPossible:String? = nil
    @Ignore
    var goldenGoalChoice: String? = nil
    let guessResult, fact, injury: String?
    let homeStandLevel, awayStandLevel, homeLastMatchs, awayLastMatchs: String?
    let description: String?
    let odd, oddValue: String?
    let oddTeam: Int
    let oddSign, overUnderOdd, overUnderSign, overUnderOddValue: String?
    let homeFinalResult, awayFinalResult: String?
    let publish, publishChanges, publishPercentages, changesStartTime: String?
    let percentagesStartTime, createdAt, updatedAt, homeTeamName: String?
    let homeTeamIcon, awayTeamName, awayTeamIcon: String?
    
    var homeTeamIconUrl : URL?{
        if let icon = homeTeamIcon{
            return URL(string: "\(EndPoint.BASE_IMAGE_URL)\(icon)")
        }
       return nil
    }
    var awayTeamIconUrl : URL?{
        if let icon = awayTeamIcon{
            return URL(string: "\(EndPoint.BASE_IMAGE_URL)\(icon)")
        }
       return nil
    }

    enum CodingKeys: String, CodingKey {
        case id, date, time
        case leagueID = "league_id"
        case home, away
        case homeCanWin = "home_can_win"
        case canDraw = "can_draw"
        case awayCanWin = "away_can_win"
        case over, under
        case startBody = "start_body"
        case startGoal = "start_goal"
        case morningBody = "morning_body"
        case morningGoal = "morning_goal"
        case eveningBody = "evening_body"
        case eveningGoal = "evening_goal"
        case bothTeamOdd = "both_team_odd"
        case oneTeamOdd = "one_team_odd"
        case bothTeamPossible = "both_team_possible"
        case oneTeamPossible = "one_team_possible"
        case goldenGoalChoice = "golden_goal_choice"
        case guessResult = "guess_result"
        case fact, injury
        case homeStandLevel = "home_stand_level"
        case awayStandLevel = "away_stand_level"
        case homeLastMatchs = "home_last_matchs"
        case awayLastMatchs = "away_last_matchs"
        case description, odd
        case oddValue = "odd_value"
        case oddTeam = "odd_team"
        case oddSign = "odd_sign"
        case overUnderOdd = "over_under_odd"
        case overUnderSign = "over_under_sign"
        case overUnderOddValue = "over_under_odd_value"
        case homeFinalResult = "home_final_result"
        case awayFinalResult = "away_final_result"
        case publish
        case publishChanges = "publish_changes"
        case publishPercentages = "publish_percentages"
        case changesStartTime = "changes_start_time"
        case percentagesStartTime = "percentages_start_time"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case homeTeamName = "home_team_name"
        case homeTeamIcon = "home_team_icon"
        case awayTeamName = "away_team_name"
        case awayTeamIcon = "away_team_icon"
    }
}
