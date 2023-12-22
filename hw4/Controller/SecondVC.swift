import UIKit
import SnapKit



class SecondVC: UIViewController, UITableViewDataSource {
    
    private let cell = "NotificationCell"
    private let tableView = UITableView()
    
    private let users: [NotificationModel] = [
        .init(
            userImage: "useriMG1", userTitle: "Jane Cooper has published a new recipe!",
            userData: "Today | 09:24 AM", userFoodImage: "userFood1"
        ),
        .init(
            userImage: "useriMG2", userTitle: "Rochel has commented on your recipe",
            userData: "1 day ago | 14:43 PM", userFoodImage: "userFood2"
        ),
        .init(
            userImage: "useriMG3", userTitle: "Brad Wigington liked your comment",
            userData: "1 day ago | 09:29 AM", userFoodImage: "userFood3"
        ),
        .init(
            userImage: "useriMG4", userTitle: "Tyra Ballentine has published a new recipe!",
            userData: "2 days ago | 10:29 AM", userFoodImage: "userFood4"
        ),
        .init(
            userImage: "useriMG5", userTitle: "Marci Winkles has published a new recipe!",
            userData: "3 days ago | 16:52 PM", userFoodImage: "userFood5"
        ),
        .init(
            userImage: "useriMG6", userTitle: "Aileen has commented on your recipe",
            userData: "4 days ago | 14:27 PM", userFoodImage: "userFood6"
        ),
        .init(
            userImage: "useriMG7", userTitle: "George has commented on your recipe",
            userData: "5 days ago | 09:20 AM", userFoodImage: "userFood7"
        ),
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    
    private func initUI() {
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: cell)
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension SecondVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! NotificationTableViewCell
        cell.setupDataCell(
            userIMG: users[indexPath.row].userImage,
            userTitle: users[indexPath.row].userTitle,
            userData: users[indexPath.row].userData,
            userFoodImage: users[indexPath.row].userFoodImage
        )
        return cell
    }
    
}
