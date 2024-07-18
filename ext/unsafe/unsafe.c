#include "unsafe.h"

VALUE rb_mUnsafe;

VALUE array_aref(VALUE self, VALUE array, VALUE idx) {
    return RARRAY_PTR(array)[FIX2LONG(idx)];
}

VALUE string_aref(int argc, VALUE *argv, VALUE self) {
    long idx, len = 1;
    if (argc == 3) {
        len = NUM2INT(argv[2]);
    } else {
        rb_check_arity(argc, 2, 3);
    }
    VALUE string = argv[0];
    idx = NUM2INT(argv[1]);

    return rb_str_new(RSTRING_PTR(string) + idx, len);
}

RUBY_FUNC_EXPORTED void
Init_unsafe(void)
{
  rb_mUnsafe = rb_define_module("Unsafe");

  rb_define_singleton_method(rb_mUnsafe, "array_aref", array_aref, 2);
  rb_define_singleton_method(rb_mUnsafe, "string_aref", string_aref, -1);
}
