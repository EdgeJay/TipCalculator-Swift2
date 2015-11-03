// based on Swift 2 tutorial: http://www.raywenderlich.com/115300/swift-2-tutorial-part-3-tuples-protocols-delegates-and-table-views

import Cocoa

@objc protocol Speaker {
    func speak()
    optional func tellAJoke()
}

class Ray: Speaker {
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    @objc func speak() {
        print("Hello! I'm \(name)!")
    }
    
    func writeTutorial() {
        print("Working on it!")
    }
}

class Animal {
}

protocol CatDelegate {
    func isHungry(cat: Cat)
}

class Cat: Animal, Speaker {
    var delegate: CatDelegate?
    
    @objc func speak() {
        print("Meow!")
    }
    
    func needFood() {
        delegate?.isHungry(self)
    }
}

class CatHandler: CatDelegate {
    func isHungry(cat: Cat) {
        print("Cat is hungry!")
    }
}

let ray: Speaker = Ray(name: "Ray")
ray.speak()
(ray as! Ray).writeTutorial()

let cat: Speaker = Cat()
cat.speak()
cat.tellAJoke?()

(cat as! Cat).delegate = CatHandler()
(cat as! Cat).needFood()