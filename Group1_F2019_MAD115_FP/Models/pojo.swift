// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)


//taken help to create this model class from https://app.quicktype.io
import Foundation

class Pojo
{
// MARK: - Welcome
struct Welcome: Codable {
    let jsondata: [Jsondatum]
}

// MARK: - Jsondatum
struct Jsondatum: Codable {
    let jsondatumClass: String
    let id: Int
    let name: String
    let age: Int
    let vehicle: Vehicle
    let schoolName: String?
    let type: String
    let salary, bonus, rate, hoursWorked: Float?
    let fixedAmount, commissionPercent: Float?

    enum CodingKeys: String, CodingKey {
        case jsondatumClass = "@class"
        case id, name, age, vehicle, schoolName, type, salary, bonus, rate, hoursWorked, fixedAmount, commissionPercent
    }
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let vehicleClass: String
    let id: Int
    let make, plate, model, year: String
    let type: String
    let doors: Int?

    enum CodingKeys: String, CodingKey {
        case vehicleClass = "@class"
        case id, make, plate, model, year, type, doors
    }
}
}
