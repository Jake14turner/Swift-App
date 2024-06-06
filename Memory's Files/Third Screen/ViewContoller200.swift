import UIKit
import SwiftUI




class ViewController200: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
  var data13: UIImage?
  var data14: UIImage?
  var data15: UIImage?
  var data16: UIImage?


  /*

   */




  var saved: Bool = false



  override func viewDidLoad() {
      super.viewDidLoad()
      
      view.backgroundColor = .lightGreen

             // Add the toolbar to the top of the view
            

      
      
      savedImageDisplayImageView13?.image = data13
      savedImageDisplayImageView14?.image = data14
      savedImageDisplayImageView15?.image = data15
      savedImageDisplayImageView16?.image = data16
      
      DispatchQueue.global(qos: .background).async {
          if let savedImage3 = self.retrieveImage(forKey: "String13",inStorageType: .fileSystem) {
              DispatchQueue.main.async {
                  self.savedImageDisplayImageView13.image = savedImage3
              }
          }
         
          //self.j += 1
      }
      
      DispatchQueue.global(qos: .background).async {
          if let savedImage3 = self.retrieveImage(forKey: "String14",inStorageType: .fileSystem) {
              DispatchQueue.main.async {
                  self.savedImageDisplayImageView14.image = savedImage3
              }
          }
         
          //self.j += 1
      }
      DispatchQueue.global(qos: .background).async {
          if let savedImage3 = self.retrieveImage(forKey: "String15",inStorageType: .fileSystem) {
              DispatchQueue.main.async {
                  self.savedImageDisplayImageView15.image = savedImage3
              }
          }
         
          //self.j += 1
      }
      DispatchQueue.global(qos: .background).async {
          if let savedImage3 = self.retrieveImage(forKey: "String16",inStorageType: .fileSystem) {
              DispatchQueue.main.async {
                  self.savedImageDisplayImageView16.image = savedImage3
              }
          }
         
          //self.j += 1
      }
  }







  enum StorageType {
      case userDefaults
      case fileSystem
  }
  private func retrieveImage(forKey key: String, inStorageType storageType: StorageType) -> UIImage? {
      switch storageType {
      case .userDefaults:
          if let imageData = UserDefaults.standard.object(forKey: key) as? Data,
             let image = UIImage(data: imageData) {
              
              return image
          }
      case .fileSystem:
          if let filePath = self.filePath(forKey: key),
             let fileData = FileManager.default.contents(atPath: filePath.path),
             let image = UIImage(data: fileData) {
              return image
          }
      }
      return nil
  }
  private func filePath(forKey key: String) -> URL? {
      let fileManager = FileManager.default
      guard let documentURL = fileManager.urls(for: .documentDirectory,
                                               in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
      
      return documentURL.appendingPathComponent(key + ".png")
  }
  private func store(image: UIImage,
                     forKey key: String,
                     withStorageType storageType: StorageType) {
      if let pngRepresentation = image.pngData() {
          switch storageType {
          case .fileSystem:
              if let filePath = filePath(forKey: key) {
                  do  {
                      try pngRepresentation.write(to: filePath,
                                                  options: .atomic)
                  } catch let err {
                      print("Saving file resulted in error: ", err)
                  }
              }
          case .userDefaults:
              UserDefaults.standard.set(pngRepresentation,
                                        forKey: key)
          }
      }
  }
  // var i: Int = 0
  @objc
  func save() {
      DispatchQueue.global(qos: .background).async {
          self.store(image: UIImage.image,
                     forKey: "YOPE3",
                     withStorageType: .fileSystem)
          //self.i += 1
      }
  }
  // var j: Int = 0
  @objc
  func display13() {
      DispatchQueue.global(qos: .background).async {
          if let savedImage = self.retrieveImage(forKey: "String13",inStorageType: .fileSystem) {
              DispatchQueue.main.async {
                  self.savedImageDisplayImageView13.image = savedImage
              }
          }
         
          //self.j += 1
      }
  }
  @objc
  func display14() {
      DispatchQueue.global(qos: .background).async {
          if let savedImage = self.retrieveImage(forKey: "String14",inStorageType: .fileSystem) {
              DispatchQueue.main.async {
                  self.savedImageDisplayImageView14.image = savedImage
              }
          }
         
          //self.j += 1
      }
  }
  @objc
  func display15() {
      DispatchQueue.global(qos: .background).async {
          if let savedImage = self.retrieveImage(forKey: "String15",inStorageType: .fileSystem) {
              DispatchQueue.main.async {
                  self.savedImageDisplayImageView15.image = savedImage
              }
          }
         
          //self.j += 1
      }
  }
  @objc
  func display16() {
      DispatchQueue.global(qos: .background).async {
          if let savedImage = self.retrieveImage(forKey: "String16",inStorageType: .fileSystem) {
              DispatchQueue.main.async {
                  self.savedImageDisplayImageView16.image = savedImage
              }
          }
         
          //self.j += 1
      }
  }




  @IBOutlet weak var savedImageDisplayImageView13: UIImageView!


  @IBOutlet weak var savedImageDisplayImageView14: UIImageView!


  @IBOutlet weak var savedImageDisplayImageView15: UIImageView!


  @IBOutlet weak var savedImageDisplayImageView16: UIImageView!


  /*
  @IBOutlet weak var displaySaveImageButton1: UIButton! {
      didSet {
          displaySaveImageButton1.addTarget(self,
                                           action: #selector(ViewController2.display1),
                                           for: .touchUpInside)
      }
  }


  @IBOutlet weak var displaySaveImageButton2: UIButton! {
      didSet {
          displaySaveImageButton2.addTarget(self,
                                           action: #selector(ViewController2.display2),
                                           for: .touchUpInside)
      }
  }


  @IBOutlet weak var displaySaveImageButton3: UIButton! {
      didSet {
          displaySaveImageButton3.addTarget(self,
                                           action: #selector(ViewController2.display3),
                                           for: .touchUpInside)
      }
  }

  @IBOutlet weak var displaySaveImageButton4: UIButton! {
      didSet {
          displaySaveImageButton4.addTarget(self,
                                           action: #selector(ViewController2.display4),
                                           for: .touchUpInside)
      }
  }
  */

  @IBAction func openViewController201(_ sender: Any) {
      let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController201") as! ViewController201
      vc.modalPresentationStyle = .fullScreen
      present(vc, animated: true)
  }




}
