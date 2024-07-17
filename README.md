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
```

