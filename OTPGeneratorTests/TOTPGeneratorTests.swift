//
//  TOTPGeneratorTests.swift
//
// Copyright 2015 Codewise sp. z o.o. Sp. K.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import XCTest
@testable import OTPGenerator

class TOTPGeneratorTests: XCTestCase {

    let intervals: [TimeInterval] = [59, 1111111109, 1111111111, 1234567890, 2000000000, 20000000000]
    let algorithms = [OTPAlgorithm.sha1, OTPAlgorithm.sha256, OTPAlgorithm.sha512, OTPAlgorithm.md5]
    let results = [
        // SHA1    SHA256    SHA512     MD5
        "287082", "247374", "342147", "532013",
        "081804", "756375", "049338", "672061",
        "050471", "584430", "380122", "275841",
        "005924", "829826", "671578", "280616",
        "279037", "428693", "464532", "090484",
        "353130", "142410", "481994", "935991"
    ]

    func testInitOK() {
        let generator = TOTPGenerator(secret: "GEZDGNBVGY3TQOJQGEZDGNBVGY3TQOJQ", period: 30, pinLength: 1, algorithm: .sha1)
        XCTAssertNotNil(generator)
    }

    func testInitFail() {
        let generator1 = TOTPGenerator(secret: "abc", period: 30, pinLength: 0, algorithm: .sha1)
        let generator2 = TOTPGenerator(secret: "abc", period: 0, pinLength: 6, algorithm: .sha1)
        XCTAssertNil(generator1)
        XCTAssertNil(generator2)
    }

    func testDefaultGeneratorToken() {
        let generator = TOTPGenerator(secret: "GEZDGNBVGY3TQOJQGEZDGNBVGY3TQOJQ", period: 30, pinLength: 6, algorithm: .sha1)
        let token = generator?.generateOTP()
        XCTAssertNotNil(token)
    }

    // https://tools.ietf.org/rfc/rfc6238.txt
    // SHA values verified with OATH Toolkit
    // http://oath-toolkit.nongnu.org/oathtool.1.html
    func testTokenResults() {
        var i = 0
        for interval in intervals {
            for algorithm in algorithms {
                let generator = TOTPGenerator(secret: "GEZDGNBVGY3TQOJQGEZDGNBVGY3TQOJQ", period: 30, pinLength: 6, algorithm: algorithm)
                let date = Date(timeIntervalSince1970: interval)
                XCTAssertEqual(results[i], generator!.generateOTP(date: date), "Invalid results \(interval) - \(algorithm)")
                i += 1
            }
        }
    }

}
