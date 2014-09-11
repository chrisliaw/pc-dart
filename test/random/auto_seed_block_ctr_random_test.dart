// Copyright (c) 2013, Iván Zaera Avellón - izaera@gmail.com
// Use of this source code is governed by a LGPL v3 license.
// See the LICENSE file for more information.

library cipher.test.random.auto_seed_block_ctr_random_test;

import "dart:typed_data";

import "package:cipher/cipher.dart";

import "package:unittest/unittest.dart";

void main() {

  initCipher();

  group( "AutoSeedBlockCtrRandom:", () {

    final rnd = new SecureRandom("AES/CTR/AUTO-SEED-PRNG");

    test( "${rnd.algorithmName}", () {

      final key = new Uint8List(16);
      final keyParam = new KeyParameter(key);
      final params = new ParametersWithIV(keyParam, new Uint8List(16));

      rnd.seed(params);

      final firstExpected = [102, 233, 75, 212, 239, 138, 44, 59, 136, 76, 250, 89, 202, 52, 43, 46, 88];
      var firstBytes = rnd.nextBytes(17);
      expect( firstBytes, firstExpected );

      final lastExpected = [156, 238, 41, 193, 135, 66, 23, 87, 208, 14, 88, 227, 93, 31, 171, 110, 221];
      var lastBytes = rnd.nextBytes(17);
      expect( lastBytes, lastExpected );

    });

  });
}

