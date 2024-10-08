import Foundation

struct SizeConverter {
    let sizeMap: [String: String] = [
        "1/4\"": "6 mm",
        "1/2\"": "12 mm",
        "3/4\"": "19 mm",
    ]

    func convertSize(imperialSize: String) -> String {
        return sizeMap[imperialSize] ?? "unknown size"
    }
}
