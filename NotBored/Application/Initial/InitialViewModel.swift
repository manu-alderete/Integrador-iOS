//
//  InitialViewModel.swift
//  NotBored
//
//  Created by Manuel Tomas Alderete Jabif on 21/09/2021.
//

import Foundation

final class InitialViewModel {
    
    var participants: Int? = nil {
        didSet {
            onParticipantsValueChange?(participants)
        }
    }
    
    var onParticipantsValueChange: ((Int?)->Void)? = nil
}
