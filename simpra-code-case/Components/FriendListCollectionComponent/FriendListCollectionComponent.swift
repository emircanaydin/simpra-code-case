//
//  FriendListCollectionComponent.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 9.08.2023.
//

import UIKit

class FriendListCollectionComponent: GenericBaseView<FriendListCollectionComponentData> {
    private weak var delegate: FriendListCollectionComponentDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        collection.keyboardDismissMode = .onDrag
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.genericRegisterCell(FriendContentDisplayerCollectionViewCell.self)
        collection.genericRegisterCell(LoadingCellView.self)
        return collection
    }()
    
    private lazy var pullToRefresh: UIRefreshControl = {
        let temp = UIRefreshControl()
        temp.addTarget(self, action: .pullToRefreshAction, for: .valueChanged)
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        addPullToRefresh()
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        addCollectionView()
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addPullToRefresh() {
        guard let data = returnData(), data.isRefreshingSupported else { return }
        collectionView.refreshControl = pullToRefresh
    }
    
    func setupDelegation(with delegate: FriendListCollectionComponentDelegate) {
        self.delegate = delegate
    }
    
    func reloadCollectionComponent() {
        DispatchQueue.main.async { [weak self] in
            self?.pullToRefresh.endRefreshing()
            self?.collectionView.reloadData()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
    
    @objc fileprivate func pullToRefreshAction(_ sender: UIRefreshControl) {
        pullToRefresh.beginRefreshing()
        guard pullToRefresh.isRefreshing else { return }
        delegate?.refreshCollectionView()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource -
extension FriendListCollectionComponent: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate?.getNumberOfSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getItemCount(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isLoadingCell(for: indexPath) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCellView.identifier, for: indexPath) as? LoadingCellView else { fatalError() }
            return cell
        } else {
            guard let data = delegate?.getData(at: indexPath.row) else { fatalError() }
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendContentDisplayerCollectionViewCell.identifier, for: indexPath) as? FriendContentDisplayerCollectionViewCell else { fatalError() }
            cell.setRowData(data: data)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }
}

extension FriendListCollectionComponent: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 20)
        return CGSize(width: width, height: 150)
    }
}

// MARK: - Selector
fileprivate extension Selector {
    static let pullToRefreshAction = #selector(FriendListCollectionComponent.pullToRefreshAction)
}
