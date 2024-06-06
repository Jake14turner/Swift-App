import UIKit
import SwiftUI




class ViewController101: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    let picker9 = UIImagePickerController()
    let picker10 = UIImagePickerController()
    let picker11 = UIImagePickerController()
    let picker12 = UIImagePickerController()
    
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
            if let imageData3 = UserDefaults.standard.object(forKey: key) as? Data,
               let image3 = UIImage(data: imageData3) {
                
                return image3
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
    func save9() {
        guard let image = image9.image else {
               print("No image selected for image9")
               return
           }
        DispatchQueue.global(qos: .background).async {
            self.store(image: self.image9.image!,
                       forKey: "String9",
                       withStorageType: .fileSystem)
         //   self.i += 1
        }
    }
    @objc
    func save10(){
        guard let image = image10.image else {
               print("No image selected for image10")
               return
           }
        DispatchQueue.global(qos: .background).async {
            self.store(image: self.image10.image!,
                       forKey: "String10",
                       withStorageType: .fileSystem)
         //   self.i += 1
        }
    }
    @objc
    func save11(){
        guard let image = image11.image else {
               print("No image selected for image1")
               return
           }
        DispatchQueue.global(qos: .background).async {
            self.store(image: self.image11.image!,
                       forKey: "String11",
                       withStorageType: .fileSystem)
         //   self.i += 1
        }
    }
    @objc
    func save12(){
        guard let image = image12.image else {
               print("No image selected for image12")
               return
           }
        DispatchQueue.global(qos: .background).async {
            self.store(image: self.image12.image!,
                       forKey: "String12",
                       withStorageType: .fileSystem)
         //   self.i += 1
        }
    }
        
    
    @IBOutlet weak var image9: UIImageView!
    
    @IBOutlet weak var image10: UIImageView!
    
    @IBOutlet weak var image11: UIImageView!
    
    @IBOutlet weak var image12: UIImageView!
    
    var is1Clicked: Bool = false
    @IBAction func button1(_ sender: Any) {
        
        picker9.delegate = self
        picker9.allowsEditing = true
        present(picker9, animated: true, completion: nil)
        i = 0
        is1Clicked = true
    }
    
    var is2Clicked: Bool = false
    @IBAction func button2(_ sender: Any) {
        picker10.delegate = self
        picker10.allowsEditing = true
        present(picker10, animated: true, completion: nil)
        i = 1
        is2Clicked = true
    }
    
    var is3Clicked: Bool = false
    @IBAction func button3(_ sender: Any) {
        picker11.delegate = self
        picker11.allowsEditing = true
        present(picker11, animated: true, completion: nil)
        i = 2
        is3Clicked = true
    }
    
    var is4Clicked: Bool = false
    @IBAction func button4(_ sender: Any) {
        picker12.delegate = self
        picker12.allowsEditing = true
        present(picker12, animated: true, completion: nil)
        i = 3
        is4Clicked = true
    }
    
    
    
    
    @IBOutlet weak var saveImageButton1: UIButton! {
        
            didSet {
               // if(is1Clicked == true){
                saveImageButton1.addTarget(self,
                                           action: #selector(ViewController101.save9),
                                           for: .touchUpInside)
                print("saved!")
            //}
        }
   }
    
    
    @IBOutlet weak var saveImageButton2: UIButton!{
        didSet {
            //if(is2Clicked == true){
                saveImageButton2.addTarget(self,
                                           action: #selector(ViewController101.save10),
                                           for: .touchUpInside)
                
            //}
        }
    }
    
    
    @IBOutlet weak var saveImageButton3: UIButton! {
        didSet {
           // if(is3Clicked == true){
                saveImageButton3.addTarget(self,
                                           action: #selector(ViewController101.save11),
                                           for: .touchUpInside)
                
        //    }
        }
    }
    
    @IBOutlet weak var saveImageButton4: UIButton! {
        didSet {
           // if(is4Clicked == true){
                saveImageButton4.addTarget(self,
                                           action: #selector(ViewController101.save12),
                                           for: .touchUpInside)
                
         //   }
        }
    }
    
 
    
    @IBAction func openViewController100(_ sender: Any) {
        let dataNine = image9.image
        let dataTen = image10.image
        let dataEleven = image11.image
        let dataTwelve = image12.image
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController100") as! ViewController100
        vc.data9 = dataNine
        vc.data10 = dataTen
        vc.data11 = dataEleven
        vc.data12 = dataTwelve
        vc.saved = true
        self.navigationController?.pushViewController(vc, animated: true)
        print("TRANSFERRED")
        dismiss(animated: true, completion: nil )
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
        
        guard let image = info[.editedImage] as? UIImage else {return}
        if(i == 0){
            image9.image = image
        }
        if(i == 1){
            image10.image = image
        }
        if(i == 2){
            image11.image = image
        }
        if(i == 3){
            image12.image = image
        }
        dismiss(animated: true)
        
    }
    
}

