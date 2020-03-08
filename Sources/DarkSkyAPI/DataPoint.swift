import Foundation

public struct DataPoint: Codable {
    public let time: Date
    public let summary: String?
    public let icon: Icon?
    public let precipIntensity: Double?
    public let precipIntensityMax: Double?
    public let precipIntensityMaxTime: Date?
    public let precipProbability: Double?
    public let precipType: PrecipType?
    public let temperature: Double?
    public let temperatureHigh: Double?
    public let temperatureHighTime: Date?
    public let temperatureLow: Double?
    public let temperatureLowTime: Date?
    public let apparentTemperature: Double?
    public let apparentTemperatureHigh: Double?
    public let apparentTemperatureHighTime: Date?
    public let apparentTemperatureLow: Double?
    public let apparentTemperatureLowTime: Date?
    public let dewPoint: Double?
    public let humidity: Double?
    public let pressure: Double?
    public let windSpeed: Double?
    public let windGust: Double?
    public let windGustTime: Date?
    public let windBearing: Int?
    public let cloudCover: Double?
    public let uvIndex: Int?
    public let uvIndexTime: Date?
    public let visibility: Double?
    public let ozone: Double?
    public let nearestStormDistance: Double?
    public let sunriseTime: Date?
    public let sunsetTime: Date?
    public let moonPhase: Double?
}
