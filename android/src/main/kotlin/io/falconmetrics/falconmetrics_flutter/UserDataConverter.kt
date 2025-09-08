package io.falconmetrics.falconmetrics_flutter

import io.falconmetrics.sdk.UserData
import pb.Userdata

/*
 * FalconMetrics SDK
 *
 * © 2025 FalconMetrics LLC. All rights reserved.
 *
 * This file is part of the FalconMetrics SDK and is licensed under the
 * FalconMetrics SDK License Addendum.
 *
 * Use of this file is subject to the FalconMetrics Terms of Use and SDK License,
 * available at: https://www.falconmetrics.io/terms
 */
fun convertUserData(userData: Userdata.UserData?): UserData? {
    if (userData == null) {
        return null
    }
    return UserData(
        email = userData.email,
        phoneNumber = userData.phoneNumber,
        firstName = userData.firstName,
        lastName = userData.lastName,
        dateOfBirth = userData.dateOfBirth,
        city = userData.city,
        state = userData.state,
        postalCode = userData.postalCode,
        country = userData.country,
    )
}