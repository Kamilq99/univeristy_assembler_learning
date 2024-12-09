IL_0000: 28 0700000A call string [mscorlib]System.Console::ReadLine()
IL_0005: 28 0800000A call int32 [mscorlib]System.Convert::ToInt32(string)
IL_000a: 0A stloc.0
IL_000b: 16 ldc.i4.0
IL_000c: 0B stloc.1
IL_000d: 2B 14 br.s IL_0023
IL_000f: 07 ldloc.1
IL_0010: 17 ldc.i4.1
IL_0011: 58 add
IL_0012: 0B stloc.1
IL_0013: 72 01000070 ldstr "{0} Lorem ipsum"
IL_0018: 07 ldloc.1
IL_0019: 8C 0C000001 box [mscorlib]System.Int32
IL_001e: 28 0900000A call void [mscorlib]System.Console::WriteLine(string, object)
IL_0023: 07 ldloc.1
IL_0024: 06 ldloc.0
IL_0025: 32 EE blt.s IL_000f
IL_0021: 16 ldc.i4.0
IL_0022: 2A ret
IL_0023: 00 nop
