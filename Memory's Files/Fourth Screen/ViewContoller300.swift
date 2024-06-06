import UIKit
import SwiftUI




class ViewController300: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    
    var data5: UIImage?
    var data6: UIImage?
    var data7: UIImage?
    var data8: UIImage?
    var saved: Bool = false



    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGreen

               // Add the toolbar to the top of the view
              

        
        
        savedImageDisplayImageView5?.image = data5
        savedImageDisplayImageView6?.image = data6
        savedImageDisplayImageView7?.image = data7
        savedImageDisplayImageView8?.image = data8
        
        DispatchQueue.global(qos: .background).async {
            if let savedImage2 = self.retrieveImage(forKey: "String5",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView5.image = savedImage2
                }
            }
           
            //self.j += 1
        }
        
        DispatchQueue.global(qos: .background).async {
            if let savedImage2 = self.retrieveImage(forKey: "String6",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView6.image = savedImage2
                }
            }
           
            //self.j += 1
        }
        DispatchQueue.global(qos: .background).async {
            if let savedImage2 = self.retrieveImage(forKey: "String7",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView7.image = savedImage2
                }
            }
           
            //self.j += 1
        }
        DispatchQueue.global(qos: .background).async {
            if let savedImage2 = self.retrieveImage(forKey: "String8",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView8.image = savedImage2
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
                       forKey: "YOPE2",
                       withStorageType: .fileSystem)
            //self.i += 1
        }
    }
    // var j: Int = 0
    @objc
    func display5() {
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String5",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView5.image = savedImage
                }
            }
           
            //self.j += 1
        }
    }
    @objc
    func display6() {
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String6",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView6.image = savedImage
                }
            }
           
            //self.j += 1
        }
    }
    @objc
    func display7() {
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String7",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView7.image = savedImage
                }
            }
           
            //self.j += 1
        }
    }
    @objc
    func display8() {
        DispatchQueue.global(qos: .background).async {
            if let savedImage = self.retrieveImage(forKey: "String8",inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    self.savedImageDisplayImageView8.image = savedImage
                }
            }
           
            //self.j += 1
        }
    }




    @IBOutlet weak var savedImageDisplayImageView5: UIImageView!


    @IBOutlet weak var savedImageDisplayImageView6: UIImageView!


    @IBOutlet weak var savedImageDisplayImageView7: UIImageView!


    @IBOutlet weak var savedImageDisplayImageView8: UIImageView!


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

    @IBAction func openViewController301(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController301") as! ViewController301
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }



    
}


