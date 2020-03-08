public struct Forecast: Codable {
    public let latitude: Double
    public let longitude: Double
    public let timezone: String?
    public let currently: DataPoint?
    public let minutely: DataBlock?
    public let hourly: DataBlock?
    public let daily: DataBlock?
    public let alerts: [Alert]?
}
