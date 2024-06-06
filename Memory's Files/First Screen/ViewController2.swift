import UIKit
import SwiftUI




class ViewController2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    var data: UIImage?
    var data2: UIImage?
    var data3: UIImage?
    var data4: UIImage?
    
    
    /*
  
     */
    
    
    
    
    var saved: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGreen

               // Add the toolbar to the top of the view
              
    
        
        
        savedImageDisplayImageView1?.image = data
        savedImageDisplayImageView2?.image = data2
        savedImageDisplayImageView3?.image = data3
        savedImageDisplayImageView4?.image = data4
        
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String1",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView1.image = savedImage
                }
            }
           
            //self.j += 1
        }
        
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String2",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView2.image = savedImage
                }
            }
           
            //self.j += 1
        }
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String3",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView3.image = savedImage
                }
            }
           
            //self.j += 1
        }
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String4",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView4.image = savedImage
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
                       forKey: "YOPE",
                       withStorageType: .fileSystem)
            //self.i += 1
        }
    }
   // var j: Int = 0
    @objc
    func display1() {
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String1",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView1.image = savedImage
                }
            } 
           
            //self.j += 1
        }
    }
    @objc
    func display2() {
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String2",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView2.image = savedImage
                }
            }
           
            //self.j += 1
        }
    }
    @objc
    func display3() {
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String3",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView3.image = savedImage
                }
            }
           
            //self.j += 1
        }
    }
    @objc
    func display4() {
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String4",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView4.image = savedImage
                }
            }
           
            //self.j += 1
        }
    }

    

    
    @IBOutlet weak var savedImageDisplayImageView1: UIImageView!
    

    @IBOutlet weak var savedImageDisplayImageView2: UIImageView!
    
    
    @IBOutlet weak var savedImageDisplayImageView3: UIImageView!
    
    
    @IBOutlet weak var savedImageDisplayImageView4: UIImageView!
    
    
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
    
    @IBAction func openViewController30(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController30") as! ViewController30
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    

    

    
     
    
}
