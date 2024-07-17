# Unsafe

```
$ gem i unsafe
$ irb
>> require "unsafe"
>> arr = [1,2,3]
=> [1, 2, 3]
>> unsafe { arr[1] }
=> 2
>> unsafe { arr[2] }
=> 3
>> unsafe { arr[3] }
=> 2.000000000000003
>> unsafe { arr[-1] }
=> Array
>> unsafe { arr[1000000000] }
[BUG] Segmentation fault at 0x00000002f89824d0

-- Crash Report log information --------------------------------------------
   See Crash Report log file in one of the following locations:
```

