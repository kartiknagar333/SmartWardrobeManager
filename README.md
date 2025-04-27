# Smart Wardrobe Manager

**Smart Wardrobe Manager** is an iOS app that helps users manage and schedule their outfits, track laundry needs, and organize wardrobe collections through a clean, multi‑screen experience. :contentReference[oaicite:0]{index=0}&#8203;:contentReference[oaicite:1]{index=1}

## Architecture & Implementation

- **Navigation Controller**  
  Manages transitions between Home, Collections, Outfits, and History screens. :contentReference[oaicite:20]{index=20}&#8203;:contentReference[oaicite:21]{index=21}  
- **UICollectionView**  
  Displays items in grid layouts with custom cells for images and labels. :contentReference[oaicite:22]{index=22}&#8203;:contentReference[oaicite:23]{index=23}  
- **Gesture Recognizers**  
  Uses `UILongPressGestureRecognizer` to present edit/delete action sheets. :contentReference[oaicite:24]{index=24}&#8203;:contentReference[oaicite:25]{index=25}  
- **UIImagePickerController**  
  Enables photo selection from library or camera, with error handling for missing hardware. :contentReference[oaicite:26]{index=26}&#8203;:contentReference[oaicite:27]{index=27}  
- **UIAlertController**  
  Provides confirmation dialogs for scheduling, deletion, and other actions. :contentReference[oaicite:28]{index=28}&#8203;:contentReference[oaicite:29]{index=29}  

