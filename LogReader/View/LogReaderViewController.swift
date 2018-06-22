//
//  LogReaderViewController.swift
//  LogReader
//
//  Created by Lin Sheng on 2018/6/22.
//

import UIKit

class LogReaderViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    var data: [Substring] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "LOG"
        self.createTableView()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.getData()
        }
        self.getData()
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LogReader.share.isShowAllWindow = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LogReader.share.isShowAllWindow = false
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func createTableView() {
        self.tableView.frame = self.view.bounds
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(LogReaderTableViewCell.self, forCellReuseIdentifier: "LogReaderTableViewCell")
    }
    
    private func getData() {
        do {
            if let filePath = LogReader.share.filePath {
                let text = try String.init(contentsOfFile: filePath, encoding: .utf8)
                self.data = text.split(separator: "\n")
            }
        } catch  {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LogReaderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // FIXME: 重用怎么写？
        var cell: LogReaderTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "LogReaderViewController") as? LogReaderTableViewCell
        if cell == nil {
            cell = LogReaderTableViewCell(style: .default, reuseIdentifier: "LogReaderViewController")
        }
        cell!.textLabel?.text = String(self.data[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}

extension LogReaderViewController: UITableViewDelegate {
    
}
