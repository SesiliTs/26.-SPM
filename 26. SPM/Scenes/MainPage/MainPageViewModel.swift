//
//  MainPageViewModel.swift
//  26. SPM
//
//  Created by Sesili Tsikaridze on 19.11.23.
//

import Foundation
import NetworkManager

protocol MainPageViewModelDelegate: AnyObject {
    func factsFetched(_ facts: [CatFact])
}

final class MainPageViewModel {

    var delegate: MainPageViewModelDelegate?
    private var facts: [CatFact]?
    private let url = "https://catfact.ninja/facts"
    
    func viewDidLoad() {
        fetchMovies()
    }

    func fetchMovies() {
        NetworkService.shared.getData(urlString: url) { [weak self] (result: Result<Response, Error>) in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.facts = data.data
                self.delegate?.factsFetched(data.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
