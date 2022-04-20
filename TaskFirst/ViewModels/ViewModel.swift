//
//  ViewModel.swift
//  TaskFirst
//
//  Created by Максим Михеев on 20.04.2022.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    var members = [Member]()
    var filtred = [Member]()
    
    func numberOfRowsInActual() -> Int {
        return members.count
    }
    
    func numberOfRowsInFiltred() -> Int {
        return filtred.count
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(members: members[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}

