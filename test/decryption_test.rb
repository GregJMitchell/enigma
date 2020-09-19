require './test/test_helper'
require './lib/decryption'

class DecryptionTest < Minitest::Test
  def test_it_exists
    message = ''
    key = '0'
    date = '0'
    decryption = Decryption.new(message, key, date)

    assert_instance_of Decryption, decryption
  end
end