class Collection {
    private var _collectionName: String
    private var _collectionCategory: String
    private var _img1: String
    private var _img2: String

   
    init(collectionName: String, collectionCategory: String, img1: String, img2: String) {
        self._collectionName = collectionName
        self._collectionCategory = collectionCategory
        self._img1 = img1
        self._img2 = img2
    }

    var collectionName: String {
        return _collectionName
    }
    
    var collectionCategory: String {
        return _collectionCategory
    }
    
    var img1: String {
        return _img1
    }
    
    var img2: String {
        return _img2
    }
}

class Outfit: Collection {
    private var _outfitName: String
    private var _scheduleDate: String
    private var _needIroning: Bool
    private var _needLaundry: Bool
    private var _imagePath: String
    private var _scheduleNote: String

    init(outfitName: String,
         collectionName: String,
         collectionCategory: String,
         scheduleDate: String,
         needIroning: Bool,
         needLaundry: Bool,
         imagePath: String,
         scheduleNote: String) {
        
        self._outfitName = outfitName
        self._scheduleDate = scheduleDate
        self._needIroning = needIroning
        self._needLaundry = needLaundry
        self._imagePath = imagePath
        self._scheduleNote = scheduleNote
        
        super.init(collectionName: collectionName, collectionCategory: collectionCategory,img1: "",img2: "")
    }

    var outfitName: String {
        return _outfitName
    }
    
    var scheduleDate: String {
        return _scheduleDate
    }
    
    var needIroning: Bool {
        return _needIroning
    }
    
    var needLaundry: Bool {
        return _needLaundry
    }
    
    var imagePath: String {
        return _imagePath
    }
    
    var scheduleNote: String {
        return _scheduleNote
    }
    
    func description() -> String {
        return """
        Outfit Name: \(outfitName)
        Collection Name: \(collectionName)
        Collection Category: \(collectionCategory)
        Schedule Date: \(scheduleDate)
        Need Ironing: \(needIroning)
        Need Laundry: \(needLaundry)
        Image Path: \(imagePath)
        Schedule Note: \(scheduleNote)
        """
    }
}

let mainOutfits: [Outfit] = [
    Outfit(outfitName: "Casual Tee",
           collectionName: "Fall Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Sat, 29 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "1",
           scheduleNote: "Weekend casual look"),
    Outfit(outfitName: "Casual Tee",
           collectionName: "Fall Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Sat, 29 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "2",
           scheduleNote: "Weekend casual look"),
    Outfit(outfitName: "Elegant Dress",
           collectionName: "Formal Collection",
           collectionCategory: "Dress",
           scheduleDate: "Mon, 31 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "3",
           scheduleNote: "Gala event"),
    Outfit(outfitName: "Elegant Dress",
           collectionName: "Formal Collection",
           collectionCategory: "Dress",
           scheduleDate: "Mon, 31 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "4",
           scheduleNote: "Gala event"),
    Outfit(outfitName: "Casual Tee",
           collectionName: "Summer Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Fri, 28 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "5",
           scheduleNote: "Weekend casual look"),
    Outfit(outfitName: "Casual Tee",
           collectionName: "Summer Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Fri, 28 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "6",
           scheduleNote: "Stay comfortable"),
    Outfit(outfitName: "Loose",
           collectionName: "Casual Collection",
           collectionCategory: "Bottom",
           scheduleDate: "Sun, 30 Mar 9:30 am",
           needIroning: false,
           needLaundry: true,
           imagePath: "7",
           scheduleNote: "Perfect for lazy days"),
    Outfit(outfitName: "Loose",
           collectionName: "Casual Collection",
           collectionCategory: "Bottom",
           scheduleDate: "Sun, 30 Mar 9:30 am",
           needIroning: false,
           needLaundry: true,
           imagePath: "8",
           scheduleNote: "Perfect for lazy days"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Sat, 29 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "9",
           scheduleNote: "Everyday wear"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Sun, 30 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "10",
           scheduleNote: "Everyday wear")
]

let ScheduleOutfits: [Outfit] = [
    Outfit(outfitName: "Casual Tee",
           collectionName: "Summer Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Fri, 28 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "5",
           scheduleNote: "Weekend casual look"),
    Outfit(outfitName: "Casual Tee",
           collectionName: "Summer Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Fri, 28 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "6",
           scheduleNote: "Stay comfortable"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Fri, 28 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "10",
           scheduleNote: "Everyday wear"),
    Outfit(outfitName: "Casual Tee",
           collectionName: "Fall Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Sat, 29 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "1",
           scheduleNote: "Weekend casual look"),
    Outfit(outfitName: "Casual Tee",
           collectionName: "Fall Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Sat, 29 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "2",
           scheduleNote: "Weekend casual look"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Sat, 29 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "9",
           scheduleNote: "Everyday wear"),
    Outfit(outfitName: "Loose",
           collectionName: "Casual Collection",
           collectionCategory: "Bottom",
           scheduleDate: "Sun, 30 Mar 9:30 am",
           needIroning: false,
           needLaundry: true,
           imagePath: "7",
           scheduleNote: "Perfect for lazy days"),
    Outfit(outfitName: "Loose",
           collectionName: "Casual Collection",
           collectionCategory: "Bottom",
           scheduleDate: "Sun, 30 Mar",
           needIroning: false,
           needLaundry: true,
           imagePath: "8",
           scheduleNote: "Perfect for lazy days"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Sun, 30 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "10",
           scheduleNote: "Everyday wear"),
    Outfit(outfitName: "Elegant Dress",
           collectionName: "Formal Collection",
           collectionCategory: "Dress",
           scheduleDate: "Mon, 31 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "3",
           scheduleNote: "Gala event"),
    Outfit(outfitName: "Elegant Dress",
           collectionName: "Formal Collection",
           collectionCategory: "Dress",
           scheduleDate: "Mon, 31 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "4",
           scheduleNote: "Gala event"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Mon, 31 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "9",
           scheduleNote: "Everyday wear")
]


let HistoryOutfits: [Outfit] = [
    Outfit(outfitName: "Casual Tee",
           collectionName: "Summer Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Fri, 14 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "5",
           scheduleNote: "Weekend casual look"),
    Outfit(outfitName: "Casual Tee",
           collectionName: "Summer Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Fri, 14 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "6",
           scheduleNote: "Stay comfortable"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Fri, 14 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "10",
           scheduleNote: "Everyday wear"),
    Outfit(outfitName: "Casual Tee",
           collectionName: "Fall Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Sat, 15 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "1",
           scheduleNote: "Weekend casual look"),
    Outfit(outfitName: "Casual Tee",
           collectionName: "Fall Casual Collection",
           collectionCategory: "Top",
           scheduleDate: "Sat, 15 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "2",
           scheduleNote: "Weekend casual look"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Sat, 15 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "9",
           scheduleNote: "Everyday wear"),
    Outfit(outfitName: "Loose",
           collectionName: "Casual Collection",
           collectionCategory: "Bottom",
           scheduleDate: "Sun, 16 Mar 9:30 am",
           needIroning: false,
           needLaundry: true,
           imagePath: "7",
           scheduleNote: "Perfect for lazy days"),
    Outfit(outfitName: "Loose",
           collectionName: "Casual Collection",
           collectionCategory: "Bottom",
           scheduleDate: "Sun, 16 Mar 9:30 am",
           needIroning: false,
           needLaundry: true,
           imagePath: "8",
           scheduleNote: "Perfect for lazy days"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Sun, 16 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "10",
           scheduleNote: "Everyday wear"),
    Outfit(outfitName: "Elegant Dress",
           collectionName: "Formal Collection",
           collectionCategory: "Dress",
           scheduleDate: "Mon, 17 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "3",
           scheduleNote: "Gala event"),
    Outfit(outfitName: "Elegant Dress",
           collectionName: "Formal Collection",
           collectionCategory: "Dress",
           scheduleDate: "Mon, 17 Mar 9:30 am",
           needIroning: true,
           needLaundry: false,
           imagePath: "4",
           scheduleNote: "Gala event"),
    Outfit(outfitName: "Casual Sneakers",
           collectionName: "Footwear Collection",
           collectionCategory: "Footwear",
           scheduleDate: "Mon, 17 Mar 9:30 am",
           needIroning: false,
           needLaundry: false,
           imagePath: "9",
           scheduleNote: "Everyday wear")
]

let collections: [Collection] = [
    Collection(collectionName: "Summer Casual Collection", collectionCategory: "Top,Bottom",img1: "5",img2: "6"),
    Collection(collectionName: "Fall Casual Collection", collectionCategory: "Top,Bottom",img1: "1",img2: "2"),
    Collection(collectionName: "Footwear Collection", collectionCategory: "Footwear",img1: "9",img2: "10"),
    Collection(collectionName: "Casual Collection", collectionCategory: "Top,Bottom",img1: "7",img2: "8"),
    Collection(collectionName: "Formal Collection", collectionCategory: "Top,Dress",img1: "3",img2: "4")
]
