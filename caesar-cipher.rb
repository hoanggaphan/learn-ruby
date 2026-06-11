require_relative './utils'

def caesar_cipher(string, shift)
    string.chars.map { |char| Utils.shift_char(char, shift) }.join
end

p caesar_cipher("abcxyz", 1)
p caesar_cipher("ABCXYZ", 1)
p caesar_cipher("ab-cd", 1)
