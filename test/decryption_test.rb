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

  def test_it_has_readable_attributes
    message = ''
    key = '0'
    date = '0'
    decryption = Decryption.new(message, key, date)

    assert_equal '', decryption.message
    assert_equal '0', decryption.key
    assert_equal '0', decryption.date
  end

  def test_it_can_decrypt_messages
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }
    decryption = Decryption.new('keder ohulw', '02715', '040895')

    assert_equal expected, decryption.decrypt
  end
end
