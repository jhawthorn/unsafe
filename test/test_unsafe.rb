# frozen_string_literal: true

require "test_helper"

class TestUnsafe < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Unsafe::VERSION
  end

  def test_array_aref
    arr = [1,2,3]

    # Regular safe use
    assert_equal 1, arr[0]
    assert_equal 2, arr[1]
    assert_equal 3, arr[2]
    assert_equal 3, arr[-1]
    assert_equal 2, arr[-2]
    assert_nil arr[3]
    assert_nil arr[4]

    assert_equal 1, unsafe { arr[0] }
    assert_equal 2, unsafe { arr[1] }
    assert_equal 3, unsafe { arr[2] }
    assert_equal Array, unsafe { arr[-1] }
  end

  def test_string_aref
    str = "hello, world"

    assert_equal "h", str[0]
    assert_nil str[12]
    assert_equal "d", str[-1]
    assert_equal "hello, world", str[0, 12]
    assert_equal "hello, world", str[0, 13]
    assert_equal Encoding::UTF_8, str[0, 12].encoding

    assert_equal "h", unsafe { str[0] }
    assert_equal "\x00", unsafe { str[12] }
    assert_equal 12, unsafe { str[-8, 8] }.unpack1("Q")
    assert_equal "hello, world", unsafe { str[0, 12] }
    assert_equal "hello, world\x00", unsafe { str[0, 13] }
    assert_equal Encoding::BINARY, unsafe { str[0, 12] }.encoding
  end
end
