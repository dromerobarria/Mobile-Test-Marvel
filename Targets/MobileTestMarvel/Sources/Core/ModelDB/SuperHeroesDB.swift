import RealmSwift
import UIKit

class SuperHeroesDB: Object {
    @objc dynamic var remoteID = 0
    @objc dynamic var name = ""
    @objc dynamic var resultDescription = ""
    @objc dynamic var thumbnail = ""

    override static func primaryKey() -> String? {
        return "remoteID"
    }
}

extension SuperHeroesDB {
    func save() {
        // swiftlint:disable:next force_try
        let realm = try! Realm()
        // swiftlint:disable:next force_try
        try! realm.write {
            realm.add(self)
        }
    }

    class func all() -> [SuperHeroesViewModel] {
        var superHeroes = [SuperHeroesViewModel]()
        // swiftlint:disable:next force_try
        let realm = try! Realm()
        for superHeroesDB in realm.objects(SuperHeroesDB.self) {
            let id = superHeroesDB.remoteID
            let resultDescription = superHeroesDB.resultDescription
            let name = superHeroesDB.name
            let thumbnail = superHeroesDB.thumbnail
            let superHeroesViewModel = SuperHeroesViewModel(id: id,
                                                            name: name,
                                                            resultDescription: resultDescription,
                                                            thumbnail: Thumbnail(path: thumbnail),
                                                            urls: [])
            superHeroes.append(superHeroesViewModel)
        }
        return superHeroes
    }

    class func updateSuperHeroes(superHeroesModels: [SuperHeroesViewModel]) {
        // swiftlint:disable:next force_try
        let realm = try! Realm()
        let superHeroesDB = realm.objects(SuperHeroesDB.self)
        // swiftlint:disable:next force_try
        try! realm.write {
            realm.delete(superHeroesDB)
        }

        for superHeroes in superHeroesModels {
            let id = superHeroes.id
            let name = superHeroes.name
            let resultDescription = superHeroes.resultDescription
            let thumbnail = superHeroes.thumbnail.path

            let superHeroeNew = SuperHeroesDB()
            superHeroeNew.remoteID = id
            superHeroeNew.name = name
            superHeroeNew.resultDescription = resultDescription
            superHeroeNew.thumbnail = thumbnail
            superHeroeNew.save()
        }
    }
}
