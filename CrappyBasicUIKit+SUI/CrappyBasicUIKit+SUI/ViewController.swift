//
//  ViewController.swift
//  CrappyBasicUIKit+SUI
//
//  Created by Саша Василенко on 21.11.2022.
//

import UIKit
import SwiftUI

struct Model {
    let name: String
    let surname: String
    let smthElse: String
}

class ViewController: UIViewController {
    let hostingVC = UIHostingController(rootView: SUIImage())
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let mokData: [Model] = [Model(name: "Sasha", surname: "Vasylenko", smthElse: "Sas"), Model(name: "sas", surname: "says", smthElse: "Bruh"), Model(name: "Igor", surname: "Not Igor", smthElse: "Still Igor"), Model(name: "Dmytro", surname: "Ostapchenko", smthElse: "I hope surname is right :)")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHostingVC()
        setupTableView()
        view.addSubview(stackView)
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hostingVC.view, tableView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
}

private extension ViewController {
    func setupHostingVC() {
        hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(hostingVC)
        hostingVC.didMove(toParent: self)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mokData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = mokData[indexPath.row].name
        cell.detailTextLabel?.text = mokData[indexPath.row].surname
        return cell
    }
}




struct ViewControllerProvider: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
            return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerProvider()
    }
}
