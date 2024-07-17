#include "unsafe.h"

VALUE rb_mUnsafe;

VALUE array_aref(VALUE self, VALUE array, VALUE idx) {
    return RARRAY_PTR(array)[FIX2LONG(idx)];
}

RUBY_FUNC_EXPORTED void
Init_unsafe(void)
{
  rb_mUnsafe = rb_define_module("Unsafe");

  rb_define_singleton_method(rb_mUnsafe, "array_aref", array_aref, 2);
}
