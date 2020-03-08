import Foundation

public struct DataPoint: Codable {
    let time: Date
    let summary: String?
    let icon: Icon?
    let precipIntensity: Double?
    let precipIntensityMax: Double?
    let precipIntensityMaxTime: Date?
    let precipProbability: Double?
    let precipType: PrecipType?
    let temperature: Double?
    let temperatureHigh: Double?
    let temperatureHighTime: Date?
    let temperatureLow: Double?
    let temperatureLowTime: Date?
    let apparentTemperature: Double?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Date?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Date?
    let dewPoint: Double?
    let humidity: Double?
    let pressure: Double?
    let windSpeed: Double?
    let windGust: Double?
    let windGustTime: Date?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex: Int?
    let uvIndexTime: Date?
    let visibility: Double?
    let ozone: Double?
    let nearestStormDistance: Double?
    let sunriseTime: Date?
    let sunsetTime: Date?
    let moonPhase: Double?
}
