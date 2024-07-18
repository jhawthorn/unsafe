# frozen_string_literal: true

require_relative "unsafe/version"
require_relative "unsafe/unsafe"

module Unsafe
end

module Kernel
  def unsafe
    was_unsafe = Thread.current[:__unsafe]
    Thread.current[:__unsafe] = true
    ret = yield
    Thread.current[:__unsafe] = was_unsafe
    ret
  end
end

Module.new do
  def [](...)
    if Thread.current[:__unsafe]
      Unsafe.array_aref(self, ...)
    else
      super
    end
  end

  Array.prepend self
end

Module.new do
  def [](...)
    if Thread.current[:__unsafe]
      Unsafe.string_aref(self, ...)
    else
      super
    end
  end

  String.prepend self
end
