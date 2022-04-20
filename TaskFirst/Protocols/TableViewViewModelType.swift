//
//  TableViewViewModelType.swift
//  TaskFirst
//
//  Created by Максим Михеев on 20.04.2022.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRowsInActual() -> Int
    func numberOfRowsInFiltred() -> Int
    
    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
