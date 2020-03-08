//Copyright © 2019 Roving Mobile. All rights reserved.

import Foundation

/*
 description required
 A detailed description of the alert.
 expires required
 The UNIX time at which the alert will expire.
 regions required
 An array of strings representing the names of the regions covered by this weather alert.
 severity required
 The severity of the weather alert. Will take one of the following values: "advisory" (an individual should be aware of potentially severe weather), "watch" (an individual should prepare for potentially severe weather), or "warning" (an individual should take immediate action to protect themselves and others from potentially severe weather).
 time required
 The UNIX time at which the alert was issued.
 title required
 A brief description of the alert.
 uri required
 An HTTP(S) URI that one may refer to for detailed information about the alert.
 */
public struct Alert: Codable {
    let description: String
    let expires: Date
    let regions: [String]
    let severity: Severity
    let time: Date
    let title: String
    let uri: String
}

public enum Severity: String, Codable {
    case advisory
    case watch
    case warning
}
