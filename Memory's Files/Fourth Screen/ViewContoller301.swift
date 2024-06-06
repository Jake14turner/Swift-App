import UIKit
import SwiftUI




class ViewController301: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    
      let picker5 = UIImagePickerController()
      let picker6 = UIImagePickerController()
      let picker7 = UIImagePickerController()
      let picker8 = UIImagePickerController()
      
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
      func save5() {
          guard let image = image5.image else {
                 print("No image selected for image5")
                 return
             }
          DispatchQueue.global(qos: .background).async {
              self.store(image: self.image5.image!,
                         forKey: "String5",
                         withStorageType: .fileSystem)
           //   self.i += 1
          }
      }
      @objc
      func save6(){
          guard let image = image6.image else {
                 print("No image selected for image6")
                 return
             }
          DispatchQueue.global(qos: .background).async {
              self.store(image: self.image6.image!,
                         forKey: "String6",
                         withStorageType: .fileSystem)
           //   self.i += 1
          }
      }
      @objc
      func save7(){
          guard let image = image7.image else {
                 print("No image selected for image7")
                 return
             }
          DispatchQueue.global(qos: .background).async {
              self.store(image: self.image7.image!,
                         forKey: "String7",
                         withStorageType: .fileSystem)
           //   self.i += 1
          }
      }
      @objc
      func save8(){
          guard let image = image8.image else {
                 print("No image selected for image8")
                 return
             }
          DispatchQueue.global(qos: .background).async {
              self.store(image: self.image8.image!,
                         forKey: "String8",
                         withStorageType: .fileSystem)
           //   self.i += 1
          }
      }
          
      
      @IBOutlet weak var image5: UIImageView!
      
      @IBOutlet weak var image6: UIImageView!
      
      @IBOutlet weak var image7: UIImageView!
      
      @IBOutlet weak var image8: UIImageView!
      
      var is1Clicked: Bool = false
      @IBAction func button1(_ sender: Any) {
          
          picker5.delegate = self
          picker5.allowsEditing = true
          present(picker5, animated: true, completion: nil)
          i = 0
          is1Clicked = true
      }
      
      var is2Clicked: Bool = false
      @IBAction func button2(_ sender: Any) {
          picker6.delegate = self
          picker6.allowsEditing = true
          present(picker6, animated: true, completion: nil)
          i = 1
          is2Clicked = true
      }
      
      var is3Clicked: Bool = false
      @IBAction func button3(_ sender: Any) {
          picker7.delegate = self
          picker7.allowsEditing = true
          present(picker7, animated: true, completion: nil)
          i = 2
          is3Clicked = true
      }
      
      var is4Clicked: Bool = false
      @IBAction func button4(_ sender: Any) {
          picker8.delegate = self
          picker8.allowsEditing = true
          present(picker8, animated: true, completion: nil)
          i = 3
          is4Clicked = true
      }
      
      
      
      
      @IBOutlet weak var saveImageButton1: UIButton! {
          
              didSet {
                //  if(is1Clicked == true){
                  saveImageButton1.addTarget(self,
                                             action: #selector(ViewController301.save5),
                                             for: .touchUpInside)
                  print("saved!")
            //  }
          }
     }
      
      
      @IBOutlet weak var saveImageButton2: UIButton!{
          didSet {
              //if(is2Clicked == true){
                  saveImageButton2.addTarget(self,
                                             action: #selector(ViewController301.save6),
                                             for: .touchUpInside)
                  
           //   }
          }
      }
      
      
      @IBOutlet weak var saveImageButton3: UIButton! {
          didSet {
             // if(is3Clicked == true){
                  saveImageButton3.addTarget(self,
                                             action: #selector(ViewController301.save7),
                                             for: .touchUpInside)
                  
             // }
          }
      }
      
      @IBOutlet weak var saveImageButton4: UIButton! {
          didSet {
             // if(is4Clicked == true){
                  saveImageButton4.addTarget(self,
                                             action: #selector(ViewController301.save8),
                                             for: .touchUpInside)
                  
              }
         // }
      }
      
   
      
      @IBAction func openViewController300(_ sender: Any) {
          let dataFive = image5.image
          let dataSix = image6.image
          let dataSeven = image7.image
          let dataEight = image8.image
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController300") as! ViewController300
          vc.data5 = dataFive
          vc.data6 = dataSix
          vc.data7 = dataSeven
          vc.data8 = dataEight
          vc.saved = true
          self.navigationController?.pushViewController(vc, animated: true)
          print("TRANSFERRED")
          dismiss(animated: true, completion: nil )
      }
      
      
      
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                  
          
          guard let image = info[.editedImage] as? UIImage else {return}
          if(i == 0){
              image5.image = image
          }
          if(i == 1){
              image6.image = image
          }
          if(i == 2){
              image7.image = image
          }
          if(i == 3){
              image8.image = image
          }
          dismiss(animated: true)
          
      }
    
}


