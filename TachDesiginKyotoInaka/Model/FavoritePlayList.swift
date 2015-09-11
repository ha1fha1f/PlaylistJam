import Foundation
import RealmSwift

class FavoritePlayList: Object {
    static let realm = Realm()
    dynamic var id = 0

    override static func primaryKey() -> String? {
        return "id"
    }
}