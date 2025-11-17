import UIKit

let array = [3,5,8,7,9,1,3,5,3,2,6,7,5,8,6,2,1,9]

// Ordered in an ascending way
array.sorted()
// This is a bubble sort so it gets the first two values applies the sort and advance to the next at the end of the array it asks if it
array.sorted { n1, n2 in
    n1 > n2
}

let names = ["Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstict", "BoysFromBrazil"]

let imagesC = names.compactMap { name in
    UIImage(named: "\(name).jpg")
}

imagesC.sorted { image1, image2 in
    image1.size.width >= image2.size.width
}

let imagesFilteredOrdered = names
    .compactMap { name in
        UIImage(named: "\(name).jpg")
    }
    .filter { name in
        name.size.width == 100
    }

array.
