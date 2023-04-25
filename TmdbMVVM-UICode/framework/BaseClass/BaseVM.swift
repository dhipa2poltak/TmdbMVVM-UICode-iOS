//
//  BaseVM.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation

class BaseVM: NSObject {

    let isShowDialogLoading = Box(false)
    var isLoadingData = false

    let errorMessage = Box("")
}
