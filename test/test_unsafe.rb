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
end
