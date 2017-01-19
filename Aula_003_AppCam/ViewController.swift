import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: OUTLETS
    @IBOutlet weak var minhaImageView: UIImageView!
    
    //MARK: PROPRIEDADES
    let minhaImagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minhaImagePicker.delegate = self

    }
    //MARK: ACTION
    @IBAction func acessar(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            minhaImagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present(minhaImagePicker, animated: true)
        } else {
            let alerta = UIAlertController(title: "Erro", message: "Voce não possui camera disponivel", preferredStyle: UIAlertControllerStyle.alert)
            let acao = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            alerta.addAction(acao)
            present(alerta, animated: true)
        }
        
    }
    
    //MARK: PICKER DELEGATE
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        let alerta = UIAlertController(title: "Erro", message: "Cancelou a Foto", preferredStyle: UIAlertControllerStyle.alert)
        let acao = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        alerta.addAction(acao)
        present(alerta, animated: true)
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imagemEscolhida = info[UIImagePickerControllerOriginalImage] as! UIImage
        minhaImageView.image = imagemEscolhida
        picker.dismiss(animated: true)
        
    }

}

