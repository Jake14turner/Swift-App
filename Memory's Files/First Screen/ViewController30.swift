import UIKit
import SwiftUI




class ViewController30: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
  
    let picker1 = UIImagePickerController()
    let picker2 = UIImagePickerController()
    let picker3 = UIImagePickerController()
    let picker4 = UIImagePickerController()
    
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
    var i: Int = 0
    @objc
    func save1() {
        guard let image = image1.image else {
               print("No image selected for image1")
               return
           }
        DispatchQueue.global(qos: .background).async {
            self.store(image: self.image1.image!,
                       forKey: "String1",
                       withStorageType: .fileSystem)
         //   self.i += 1
        }
    }
    @objc
    func save2(){
        guard let image = image2.image else {
               print("No image selected for image2")
               return
           }
        DispatchQueue.global(qos: .background).async {
            self.store(image: self.image2.image!,
                       forKey: "String2",
                       withStorageType: .fileSystem)
         //   self.i += 1
        }
    }
    @objc
    func save3(){
        guard let image = image3.image else {
               print("No image selected for image3")
               return
           }
        DispatchQueue.global(qos: .background).async {
            self.store(image: self.image3.image!,
                       forKey: "String3",
                       withStorageType: .fileSystem)
         //   self.i += 1
        }
    }
    @objc
    func save4(){
        guard let image = image4.image else {
               print("No image selected for image4")
               return
           }
        DispatchQueue.global(qos: .background).async {
            self.store(image: self.image4.image!,
                       forKey: "String4",
                       withStorageType: .fileSystem)
         //   self.i += 1
        }
    }
        
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var image4: UIImageView!
    
    var is1Clicked: Bool = false
    @IBAction func button1(_ sender: Any) {
        
        picker1.delegate = self
        picker1.allowsEditing = true
        present(picker1, animated: true, completion: nil)
        i = 0
        is1Clicked = true
    }
    
    var is2Clicked: Bool = false
    @IBAction func button2(_ sender: Any) {
        picker2.delegate = self
        picker2.allowsEditing = true
        present(picker2, animated: true, completion: nil)
        i = 1
        is2Clicked = true
    }
    
    var is3Clicked: Bool = false
    @IBAction func button3(_ sender: Any) {
        picker3.delegate = self
        picker3.allowsEditing = true
        present(picker3, animated: true, completion: nil)
        i = 2
        is3Clicked = true
    }
    
    var is4Clicked: Bool = false
    @IBAction func button4(_ sender: Any) {
        picker4.delegate = self
        picker4.allowsEditing = true
        present(picker4, animated: true, completion: nil)
        i = 3
        is4Clicked = true
    }
    
    
    
    
    @IBOutlet weak var saveImageButton1: UIButton! {
        
            didSet {
              //  if(is1Clicked == true){
                saveImageButton1.addTarget(self,
                                           action: #selector(ViewController30.save1),
                                           for: .touchUpInside)
                print("saved!")
          //  }
        }
   }
    
    
    @IBOutlet weak var saveImageButton2: UIButton!{
        didSet {
            //if(is2Clicked == true){
                saveImageButton2.addTarget(self,
                                           action: #selector(ViewController30.save2),
                                           for: .touchUpInside)
                
         //   }
        }
    }
    
    
    @IBOutlet weak var saveImageButton3: UIButton! {
        didSet {
           // if(is3Clicked == true){
                saveImageButton3.addTarget(self,
                                           action: #selector(ViewController30.save3),
                                           for: .touchUpInside)
                
           // }
        }
    }
    
    @IBOutlet weak var saveImageButton4: UIButton! {
        didSet {
           // if(is4Clicked == true){
                saveImageButton4.addTarget(self,
                                           action: #selector(ViewController30.save4),
                                           for: .touchUpInside)
                
            }
       // }
    }
    
 
    
    @IBAction func openViewController2(_ sender: Any) {
        let dataOne = image1.image
        let dataTwo = image2.image
        let dataThree = image3.image
        let dataFour = image4.image
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        vc.data = dataOne
        vc.data2 = dataTwo
        vc.data3 = dataThree
        vc.data4 = dataFour
        vc.saved = true
        self.navigationController?.pushViewController(vc, animated: true)
        print("TRANSFERRED")
        dismiss(animated: true, completion: nil )
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
        
        guard let image = info[.editedImage] as? UIImage else {return}
        if(i == 0){
            image1.image = image
        }
        if(i == 1){
            image2.image = image
        }
        if(i == 2){
            image3.image = image
        }
        if(i == 3){
            image4.image = image
        }
        dismiss(animated: true)
        
    }
}
