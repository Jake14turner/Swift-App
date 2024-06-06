import UIKit
import SwiftUI




class ViewController201: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
      let picker13 = UIImagePickerController()
      let picker14 = UIImagePickerController()
      let picker15 = UIImagePickerController()
      let picker16 = UIImagePickerController()
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          view.backgroundColor = .lightGreen
      }

      
      
      
      enum StorageType {
          case userDefaults
          case fileSystem
      }
      private func retrieveImage(forKey key: String, inStorageType storageType: StorageType) -> UIImage? {
          switch storageType {
          case .userDefaults:
              if let imageData2 = UserDefaults.standard.object(forKey: key) as? Data,
                 let image2 = UIImage(data: imageData2) {
                  
                  return image2
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
      var i: Int = 0
      @objc
      func save13() {
          guard let image = image13.image else {
                 print("No image selected for image13")
                 return
             }
          DispatchQueue.global(qos: .background).async {
              self.store(image: self.image13.image!,
                         forKey: "String13",
                         withStorageType: .fileSystem)
           //   self.i += 1
          }
      }
      @objc
      func save14(){
          guard let image = image14.image else {
                 print("No image selected for image14")
                 return
             }
          DispatchQueue.global(qos: .background).async {
              self.store(image: self.image14.image!,
                         forKey: "String14",
                         withStorageType: .fileSystem)
           //   self.i += 1
          }
      }
      @objc
      func save15(){
          guard let image = image15.image else {
                 print("No image selected for image15")
                 return
             }
          DispatchQueue.global(qos: .background).async {
              self.store(image: self.image15.image!,
                         forKey: "String15",
                         withStorageType: .fileSystem)
           //   self.i += 1
          }
      }
      @objc
      func save16(){
          guard let image = image16.image else {
                 print("No image selected for image16")
                 return
             }
          DispatchQueue.global(qos: .background).async {
              self.store(image: self.image16.image!,
                         forKey: "String16",
                         withStorageType: .fileSystem)
           //   self.i += 1
          }
      }
          
      
      @IBOutlet weak var image13: UIImageView!
      
      @IBOutlet weak var image14: UIImageView!
      
      @IBOutlet weak var image15: UIImageView!
      
      @IBOutlet weak var image16: UIImageView!
      
      var is1Clicked: Bool = false
      @IBAction func button1(_ sender: Any) {
          
          picker13.delegate = self
          picker13.allowsEditing = true
          present(picker13, animated: true, completion: nil)
          i = 0
          is1Clicked = true
      }
      
      var is2Clicked: Bool = false
      @IBAction func button2(_ sender: Any) {
          picker14.delegate = self
          picker14.allowsEditing = true
          present(picker14, animated: true, completion: nil)
          i = 1
          is2Clicked = true
      }
      
      var is3Clicked: Bool = false
      @IBAction func button3(_ sender: Any) {
          picker15.delegate = self
          picker15.allowsEditing = true
          present(picker15, animated: true, completion: nil)
          i = 2
          is3Clicked = true
      }
      
      var is4Clicked: Bool = false
      @IBAction func button4(_ sender: Any) {
          picker16.delegate = self
          picker16.allowsEditing = true
          present(picker16, animated: true, completion: nil)
          i = 3
          is4Clicked = true
      }
      
      
      
      
      @IBOutlet weak var saveImageButton1: UIButton! {
          
              didSet {
                //  if(is1Clicked == true){
                  saveImageButton1.addTarget(self,
                                             action: #selector(ViewController201.save13),
                                             for: .touchUpInside)
                  print("saved!")
            //  }
          }
     }
      
      
      @IBOutlet weak var saveImageButton2: UIButton!{
          didSet {
              //if(is2Clicked == true){
                  saveImageButton2.addTarget(self,
                                             action: #selector(ViewController201.save14),
                                             for: .touchUpInside)
                  
           //   }
          }
      }
      
      
      @IBOutlet weak var saveImageButton3: UIButton! {
          didSet {
             // if(is3Clicked == true){
                  saveImageButton3.addTarget(self,
                                             action: #selector(ViewController201.save15),
                                             for: .touchUpInside)
                  
             // }
          }
      }
      
      @IBOutlet weak var saveImageButton4: UIButton! {
          didSet {
             // if(is4Clicked == true){
                  saveImageButton4.addTarget(self,
                                             action: #selector(ViewController201.save16),
                                             for: .touchUpInside)
                  
              }
         // }
      }
      
   
      
      @IBAction func openViewController200(_ sender: Any) {
          let dataThirteen = image13.image
          let dataFourteen = image14.image
          let dataFifteen = image15.image
          let dataSixteen = image16.image
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController200") as! ViewController200
          vc.data13 = dataThirteen
          vc.data14 = dataFourteen
          vc.data15 = dataFifteen
          vc.data16 = dataSixteen
          vc.saved = true
          self.navigationController?.pushViewController(vc, animated: true)
          print("TRANSFERRED")
          dismiss(animated: true, completion: nil )
      }
      
      
      
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                  
          
          guard let image = info[.editedImage] as? UIImage else {return}
          if(i == 0){
              image13.image = image
          }
          if(i == 1){
              image14.image = image
          }
          if(i == 2){
              image15.image = image
          }
          if(i == 3){
              image16.image = image
          }
          dismiss(animated: true)
          
      }
    
}


