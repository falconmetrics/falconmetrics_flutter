package io.falconmetrics.falconmetrics_flutter

import io.falconmetrics.sdk.UserData
import pb.Userdata
import kotlin.test.Test
import kotlin.test.assertEquals

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
class ConvertProtobufUserDataTest {

    @Test
    fun `It converts Userdata`() {
        var pbData = Userdata.UserData.newBuilder()
        pbData.email = "foo@bar.com"
        pbData.phoneNumber = "1234"
        pbData.firstName = "First"
        pbData.lastName = "Last"
        pbData.dateOfBirth = "20-10-1990"
        pbData.city = "City"
        pbData.state = "State"
        pbData.postalCode = "12345"
        pbData.country = "Country"


        val result = convertUserData(pbData.build())

        assertEquals(
            result, UserData(
                email = "foo@bar.com",
                phoneNumber = "1234",
                firstName = "First",
                lastName = "Last",
                dateOfBirth = "20-10-1990",
                city = "City",
                state = "State",
                postalCode = "12345",
                country = "Country",
                )
        )
    }
}