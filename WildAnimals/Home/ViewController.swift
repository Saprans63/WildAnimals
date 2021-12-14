//
//  ViewController.swift
//  collectionView@
//
//  Created by Apple user on 22/11/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    weak var collectionView: UICollectionView!
    var model: [Model] = []
    
    override func loadView() {
        super.loadView()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(cv)
        
        cv.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
            make.bottom.equalToSuperview()
        }
        self.collectionView = cv
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "ANIMALS"
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        
        model = AttData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row) == 0 {
            Elephants()
        }else if (indexPath.row) == 1{
            RhinosView()
        }else if (indexPath.row) == 2{
            Lions()
        }else if (indexPath.row) == 3{
            Jaguars()
        }else if (indexPath.row) == 4{
            Orangutans()
        }else if (indexPath.row) == 5{
            Pandas()
        }else if (indexPath.row) == 6{
            Pangolins()
        }else if (indexPath.row) == 7{
            PolarBears()
        }
    }
    
    func Elephants() {
        let controller = ElephantsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func RhinosView() {
        let controller = RhinosViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func Lions() {
        let controller = LionViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func Jaguars() {
        let controller = JaguarsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func Orangutans() {
        let controller = OrangutansViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func Pandas() {
        let controller = PandasViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func Pangolins() {
        let controller = PangolinsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func PolarBears() {
        let controller = PolarBearsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        let model = model[indexPath.row]
        cell.set(model: model)
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.size.width - 200, height: 150)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width/2.07), height: (collectionView.frame.size.height/4))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    }
}



extension ViewController {
    func AttData() -> [Model]{
        
        let data1 = Model(title: "ELEPHANTS", image: Imades.foto1)
        let data2 = Model(title: "RHINOS   ", image: Imades.foto2)
        let data3 = Model(title: "LIONS", image: Imades.foto3)
        let data4 = Model(title: "JAGUARS", image: Imades.foto4)
        let data5 = Model(title: "ORANGUTANS", image: Imades.foto5)
        let data6 = Model(title: "PANDAS", image: Imades.foto6)
        let data7 = Model(title: "TIGERS", image: Imades.foto7)
        let data8 = Model(title: "POLAR BEARS", image: Imades.foto8)
        
        
        
        return [data1, data2, data3, data4, data5, data6, data7, data8]
    }
}
