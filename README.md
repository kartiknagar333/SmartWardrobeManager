# Smart Wardrobe Manager

**Smart Wardrobe Manager** is an iOS app that helps users manage and schedule their outfits, track laundry needs, and organize wardrobe collections through a clean, multi‑screen experience. :contentReference[oaicite:0]{index=0}&#8203;:contentReference[oaicite:1]{index=1}

## Architecture & Implementation

- **Navigation Controller**  
  Manages transitions between Home, Collections, Outfits, and History screens. 
- **UICollectionView**  
  Displays items in grid layouts with custom cells for images and labels. 
- **Gesture Recognizers**  
  Uses `UILongPressGestureRecognizer` to present edit/delete action sheets. 
- **UIImagePickerController**  
  Enables photo selection from library or camera, with error handling for missing hardware. 
- **UIAlertController**  
  Provides confirmation dialogs for scheduling, deletion, and other actions.

# User Flow Diagram 
<img width="919" alt="Screenshot 2025-04-27 at 6 19 47 AM" src="https://github.com/user-attachments/assets/a7ec8c79-c386-4b4f-94db-1ddada24870f" />

## Screenshots
- **HomeScreen**  
<img width="576" alt="Screenshot 2025-04-27 at 6 31 45 AM" src="https://github.com/user-attachments/assets/7d12d8d0-4c26-4829-b876-422dac8c668a" />
