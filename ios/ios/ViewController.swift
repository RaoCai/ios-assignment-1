import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var pickerview: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!

    let converter = SizeConverter()
    let sizes = ["1/4\"", "1/2\"", "3/4\""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerview.delegate = self
        pickerview.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sizes[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedSize = sizes[row]
        let metricSize = converter.convertSize(imperialSize: selectedSize)
        resultLabel.text = metricSize
    }
}
