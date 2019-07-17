require 'ffi'

# :nodoc: namespace
class XDo

# FFI to the raw libxdo functions.
module FFILib
  extend FFI::Library

  begin
    ffi_lib 'libxdo.so.3'
  rescue FFI::NotFoundError, LoadError
    ffi_lib 'libxdo.so'
  end

  # :nodoc: lifted from xdo.h
  class XDoContext < FFI::Struct
    layout :xdpy, :pointer,
           :display_name, :string,
           :charcodes, :pointer,
           :charcodes_len, :int,
           :modmap, :pointer,
           :keymap, :pointer,
           :keycode_high, :int,
           :keycode_low, :int,
           :keysyms_per_keycode, :int,
           :close_display_when_freed, :int,
           :quiet, :int,
           :debug, :int,
           :features_mask, :int
  end  # class XDo::FFILib::XDoContext

  # :nodoc: lifted from xdo.h
  class XDoSearch < FFI::Struct
    layout :title, :pointer,
           :winclass, :pointer,
           :winclassname, :pointer,
           :winname, :pointer,
           :pid, :int,
           :max_depth, :long,
           :only_visible, :int,
           :screen, :int,
           :require, :int,
           :searchmask, :int,
           :desktop, :long,
           :limit, :uint
  end  # class XDo::FFILib::XDoSearch

  # :nodoc: Window from X11/X.h (Window -> XID -> unsigned long)
  typedef :ulong, :window
  # :nodoc: useconds_t from sys/types.h
  typedef :ulong, :useconds_t
end  # module XDo::FFILib

end  # namespace XDo
