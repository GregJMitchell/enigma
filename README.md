# Enigma

## Encryption
The encryption is based on the Caesar Cipher. The idea is that we can translate a character by shifting it a certain number of places down the alphabet. For more on the Caesar cipher, See [This Description](http://practicalcryptography.com/ciphers/caesar-cipher/) or the [Wikipedia Page](https://en.wikipedia.org/wiki/Caesar_cipher)

However, instead of using the same shift for every character, our algorithm will use 4 different shifts known as the A, B, C, and D shifts. Every fourth character will be shifted by the same amount, so the 1st, 5th, and 9th characters will be shifted with the A shift, the 2nd, 6th, and 10th characters will be shifted with the B shift, etc.

## How to Use
Add the message you want to be encrypted to the a file. In this example it is called 'message.txt'. Then give it a target file to write to. We are using 'encrypted.txt'. This will write the encrypted code to the encrypted.txt file and generate a key and date. The date will be todays days date in the pattern DD/MM/YY.
```
$ ruby encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
```
To decrypt code, simply create a target file to decrypt to, for our example we are using 'decrypted.txt'. Then, run the decrypt runner and give the encrypted.txt file as the first command line argument, the target file as the second, the key generated during encryption third, and the date given during encryption last.
```
$ ruby decrypt.rb encrypted.txt decrypted.txt 82648 240818
Created 'decrypted.txt' with the key 82648 and date 240818
```
